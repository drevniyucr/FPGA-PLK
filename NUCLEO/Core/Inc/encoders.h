#ifndef ENCODERS_H_
#define ENCODERS_H_

#include "stm32f7xx_hal.h"
#include "common_def.h"

uint8_t encoder_Check (uint8_t *buff,SPI_HandleTypeDef *hspi,
					   UART_HandleTypeDef *huart, SharedVar *Shared);
uint8_t sum_Ones(uint32_t Data);
uint32_t gray_To_Binary(uint32_t gray);
uint32_t crc32_compute(const uint8_t *data, size_t length);
void CRC_TableInit(void);


#endif
