module top(
    input clk,
    output  spi_clk_pin,             // Выходной SPI тактовый сигнал
    output  spi_mosi_pin,
    output spi_nss_pin,                     // Основной тактовый сигнал
    input encoder_data_in1,
    input encoder_data_in2,
    input encoder_data_in3,
    input encoder_data_in4,
    input encoder_data_in5,
    input encoder_data_in6,
    input encoder_data_in7,
    input encoder_data_in8,         // Входные сигналы данных от энкодера
    output reg encoder_clk1_pin = 0,
    output reg encoder_clk2_pin = 0, 
    output reg encoder_clk3_pin = 0, 
    output reg encoder_clk4_pin = 0, 
    output reg encoder_clk5_pin = 0, 
    output reg encoder_clk6_pin = 0, 
    output reg encoder_clk7_pin = 0, 
    output reg encoder_clk8_pin = 0,
    output reg LED1_PIN            // Выходные тактовые сигналы для энкодера               
);

    // Параметры
    parameter CLK_DIV_FACTOR = 66;      // Делитель частоты для encoder_clk (100 кГц)
    parameter ENCODER_CLK_PERIOD = 99; // Период encoder_clk (25 нулей и единиц)
    parameter PAUSE_CYCLES = 400;       // Пауза после периода

    // Локальные сигналы
    reg [31:0] clk_div_counter = 0;    // Счётчик для деления частоты encoder_clk
    reg slow_clk = 0;                  // Медленный тактовый сигнал encoder_clk
    reg [31:0] period_counter = 0;     // Счётчик для encoder_clk периода
    reg [31:0] encoder_data_buffer1 = 32'b0;
    reg [31:0] encoder_data_buffer2 = 32'b0;
    reg [31:0] encoder_data_buffer3 = 32'b0;
    reg [31:0] encoder_data_buffer4 = 32'b0;
    reg [31:0] encoder_data_buffer5 = 32'b0;
    reg [31:0] encoder_data_buffer6 = 32'b0;
    reg [31:0] encoder_data_buffer7 = 32'b0;
    reg [31:0] encoder_data_buffer8 = 32'b0;
    
    reg [4:0] encoder_data_sum2 = 5'b0;
    reg [4:0] encoder_data_sum4 = 5'b0;
    reg [4:0] encoder_data_sum6 = 5'b0;
    reg [4:0] encoder_data_sum8 = 5'b0;

    reg [23:0] encoder_gray_data1 = 24'b0;
    reg [23:0] encoder_gray_data3 = 24'b0;
    reg [23:0] encoder_gray_data5 = 24'b0;
    reg [23:0] encoder_gray_data7 = 24'b0;

     reg  cc = 1;
     // Буфер данных энкодера
    reg spi_active = 0;                // Флаг активности SPI

    // Генерация медленного тактового сигнала encoder_clk
    always @(posedge clk) begin
        if (clk_div_counter == CLK_DIV_FACTOR - 1) begin
            slow_clk <= ~slow_clk;     // Переключение тактового сигнала
            clk_div_counter <= 0;     // Сброс счётчика
        end else begin
            clk_div_counter <= clk_div_counter + 1;
        end
    // Основная логика encoder_clk и передача данных в SPI
    if(((slow_clk == 1) || (slow_clk == 0)) && (clk_div_counter == CLK_DIV_FACTOR -2 )) begin
        if ((period_counter < ENCODER_CLK_PERIOD + PAUSE_CYCLES)) begin
            period_counter <= period_counter + 1;
        end else begin
            period_counter <= 0;        // Сброс после завершения цикла
        end 
        if ((encoder_clk1_pin == 1 && (slow_clk == 0)) && (period_counter < ENCODER_CLK_PERIOD) ) begin
            encoder_data_buffer1 <= { encoder_data_buffer1[22:0], encoder_data_in1};
            encoder_data_buffer2 <= { encoder_data_buffer2[22:0], encoder_data_in2};
            encoder_data_buffer3 <= { encoder_data_buffer3[22:0], encoder_data_in3};
            encoder_data_buffer4 <= { encoder_data_buffer4[22:0], encoder_data_in4};
            encoder_data_buffer5 <= { encoder_data_buffer5[22:0], encoder_data_in5};
            encoder_data_buffer6 <= { encoder_data_buffer6[22:0], encoder_data_in6};
            encoder_data_buffer7 <= { encoder_data_buffer7[22:0], encoder_data_in7};
            encoder_data_buffer8 <= { encoder_data_buffer8[22:0], encoder_data_in8};
            end       
        if ((period_counter < ENCODER_CLK_PERIOD) && slow_clk == 1) begin
            encoder_clk1_pin <= !encoder_clk1_pin;
            encoder_clk2_pin <= !encoder_clk2_pin;
            encoder_clk3_pin <= !encoder_clk3_pin;
            encoder_clk4_pin <= !encoder_clk4_pin;
            encoder_clk5_pin <= !encoder_clk5_pin;
            encoder_clk6_pin <= !encoder_clk6_pin;
            encoder_clk7_pin <= !encoder_clk7_pin;
            encoder_clk8_pin <= !encoder_clk8_pin; // Переключение encoder_clk
             end 
       else if ((period_counter < ENCODER_CLK_PERIOD + PAUSE_CYCLES)&& slow_clk == 1) begin
        encoder_data_buffer1 <= {3'b000, CRC(encoder_data_buffer1[23:0]),encoder_data_buffer1[23:0]};
        encoder_data_buffer2 <= {3'b001, CRC(encoder_data_buffer2[23:0]),encoder_data_buffer2[23:0]};
        encoder_data_buffer3 <= {3'b010, CRC(encoder_data_buffer3[23:0]),encoder_data_buffer3[23:0]};
        encoder_data_buffer4 <= {3'b011, CRC(encoder_data_buffer4[23:0]),encoder_data_buffer4[23:0]};
        encoder_data_buffer5 <= {3'b100, CRC(encoder_data_buffer5[23:0]),encoder_data_buffer5[23:0]};
        encoder_data_buffer6 <= {3'b101, CRC(encoder_data_buffer6[23:0]),encoder_data_buffer6[23:0]};
        encoder_data_buffer7 <= {3'b110, CRC(encoder_data_buffer7[23:0]),encoder_data_buffer7[23:0]};
        encoder_data_buffer8 <= {3'b111, CRC(encoder_data_buffer8[23:0]),encoder_data_buffer8[23:0]};    
        
          
            encoder_clk1_pin <= 1;
            encoder_clk2_pin <= 1;
            encoder_clk3_pin <= 1;
            encoder_clk4_pin <= 1;
            encoder_clk5_pin <= 1;
            encoder_clk6_pin <= 1;
            encoder_clk7_pin <= 1;
            encoder_clk8_pin <= 1;
            spi_active <= 1;  

        end else if ((period_counter == ENCODER_CLK_PERIOD + PAUSE_CYCLES) && slow_clk == 1) begin
            encoder_data_buffer1 <= 32'b0;
            encoder_data_buffer2 <= 32'b0;
            encoder_data_buffer3 <= 32'b0;
            encoder_data_buffer4 <= 32'b0;
            encoder_data_buffer5 <= 32'b0;
            encoder_data_buffer6 <= 32'b0;
            encoder_data_buffer7 <= 32'b0;
            encoder_data_buffer8 <= 32'b0;
            
            spi_active <= 0; // Активируем SPI
        end
        // Счётчик периода
    end
    end

    
    function [23:0] gray_to_bin;
        input [23:0] gray_code;
        integer i;
        begin
            gray_to_bin[23] = gray_code[23];   // Старший бит остается одинаковым
            for (i = 22; i >= 0; i = i - 1) begin
                if(((gray_code[i+1] == 1) && (gray_code[i] == 0)) || ((gray_code[i+1] == 0) && (gray_code[i] == 1)) ) begin
                    gray_to_bin[i] = 1;
                end else begin 
                    gray_to_bin[i] = 0;
                end
                //gray_to_bin[i] = gray_code[i+1] ^ gray_code[i];  // XOR предыдущего бита и текущего бита из кода Грея
            end
              // Возвращаем результат
        end
    endfunction

function [4:0] CRC;
    input [23:0] code;
    reg [4:0] sum;
    integer i;
    begin
        sum = sum + code[0] ;
        for (i = 0; i < 23; i = i + 1) begin
            sum = sum + code[i] ; // сумма единиц
        end
        CRC = sum;
        
    end
endfunction

    // Экземпляр SPI модуля
    spi_transmitter spi_inst (
        .clk(clk),
        .nss(spi_nss_pin),
        .spi_active(spi_active),
        .spi_clk(spi_clk_pin),
        .spi_mosi(spi_mosi_pin),
        .encoder_data_buffer1(encoder_data_buffer1),
        .encoder_data_buffer2(encoder_data_buffer2),
        .encoder_data_buffer3(encoder_data_buffer3),
        .encoder_data_buffer4(encoder_data_buffer4),
        .encoder_data_buffer5(encoder_data_buffer5),
        .encoder_data_buffer6(encoder_data_buffer6),
        .encoder_data_buffer7(encoder_data_buffer7),
        .encoder_data_buffer8(encoder_data_buffer8)

    );


  // Функция для перевода из кода Грея в бинарный


endmodule

module spi_transmitter
(
    input clk,                      // Основной тактовый сигнал
    output reg spi_clk,             // Выходной SPI тактовый сигнал
    output reg spi_mosi, 
    output reg nss,           // Выходные данные SPI
    input spi_active,               // Флаг активности SPI
    input [31:0] encoder_data_buffer1,
    input [31:0] encoder_data_buffer2,
    input [31:0] encoder_data_buffer3,
    input [31:0] encoder_data_buffer4,
    input [31:0] encoder_data_buffer5,
    input [31:0] encoder_data_buffer6,
    input [31:0] encoder_data_buffer7,
    input [31:0] encoder_data_buffer8   // Буфер данных энкодера
);

    // Параметр делителя частоты для SPI
    parameter SPI_DIV_FACTOR = 6;  // Делитель частоты для SPI

    // Регистры
    reg [31:0] spi_div_counter = 0; // Счётчик для деления частоты SPI
    reg [10:0] spi_bit_index = 0;
    reg [1:0] clk_spi_internal = 0;   // Индекс текущего бита для SPI
    reg [31:0] clk_spi_count32 = 0;
    reg [1:0] clk_stop = 0;
    reg [255:0] SPI_BUFF = 256'b0;

    // Генерация SPI тактового сигнала
    always @(posedge clk) begin
            if (spi_div_counter == SPI_DIV_FACTOR - 1) begin
                clk_spi_internal <= ~clk_spi_internal;   // Переключение SPI тактового сигнала
                spi_div_counter <= 0; // Сброс счётчика
            end else begin
                spi_div_counter <= spi_div_counter + 1;
            end
            if (spi_active && clk_stop)begin
                spi_clk <= clk_spi_internal;
            end else begin 
                spi_clk <= 0; 
            end
    end

    // Логика передачи данных через SPI
    always @(negedge clk_spi_internal) begin
        if (spi_active) begin
            nss <= 0;
            SPI_BUFF <= {encoder_data_buffer8, encoder_data_buffer7, encoder_data_buffer6, encoder_data_buffer5, 
                        encoder_data_buffer4, encoder_data_buffer3, encoder_data_buffer2, encoder_data_buffer1};
            spi_mosi <= SPI_BUFF[spi_bit_index]; // Передача текущего бита
            if( spi_bit_index < 256) begin
                clk_stop <= 1;
            end else begin
                clk_stop <= 0;

            end 
            if (spi_bit_index < 256) begin
                spi_bit_index <= spi_bit_index + 1;
                 //clk_stop <= 1;        
            end else begin
                 spi_mosi <= 0; 
                 //clk_stop <= 0;
                 nss <= 1;
                                  // Сброс индекса после завершения передачи
            end
        end else begin
            spi_bit_index <= 0;                                // Сброс MOSI, если SPI не активен
        end
    end

endmodule
        end
    end

endmodule
