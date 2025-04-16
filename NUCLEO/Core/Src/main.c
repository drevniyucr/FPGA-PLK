#include "main.h"

 UART_HandleTypeDef huart3;
 SPI_HandleTypeDef hspi3;
 TIM_HandleTypeDef htim2;
 TIM_HandleTypeDef htim3;

int main(void){
  HAL_Init();
  System_Config();
  GPIO_Init();
  DMA_Init();
  SPI3_Init(&hspi3);
  USART3_Init(&huart3);
  TIM2_Init(&htim2);
  TIM3_Init(&htim3);
  DMA_Init();
  CommandInint();
  CRC_TableInit();
  start_CIRC_DMA(&huart3,&hspi3);
  send_Prompt(&huart3);

  while (1) {
	  CheckCommandRecived(&huart3, &hspi3);
  }
}


void Error_Handler(void)
{
	__disable_irq();
	while (1) {
	}
}

#ifdef  USE_FULL_ASSERT

void assert_failed(uint8_t *file, uint32_t line)
{

}
#endif
