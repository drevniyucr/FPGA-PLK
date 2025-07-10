/* SPI-Encoder v2.1

UPDATE:
    -Повышена стабильность CRC модуля
    -Логика переведена на FSM 

Планируеммые нововведения:
    - Обратная связь с STM через UART
 2025 SMG */
module top(
    // Основной clock и сигнал сброса, подлючен к кнопке S1
    input clk,                      
    input reset,                     
    //Данные с энкодеров
    input encoder_data_in1,             
    input encoder_data_in2,
    input encoder_data_in3,
    input encoder_data_in4,
    input encoder_data_in5,
    input encoder_data_in6,
    input encoder_data_in7,
    input encoder_data_in8,
    //Тактовые сигналы для энкодеров
    output reg encoder_clk1_pin,
    output reg encoder_clk2_pin, 
    output reg encoder_clk3_pin, 
    output reg encoder_clk4_pin, 
    output reg encoder_clk5_pin, 
    output reg encoder_clk6_pin, 
    output reg encoder_clk7_pin, 
    output reg encoder_clk8_pin,
    //SPI сигналы
    output reg spi_clk_pin,             
    output reg spi_mosi_pin,
    output reg spi_nss_pin,
    //Отладочные сигналы
    output reg LED0_PIN,            
    output reg LED1_PIN,            
    output reg LED2_PIN,            
    output reg LED3_PIN,            
    output reg LED4_PIN,            
    output reg LED5_PIN                  
);

    reg  RS485_START, CRC_START, SPI_START;
    wire RS485_DONE, CRC_DONE, SPI_DONE;
    reg  rs485_done_reg, crc_done_reg, spi_done_reg;

    reg [7:0] encoder_data_in_buff;
    reg [7:0] encoder_clk_buff;

    wire spi_clk, spi_mosi, spi_nss;
   
    wire LED1_OUT,LED2_OUT,LED3_OUT,
         LED4_OUT,LED5_OUT,LED6_OUT;

    wire [255:0] BUFF_NOCRC;
    wire [287:0] BUFF_CRC;

    typedef enum logic [4:0] { // Enum FSM для переключения модулей
        ST_IDLE,
        ST_RS485,      
        ST_RS485_WAIT, 
        ST_CRC,
        ST_CRC_WAIT,
        ST_SPI, 
        ST_SPI_WAIT
    } state_t;

    state_t state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state         <= ST_IDLE;
        end else begin
            case (state)
            ST_IDLE: begin
                rs485_done_reg <= 0;
                crc_done_reg   <= 0;
                spi_done_reg   <= 0;
                RS485_START    <= 0;
                CRC_START      <= 0;
                SPI_START      <= 0;
                LED0_PIN       <= 0;
                LED1_PIN       <= 0;
                LED1_PIN       <= 0;
                LED2_PIN       <= 0;
                LED3_PIN       <= 0;
                LED4_PIN       <= 0;
                LED5_PIN       <= 0;
                state          <= ST_RS485;
            end
            // === RS485 этап ===
            ST_RS485: begin
                LED0_PIN    <= ~LED0_PIN;
                RS485_START <= 1;
                CRC_START   <= 0;
                SPI_START   <= 0;
                if (RS485_DONE) begin
                    RS485_START     <= 0;
                    rs485_done_reg  <= 1;
                    state           <= ST_RS485_WAIT;
                end
            end
            ST_RS485_WAIT: begin
                LED1_PIN           <= ~LED1_PIN;
                if (!RS485_DONE) begin
                    rs485_done_reg <= 0;
                    state          <= ST_CRC;
                end
            end
                // === CRC этап ===
            ST_CRC: begin
                LED2_PIN    <= ~LED2_PIN;
                RS485_START <= 0;
                CRC_START   <= 1;
                SPI_START   <= 0;
                if (CRC_DONE) begin
                    crc_done_reg <= 1;
                    CRC_START    <= 0;
                    state        <= ST_CRC_WAIT;
                end
            end    
            ST_CRC_WAIT: begin
                LED3_PIN         <= ~LED3_PIN;
                if (!CRC_DONE) begin
                    LED4_PIN     <= ~LED4_PIN;
                    crc_done_reg <= 0;
                    state        <= ST_SPI;
                end
            end
                // === SPI этап ===
            ST_SPI: begin
                LED4_PIN     <= ~LED4_PIN;
                RS485_START  <= 0;
                CRC_START    <= 0;
                SPI_START    <= 1;
                if (SPI_DONE) begin
                    spi_done_reg   <= 1;
                    SPI_START      <= 0;
                    state          <= ST_SPI_WAIT;
                end
            end
            ST_SPI_WAIT: begin
                LED5_PIN         <= ~LED5_PIN;
                if (!SPI_DONE) begin
                    spi_done_reg <= 0;
                    state        <= ST_IDLE;
              end
            end

            default: state <= ST_IDLE; 
            endcase
        end
end

    rs485_reseiver rs_inst (
        .clk(clk),

        .rs485_done_reg  (rs485_done_reg),
        .RS485_START     (RS485_START),
        .RS485_DONE      (RS485_DONE),

        .encoder_data_in (encoder_data_in_buff),
        .encoder_clk     (encoder_clk_buff),

        .BUFF(BUFF_NOCRC),

        .LED0_OUT(LED0_OUT),
        .LED1_OUT(LED1_OUT),
        .LED2_OUT(LED2_OUT),
        .LED3_OUT(LED3_OUT),
        .LED4_OUT(LED4_OUT),
        .LED5_OUT(LED5_OUT) 
    );

    crc32 scs_inst (
        .clk  (clk),
        .reset(reset), 

        .crc_done_reg(crc_done_reg), 
        .CRC_START   (CRC_START),
        .CRC_DONE    (CRC_DONE),

        .buff_in (BUFF_NOCRC),
        .buff_out(BUFF_CRC),

        .LED0_OUT(LED0_OUT),
        .LED1_OUT(LED1_OUT),
        .LED2_OUT(LED2_OUT),
        .LED3_OUT(LED3_OUT),
        .LED4_OUT(LED4_OUT),
        .LED5_OUT(LED5_OUT)
    );

    spi_transmitter spi_inst (
        .clk(clk),

        .spi_done_reg(spi_done_reg),
        .SPI_START(SPI_START),
        .SPI_DONE(SPI_DONE),

        .spi_nss(spi_nss),
        .spi_clk(spi_clk),
        .spi_mosi(spi_mosi),

        .SPI_BUFF(BUFF_CRC),

        .LED0_OUT(LED0_OUT),
        .LED1_OUT(LED1_OUT),
        .LED2_OUT(LED2_OUT),
        .LED3_OUT(LED3_OUT),
        .LED4_OUT(LED4_OUT),
        .LED5_OUT(LED5_OUT)
    );

    // Подключение wire'ов к выходным сигналам
    always @(posedge clk) begin
        encoder_data_in_buff <= {encoder_data_in8, encoder_data_in7, encoder_data_in6, encoder_data_in5,
                                 encoder_data_in4, encoder_data_in3, encoder_data_in2, encoder_data_in1};
        spi_clk_pin <= spi_clk;             
        spi_mosi_pin <= spi_mosi;
        spi_nss_pin <= spi_nss;
        // Раскоментировать если нужно использовать в других модулях, и закоментировать в top switch
        // LED0_PIN <= LED0_OUT;
        // LED1_PIN <= LED1_OUT;
        // LED2_PIN <= LED2_OUT; 
        // LED3_PIN <= LED3_OUT;
        // LED4_PIN <= LED4_OUT;
        // LED5_PIN <= LED5_OUT;
        encoder_clk1_pin <= encoder_clk_buff[0]; 
        encoder_clk2_pin <= encoder_clk_buff[1]; 
        encoder_clk3_pin <= encoder_clk_buff[2]; 
        encoder_clk4_pin <= encoder_clk_buff[3]; 
        encoder_clk5_pin <= encoder_clk_buff[4]; 
        encoder_clk6_pin <= encoder_clk_buff[5]; 
        encoder_clk7_pin <= encoder_clk_buff[6]; 
        encoder_clk8_pin <= encoder_clk_buff[7];
    end
endmodule


module rs485_reseiver(
    // Основной тактовый сигнал
    input clk,                      
    // Входные данные с энкодеров и выходные тактовые 
    input [7:0] encoder_data_in,    
    output reg [7:0]encoder_clk,

    input rs485_done_reg,
    input RS485_START,
    output reg RS485_DONE, 
    // Выходной буффер
    output reg [255:0] BUFF,        
    // Сигналы для отладки
    output reg LED0_OUT,           
    output reg LED1_OUT,
    output reg LED2_OUT,
    output reg LED3_OUT,
    output reg LED4_OUT,
    output reg LED5_OUT
); 

 initial begin
    BUFF = 0;
    RS485_DONE = 0;
 end

    parameter CLK_DIV_FACTOR = 50;          // Делитель частоты для сигналов *_clk
    parameter ENCODER_CLK_PERIOD = 50;      // Количество тактов на 1 пакет
    parameter PAUSE_CLK = 0;                // Количество тактов на паузу после принятия данных

    parameter BUFF1_ID = 8'b0000_0001, BUFF2_ID = 8'b0000_0010, BUFF3_ID = 8'b0000_0011, BUFF4_ID = 8'b0000_0100;
    parameter BUFF5_ID = 8'b0000_0101, BUFF6_ID = 8'b0000_0110, BUFF7_ID = 8'b0000_0111, BUFF8_ID = 8'b0000_1000;

    reg slow_clk = 0;

    reg [31:0] clk_div_counter = 0;
    reg [31:0] period_counter = 0;
    reg [31:0] enc_read_frame_counter = 0;  // Счетчик для отслеживания окна считывания данных 
    reg [23:0] encoder_data_buffer [7:0];   // Буффер для 8 энкодеров

    integer i;

    typedef enum logic [5:0] {
        IDLE,
        GENERATE_CLK,
        WRITE_BUFF,
        PAUSE,
        DONE
    } state_t;

    state_t state = IDLE;
    
// Делитель частоты
    always @(posedge clk) begin
        clk_div_counter <= clk_div_counter + 1;
        if (clk_div_counter == CLK_DIV_FACTOR - 1) begin
            slow_clk <= ~slow_clk;
            clk_div_counter <= 0;
        end 
    end

    always @(posedge slow_clk) begin

        case (state)
            IDLE: begin
                RS485_DONE <= 0;
                    if (RS485_START) begin
                        period_counter <= 0;
                        encoder_clk    <= 8'b1111_1111;
                        state          <= GENERATE_CLK;
                    end
            end

            GENERATE_CLK: begin
                if (period_counter < ENCODER_CLK_PERIOD) begin
                    encoder_clk <= ~encoder_clk;
                    enc_read_frame_counter <= enc_read_frame_counter + 1;
                    period_counter <= period_counter + 1;

                    if ((enc_read_frame_counter[0] == 0) && (enc_read_frame_counter > 1)) begin
                        for (i = 0; i < 8; i = i + 1) begin
                            encoder_data_buffer[i] <= {encoder_data_buffer[i][22:0], encoder_data_in[i]};
                        end
                    end
                end else begin
                    state <= WRITE_BUFF;
                end
            end

            WRITE_BUFF: begin
                BUFF <= {
                    BUFF1_ID, gray_to_bin(encoder_data_buffer[0]), BUFF2_ID, encoder_data_buffer[1], 
                    BUFF3_ID, gray_to_bin(encoder_data_buffer[2]), BUFF4_ID, encoder_data_buffer[3],
                    BUFF5_ID, gray_to_bin(encoder_data_buffer[4]), BUFF6_ID, encoder_data_buffer[5], 
                    BUFF7_ID, gray_to_bin(encoder_data_buffer[6]), BUFF8_ID, encoder_data_buffer[7]
                };
                encoder_clk <= 8'b1111_1111;
                enc_read_frame_counter <= 0;
                state <= PAUSE;
            end

            PAUSE: begin
                if (period_counter < ENCODER_CLK_PERIOD + PAUSE_CLK) begin
                    period_counter <= period_counter + 1;
                end else begin
                    state <= DONE;
                end
            end

            DONE: begin
                RS485_DONE     <= 1;
                period_counter <= 0;
                if (rs485_done_reg)                  RS485_DONE <= 0;
                if (!RS485_START && !rs485_done_reg) state   <= IDLE;
            end
        endcase
    end
    // Функция перевода кода Грея в бинарный
    function automatic [23:0] gray_to_bin(input [23:0] gray_code);
        integer j;
        begin
            gray_to_bin[23] = gray_code[23];
            for (j = 23; j > 0; j = j - 1) begin
                gray_to_bin[j-1] = gray_to_bin[j] ^ gray_code[j-1];
            end
        end
    endfunction
endmodule


module crc32 (
    // Clock и сброс
    input clk,
    input reset, 
    // Флаги управления модулем        
    input      crc_done_reg,     
    input      CRC_START,        
    output reg CRC_DONE,
    // Выходной и входной буффер   
    output reg [287:0] buff_out,  
    input      [255:0] buff_in,    
    // Сигналы для отладки
    output reg LED0_OUT,           
    output reg LED1_OUT,
    output reg LED2_OUT,
    output reg LED3_OUT,
    output reg LED4_OUT,
    output reg LED5_OUT
);
    parameter POLYNOMIAL = 32'hEDB88320;
    parameter EncPackSize = 32;

    reg  [31:0]  crc_reg;
    reg  [31:0]  byte_count; 
    reg   [7:0]  data_byte;
    reg [255:0]  RegBuffIn;
    reg  [31:0]  bit_index;
    reg  [31:0]  count;
    

    typedef enum reg [5:0] {
        IDLE,
        LOAD,
        LOAD_BYTE,
        XOR_STAGE,
        PROCESS,
        DONE 
    } state_t;

    state_t state = IDLE;
    // FSM: действия
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state      <= IDLE;
            CRC_DONE   <= 0;
            crc_reg    <= 32'hFFFFFFFF;
            byte_count <= 0;
            bit_index  <= 0;
            buff_out   <= 0;
            RegBuffIn  <= 0;
            data_byte  <= 0;
        
        end else begin
            case (state)
                IDLE: begin
                    CRC_DONE   <= 0;
                    byte_count <= 0;
                    bit_index  <= 0;
                    crc_reg    <= 32'hFFFFFFFF;
                    if (CRC_START) state <= LOAD;
                end
                LOAD: begin
                    RegBuffIn  <= buff_in;
                    state      <= LOAD_BYTE;
                end

                LOAD_BYTE:begin
                    data_byte <= RegBuffIn[(EncPackSize - 1 - byte_count) * 8 +: 8];
                    bit_index <= 0;
                    state     <= XOR_STAGE;
                end

                 XOR_STAGE: begin
                    crc_reg <= crc_reg ^ data_byte;
                    state   <= PROCESS;
                end

                PROCESS: begin
                    if (bit_index < 8) begin
                        bit_index <= bit_index + 1;

                        if (crc_reg[0]) crc_reg <= (crc_reg >> 1) ^ POLYNOMIAL;                           
                        else crc_reg <= crc_reg >> 1; 
                    end else begin 
                        byte_count <= byte_count + 1; 

                        if (byte_count == EncPackSize-1) state <= DONE;
                        else state <= LOAD_BYTE;
                    end
                end

                DONE: begin
                    CRC_DONE          <= 1;
                    buff_out[31:0]    <= ~crc_reg;           
                    buff_out[287:32]  <= RegBuffIn;

                    if (crc_done_reg)                  CRC_DONE <= 0;
                    if (!CRC_START && !crc_done_reg)   state   <= IDLE;       
                end

                default: state <= IDLE;
            endcase
            end
        end
endmodule

module spi_transmitter(
    input clk, 
    
    input SPI_START,
    input spi_done_reg,
    output reg SPI_DONE,  
    
    input [287:0] SPI_BUFF,       

    output reg spi_clk,         
    output reg spi_mosi, 
    output reg spi_nss,
    // Сигналы для отладки
    output reg LED0_OUT,           
    output reg LED1_OUT,
    output reg LED2_OUT,
    output reg LED3_OUT,
    output reg LED4_OUT,
    output reg LED5_OUT
);
// Параметры
parameter START_DELAY_CYCLES   = 20;   // Задержка перед передачей MOSI
parameter END_DELAY_CYCLES     = 20;   // Задержка перед поднятием NSS после передачи
parameter SPI_DIV_FACTOR       = 12;    // Делитель частоты для SPI
parameter SPI_BUFF_SIZE        = 288;
// Регистры
reg [31:0] delay_counter       = 0;
reg [63:0] bit_index           = 0;
reg [31:0] spi_div_counter     = 0;     // Счётчик для деления частоты SPI
reg clk_spi_internal           = 0; 
reg EDGE_REG                   = 0;

 typedef enum reg [5:0] {
        IDLE,
        START_DELAY,
        SEND,
        END_DELAY,
        DONE
    } state_t;

    state_t state = IDLE;

// Генерация SPI тактового сигнала
always @(posedge clk) begin
    if (spi_div_counter == SPI_DIV_FACTOR - 1) begin
        clk_spi_internal <= ~clk_spi_internal;
        spi_div_counter <= 0;

    end else begin
        spi_div_counter <= spi_div_counter + 1;
    end
end

// Логика передачи данных через SPI
always @(posedge clk_spi_internal) begin
    case (state)
    IDLE: begin
        delay_counter <= 0;
        SPI_DONE      <= 0;
        spi_clk       <= 0;
        spi_nss       <= 1;
        spi_mosi      <= 0;
        bit_index     <= SPI_BUFF_SIZE;

        if (SPI_START && !spi_done_reg) begin
            delay_counter <= START_DELAY_CYCLES;
            spi_nss       <= 0;
            state         <= START_DELAY;
        end
    end
    START_DELAY: begin
        if (delay_counter > 0) begin
            delay_counter <= delay_counter - 1;
        end else begin
            EDGE_REG <= 0;
            state    <= SEND;
        end
    end
    SEND: begin
        if (bit_index > 0) begin
            if (EDGE_REG) begin
                EDGE_REG <= ~EDGE_REG;
                spi_mosi <= SPI_BUFF[bit_index - 1];
                spi_clk  <= 0;  
            end else begin
                EDGE_REG  <= ~EDGE_REG;  
                spi_clk   <= 1;
                bit_index <= bit_index - 1;
            end
        end else begin
            delay_counter <= END_DELAY_CYCLES;
            state         <= END_DELAY;
            spi_clk       <= 0;
            spi_mosi      <= 0;
            EDGE_REG      <= 0;
        end
    end

    END_DELAY: begin
        if (delay_counter > 0) begin
            delay_counter <= delay_counter - 1;
        end else begin
            spi_nss  <= 1;
            SPI_DONE <= 1;
            state <= DONE;
        end
    end

    DONE: begin
        if (spi_done_reg) begin
            SPI_DONE <= 0;
        end
        if (!SPI_START && !spi_done_reg) begin
            state <= IDLE;
        end
    end
    default: state <= IDLE;
endcase
end
endmodule

