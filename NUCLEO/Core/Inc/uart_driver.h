#ifndef UART_DRIVER_H_
#define UART_DRIVER_H_


#include "stm32f7xx_hal.h"

uint8_t Try_UART_Transmit(UART_HandleTypeDef *huart,const uint8_t *Pbuff, uint16_t Size);

#endif
