module top(
    input clk,                     // Основной тактовый сигнал
    input encoder_data_in,         // Входной сигнал данных от энкодера
    output reg encoder_clk,        // Выходной тактовый сигнал для энкодера
    output spi_clk,                // SPI тактовый сигнал
    output spi_mosi                // SPI данные
);

    // Параметры
    parameter CLK_DIV_FACTOR = 66;      // Делитель частоты для encoder_clk (100 кГц)
    parameter ENCODER_CLK_PERIOD = 48; // Период encoder_clk (25 нулей и единиц)
    parameter PAUSE_CYCLES = 40;       // Пауза после периода

    // Локальные сигналы
    reg [31:0] clk_div_counter = 0;    // Счётчик для деления частоты encoder_clk
    reg slow_clk = 0;                  // Медленный тактовый сигнал encoder_clk
    reg [31:0] period_counter = 0;     // Счётчик для encoder_clk периода
    reg [31:0] encoder_data_buffer = 0; // Буфер данных энкодера
    reg spi_active = 0;                // Флаг активности SPI

    // Генерация медленного тактового сигнала encoder_clk
    always @(posedge clk) begin
        if (clk_div_counter == CLK_DIV_FACTOR - 1) begin
            slow_clk <= ~slow_clk;     // Переключение тактового сигнала
            clk_div_counter <= 0;     // Сброс счётчика
        end else begin
            clk_div_counter <= clk_div_counter + 1;
        end
    end

    // Основная логика encoder_clk и передача данных в SPI
    always @(posedge slow_clk) begin
        if (period_counter < ENCODER_CLK_PERIOD) begin
            encoder_clk <= ~encoder_clk; // Переключение encoder_clk
            if (encoder_clk) begin
         encoder_data_buffer <= {8'b10101010, encoder_data_buffer[22:0], encoder_data_in}; // Сдвиг данных
            end
        end else if (period_counter < ENCODER_CLK_PERIOD + PAUSE_CYCLES) begin
            encoder_clk <= 0;
            spi_active <= 1;          
        end else if (period_counter == ENCODER_CLK_PERIOD + PAUSE_CYCLES) begin
            spi_active <= 0; 
            encoder_data_buffer <= 32'b0;           // Активируем SPI
        end

        // Счётчик периода
        if (period_counter < ENCODER_CLK_PERIOD + PAUSE_CYCLES) begin
            period_counter <= period_counter + 1;
        end else begin
            period_counter <= 0;        // Сброс после завершения цикла
        end
    end

    // Экземпляр SPI модуля
    spi_transmitter spi_inst (
        .clk(clk),
        .spi_clk(spi_clk),
        .spi_mosi(spi_mosi),
        .spi_active(spi_active),
        .encoder_data_buffer(encoder_data_buffer)
    );

endmodule

module spi_transmitter
(
    input clk,                      // Основной тактовый сигнал
    output reg spi_clk,             // Выходной SPI тактовый сигнал
    output reg spi_mosi,            // Выходные данные SPI
    input spi_active,               // Флаг активности SPI
    input [31:0] encoder_data_buffer // Буфер данных энкодера
);

    // Параметр делителя частоты для SPI
    parameter SPI_DIV_FACTOR = 1;  // Делитель частоты для SPI

    // Регистры
    reg [31:0] spi_div_counter = 0; // Счётчик для деления частоты SPI
    reg [6:0] spi_bit_index = 0;
    reg [1:0] clk_spi_internal = 0;   // Индекс текущего бита для SPI
    reg [31:0] clk_spi_count32 = 0;
    reg [1:0] clk_stop = 0;

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
            spi_mosi <= encoder_data_buffer[spi_bit_index]; // Передача текущего бита
            if (spi_bit_index < 32) begin
                spi_bit_index <= spi_bit_index + 1;
                 clk_stop <= 1;
                       
            end else begin
                 spi_mosi <= 0; 
                 clk_stop <= 0;
                                  // Сброс индекса после завершения передачи
            end
        end else begin
            spi_bit_index <= 0;                                // Сброс MOSI, если SPI не активен
        end
    end

endmodule
