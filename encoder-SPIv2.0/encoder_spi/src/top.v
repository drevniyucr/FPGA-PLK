/* SPI-Encoder v2.0

Нововведения:

    -Поддержка CRC32
    -Поддержка перевода кода Грея в бинарный
    -Кадр захвата данных энкодера смещен, под следующий нарастающий фронт сигнала *clk (теперь возможен разгон энкодеров!)
    -Код теперь стал модульным

Планируеммые нововведения:

    - Полностью прокоментированный код
    - Управление светодиодами, в том числе и WS2812
    - Обратная связь с ПЛК через UART
    - Возможность записи данных в СD-card

 2025 SMG */
module top(
    input clk,                   // Основной тактовый сигнал
    input encoder_data_in1,
    input encoder_data_in2,
    input encoder_data_in3,
    input encoder_data_in4,
    input encoder_data_in5,
    input encoder_data_in6,
    input encoder_data_in7,
    input encoder_data_in8,
    output reg encoder_clk1_pin,
    output reg encoder_clk2_pin, 
    output reg encoder_clk3_pin, 
    output reg encoder_clk4_pin, 
    output reg encoder_clk5_pin, 
    output reg encoder_clk6_pin, 
    output reg encoder_clk7_pin, 
    output reg encoder_clk8_pin,
    output reg spi_clk_pin,             
    output reg spi_mosi_pin,
    output reg spi_nss_pin,
    output reg LED1_PIN                  
);

    reg RS485_START,CRC_START,SPI_START;// Входящие в модули сигналы начала работы

    reg rs485_done_reg, crc_done_reg, spi_done_reg;// Входящие в модули сигналы конца работы

    wire RS485_DONE,CRC_DONE,SPI_DONE;// Исходящие из  модулей сигналы конца работы

    wire encoder_clk1, encoder_clk2, encoder_clk3, encoder_clk4,// Тактовые сигналы энкодеров
         encoder_clk5, encoder_clk6, encoder_clk7, encoder_clk8;

    wire spi_clk, spi_mosi, spi_nss; // Сигналы SPI

    wire LED1_OUT;//Отладочный сигнал

    wire[255:0] BUFF_NOCRC;
    wire[287:0] BUFF_CRC;

    //Инициализация
    initial begin 

    spi_clk_pin = 0;            
    spi_mosi_pin = 0;
    spi_nss_pin = 1;
    RS485_START = 1;
    CRC_START = 0;
    SPI_START = 0;
    LED1_PIN = 0;
    rs485_done_reg = 0; 
    crc_done_reg = 0; 
    spi_done_reg = 0; 

    end     

    //Экземпляры модулей
     rs485_reseiver rs_inst (
        .clk(clk),
        .rs485_done_reg(rs485_done_reg),
        .RS485_START(RS485_START),
        .RS485_DONE(RS485_DONE), 
        .LED1_OUT(LED1_OUT),                
        .encoder_data_in1(encoder_data_in1),
        .encoder_data_in2(encoder_data_in2),
        .encoder_data_in3(encoder_data_in3),
        .encoder_data_in4(encoder_data_in4),
        .encoder_data_in5(encoder_data_in5),
        .encoder_data_in6(encoder_data_in6),
        .encoder_data_in7(encoder_data_in7),
        .encoder_data_in8(encoder_data_in8),        
        .encoder_clk1(encoder_clk1),
        .encoder_clk2(encoder_clk2), 
        .encoder_clk3(encoder_clk3), 
        .encoder_clk4(encoder_clk4), 
        .encoder_clk5(encoder_clk5), 
        .encoder_clk6(encoder_clk6), 
        .encoder_clk7(encoder_clk7), 
        .encoder_clk8(encoder_clk8),
        .BUFF(BUFF_NOCRC)
         
    );
    crc32 scs_inst(
        .clk(clk),
        .crc_done_reg(crc_done_reg),
        .LED1_OUT(LED1_OUT), 
        .CRC_START(CRC_START),
        .CRC_DONE(CRC_DONE),
        .buff_in(BUFF_NOCRC),
        .buff_out(BUFF_CRC)
    );

    spi_transmitter spi_inst (
        .clk(clk),
        .spi_done_reg(spi_done_reg),
        .SPI_START(SPI_START),
        .SPI_DONE(SPI_DONE),
        .LED1_OUT(LED1_OUT),
        .spi_nss(spi_nss),
        .spi_clk(spi_clk),
        .spi_mosi(spi_mosi),
        .SPI_BUFF(BUFF_CRC)
    );


   // Передаем сигнал в физический пин
    always @(posedge clk) begin
        // Передаем сигнал(wire) из модулей в физический пин
        spi_clk_pin <= spi_clk;             
        spi_mosi_pin <= spi_mosi;
        spi_nss_pin <= spi_nss;
        LED1_PIN <= LED1_OUT; 
        encoder_clk1_pin <= encoder_clk1; 
        encoder_clk2_pin <= encoder_clk2; 
        encoder_clk3_pin <= encoder_clk3; 
        encoder_clk4_pin <= encoder_clk4; 
        encoder_clk5_pin <= encoder_clk5; 
        encoder_clk6_pin <= encoder_clk6; 
        encoder_clk7_pin <= encoder_clk7; 
        encoder_clk8_pin <= encoder_clk8;
        
        // Порядок работы модулей в цикле RS485->CRC->SPI->RS485
        // После завершения работы модуля, сигнал (wire)*_DONE = 1 -> (reg)*_reg = 1, после модуль опускает свой сигнал *_DONE = 0 
        // и запускает следующий модуль (wire)*_START = 1

        if (RS485_DONE) begin 
            
            RS485_START <= 0;
            rs485_done_reg <= 1;
            crc_done_reg <= 0; 
            CRC_START <= 1;

        end if (CRC_DONE) begin
          
            CRC_START <= 0;
            crc_done_reg <= 1;
            spi_done_reg <= 0;   
            SPI_START <= 1;

        end if (SPI_DONE) begin
            
            SPI_START <= 0;
            spi_done_reg <= 1;
            rs485_done_reg <= 0; 
            RS485_START <= 1;
end
        end

endmodule



module rs485_reseiver(
    input clk, // Основной тактовый сигнал

    input encoder_data_in1, input encoder_data_in2, input encoder_data_in3, input encoder_data_in4,//Входные данные с енкодеров
    input encoder_data_in5, input encoder_data_in6, input encoder_data_in7, input encoder_data_in8,  

    input rs485_done_reg,
    input RS485_START, 

    output reg encoder_clk1, output reg encoder_clk2, output reg encoder_clk3,
    output reg encoder_clk4, output reg encoder_clk5, output reg encoder_clk6, 
    output reg encoder_clk7, output reg encoder_clk8,
    
    output reg LED1_OUT,

    output reg [255:0] BUFF,

    output reg RS485_DONE 
); 

 initial begin

    BUFF = 0;
    RS485_DONE = 0;

 end

    parameter CLK_DIV_FACTOR = 10;// Делитель частоты для сигналов *_clk
    parameter ENCODER_CLK_PERIOD = 50;// Количество тактов на 1 пакет
    parameter PAUSE_CLK = 0;// Количество тактов на паузу после принятия данных

    parameter BUFF1_ID = 8'b0000_0001, BUFF2_ID = 8'b0000_0010, BUFF3_ID = 8'b0000_0011, BUFF4_ID = 8'b0000_0100;
    parameter BUFF5_ID = 8'b0000_0101, BUFF6_ID = 8'b0000_0110, BUFF7_ID = 8'b0000_0111, BUFF8_ID = 8'b0000_1000;

    reg slow_clk = 0;
    reg [31:0] clk_div_counter = 0;
    reg [31:0] period_counter = 0;
    reg [31:0] enc_read_frame_counter = 0;// Счетчик для отслеживания окна считывания данных 

    reg [23:0] encoder_data_buffer1 = 0, encoder_data_buffer2 = 0, encoder_data_buffer3 = 0, encoder_data_buffer4 = 0;
    reg [23:0] encoder_data_buffer5 = 0, encoder_data_buffer6 = 0, encoder_data_buffer7 = 0, encoder_data_buffer8 = 0;  

// Генератор сигналов *clk
    always @(posedge clk) begin

        if (clk_div_counter == CLK_DIV_FACTOR - 1) begin

            slow_clk <= ~slow_clk;
            clk_div_counter <= 0;

        end else begin

            clk_div_counter <= clk_div_counter + 1;

        end
    end

    always @(posedge slow_clk) begin

         if(rs485_done_reg) begin

            RS485_DONE <= 0;

        end if (RS485_START && !rs485_done_reg) begin
            
            if (period_counter < ENCODER_CLK_PERIOD) begin

                encoder_clk1 <= ~encoder_clk1;
                encoder_clk2 <= ~encoder_clk2;
                encoder_clk3 <= ~encoder_clk3;
                encoder_clk4 <= ~encoder_clk4;
                encoder_clk5 <= ~encoder_clk5;
                encoder_clk6 <= ~encoder_clk6;
                encoder_clk7 <= ~encoder_clk7;
                encoder_clk8 <= ~encoder_clk8;

                enc_read_frame_counter <= enc_read_frame_counter + 1;
                period_counter <= period_counter + 1;

                if ((enc_read_frame_counter[0] == 0) && (enc_read_frame_counter > 1) && (enc_read_frame_counter < ENCODER_CLK_PERIOD)) begin

                    encoder_data_buffer1 <= {encoder_data_buffer1[22:0], encoder_data_in1};
                    encoder_data_buffer2 <= {encoder_data_buffer2[22:0], encoder_data_in2};
                    encoder_data_buffer3 <= {encoder_data_buffer3[22:0], encoder_data_in3};
                    encoder_data_buffer4 <= {encoder_data_buffer4[22:0], encoder_data_in4};
                    encoder_data_buffer5 <= {encoder_data_buffer5[22:0], encoder_data_in5};
                    encoder_data_buffer6 <= {encoder_data_buffer6[22:0], encoder_data_in6};
                    encoder_data_buffer7 <= {encoder_data_buffer7[22:0], encoder_data_in7};
                    encoder_data_buffer8 <= {encoder_data_buffer8[22:0], encoder_data_in8};
                end 

            end else if(period_counter < ENCODER_CLK_PERIOD + PAUSE_CLK) begin

                period_counter <= period_counter + 1; 
                
            end else if(period_counter == ENCODER_CLK_PERIOD + PAUSE_CLK) begin

                period_counter <= 0;
                enc_read_frame_counter <= 0;
            
                encoder_clk1 <= 1;
                encoder_clk2 <= 1;
                encoder_clk3 <= 1;
                encoder_clk4 <= 1;
                encoder_clk5 <= 1;
                encoder_clk6 <= 1;
                encoder_clk7 <= 1;
                encoder_clk8 <= 1;

                // По умолчанию энкодеры с кодом Грея 1,3,5,7 
                BUFF <= {BUFF1_ID, gray_to_bin(encoder_data_buffer1), BUFF2_ID, encoder_data_buffer2, 
                         BUFF3_ID, gray_to_bin(encoder_data_buffer3), BUFF4_ID, encoder_data_buffer4,
                         BUFF5_ID, gray_to_bin(encoder_data_buffer5), BUFF6_ID, encoder_data_buffer6, 
                         BUFF7_ID, gray_to_bin(encoder_data_buffer7), BUFF8_ID, encoder_data_buffer8};
                //LED1_OUT <=!LED1_OUT;
                RS485_DONE <= 1;
            end
        end
    end

    function automatic [23:0] gray_to_bin(input [23:0] gray_code);// Функция перевода кода Грея в бинарный
        integer i;
        begin
            gray_to_bin[23] = gray_code[23];
            for (i = 23; i > 0; i = i - 1) begin
                gray_to_bin[i-1] = gray_to_bin[i] ^ gray_code[i-1];
            end
            
        end
    endfunction
endmodule

module crc32 (
    input clk,
    input crc_done_reg,        // Флаг завершения от внешнего модуля
    input CRC_START,          // Старт вычисления
    input [255:0] buff_in,    // Входные данные (32 байта)
    output reg CRC_DONE,      // Флаг завершения
    output reg LED1_OUT,
    output reg [287:0] buff_out // Выходные данные
);

    reg [31:0] crc_reg;
    reg [64:0] byte_count;
    reg running;
    integer i;
    integer j;
    reg [23:0] encoder_bin_data1;
    reg [23:0] encoder_bin_data3;
    reg [23:0] encoder_bin_data5;
    reg [23:0] encoder_bin_data7;
    reg [7:0] data_byte;
    reg [255:0] RegBuffIn;

    parameter POLYNOMIAL = 32'hEDB88320;
    parameter EncPackSize = 32;
    parameter MSB = 23;
    parameter GrayEncId7 = 1;
    parameter GrayEncId5 = 3;
    parameter GrayEncId3 = 5;
    parameter GrayEncId1 = 7;

    initial begin 
        CRC_DONE = 0;
        running = 0;
        crc_reg = 32'hFFFFFFFF;
    end

    always @(posedge clk) begin

        if (crc_done_reg) begin

            CRC_DONE <= 0;
        end
        if (CRC_START && !running && !CRC_DONE) begin

            crc_reg <= 32'hFFFFFFFF; // Инициализация CRC
            byte_count <= 0;
            running <= 1;

        end else if (running) begin

            if (byte_count < 32) begin

                data_byte = buff_in[(31-byte_count) * 8 +: 8]; // Берем 8 бит из входного массива
                crc_reg = crc_reg ^ data_byte; // XOR с входными данными
                
                for (i = 0; i < 8; i = i + 1) begin

                    if (crc_reg[0])

                        crc_reg = (crc_reg >> 1) ^ POLYNOMIAL;
                    else

                        crc_reg = crc_reg >> 1;
                end

                byte_count <= byte_count + 1;

            end else begin

                running <= 0;
                CRC_DONE <= 1;
                buff_out[287:256] <= ~crc_reg; // Инверсия результата
                buff_out[255:0] <= buff_in; // Копируем входные данные на выход

            end
        end
    end

endmodule

module spi_transmitter
(
    input clk, 
    
    input SPI_START,
    input spi_done_reg,  
    
    input [287:0] SPI_BUFF,       

    output reg spi_clk,         
    output reg spi_mosi, 
    output reg spi_nss,

    output reg LED1_OUT,

    output reg SPI_DONE
);

initial begin
    SPI_DONE = 0;
    spi_nss = 1;
    spi_clk = 1;
end

// Параметры
parameter SPI_DIV_FACTOR = 4;   // Делитель частоты для SPI
parameter SPI_BUFF_SIZE = 288;
parameter START_DELAY_CYCLES = 100; // Задержка перед передачей MOSI
parameter END_DELAY_CYCLES = 100;   // Задержка перед поднятием NSS после передачи

// Регистры
reg [31:0] spi_div_counter = 0; // Счётчик для деления частоты SPI
reg [63:0] spi_bit_index = 288;   // Индекс текущего бита для SPI
reg clk_spi_internal = 0;
reg clk_stop = 0;
reg [32:0] start_delay_counter = 0; // Счетчик задержки перед передачей
reg start_delay_active = 0;        // Флаг ожидания перед передачей
reg [32:0] end_delay_counter = 0;   // Счетчик задержки перед поднятием NSS
reg end_delay_active = 0;          // Флаг задержки перед поднятием NSS

// Генерация SPI тактового сигнала
always @(posedge clk) begin

    if (spi_div_counter == SPI_DIV_FACTOR - 1) begin

        clk_spi_internal <= ~clk_spi_internal;
        spi_div_counter <= 0;

    end else begin

        spi_div_counter <= spi_div_counter + 1;

    end if (SPI_START && clk_stop) begin

        spi_clk <= clk_spi_internal;

    end else begin 

        spi_clk <= 0;

    end   
end

// Логика передачи данных через SPI
always @(negedge clk_spi_internal) begin

    if(spi_done_reg) begin

        SPI_DONE <= 0;

    end

    if (SPI_START && !spi_done_reg) begin

        if (!start_delay_active) begin
            // NSS опускается, начинаем задержку перед передачей
            spi_nss <= 0;
            start_delay_counter <= START_DELAY_CYCLES;
            start_delay_active <= 1;

        end else if (start_delay_counter > 0) begin
            // Ждём завершения задержки перед передачей
            start_delay_counter <= start_delay_counter - 1;

        end else if (!end_delay_active && start_delay_counter == 0) begin
            // Передача данных начинается
            if (spi_bit_index > 0) begin

                SPI_DONE <= 0;
                clk_stop <= 1;
                spi_mosi <= SPI_BUFF[spi_bit_index-1]; 
                spi_bit_index <= spi_bit_index - 1;

            end else begin
                // Останавливаем передачу, но не поднимаем NSS сразу
                clk_stop <= 0;
                spi_mosi <= 0; 
                end_delay_counter <= END_DELAY_CYCLES;
                end_delay_active <= 1;

            end
        end else if (end_delay_counter > 0) begin
            // Ждём задержку перед поднятием NSS
            end_delay_counter <= end_delay_counter - 1;

        end else begin
            // Завершаем транзакцию, поднимаем NSS
            spi_nss <= 1;
            SPI_DONE <= 1;
            start_delay_active <= 0;
            end_delay_active <= 0;

        end
    end else begin

        spi_bit_index <= 288;

    end
end

endmodule

