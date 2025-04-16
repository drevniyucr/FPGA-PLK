#include "uart_driver.h"

uint8_t Try_UART_Transmit(UART_HandleTypeDef *huart,const uint8_t *Pbuff, uint16_t Size){
	uint32_t timeout = HAL_GetTick() + 100; // 100ms таймаут
	while(HAL_GetTick() < timeout){
		if(huart->Instance == USART3 && huart->gState == HAL_UART_STATE_READY ){
			//HAL_UART_Transmit(huart,Pbuff,Size,HAL_MAX_DELAY);
			HAL_UART_Transmit_DMA(huart,Pbuff,Size);
			return 1;
		}
	}
	return 0;
}




