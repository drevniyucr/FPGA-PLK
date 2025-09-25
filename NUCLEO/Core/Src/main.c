#include "main.h"

 UART_HandleTypeDef huart3;
 TIM_HandleTypeDef htim2;
 TIM_HandleTypeDef htim3;


int main(void){
  HAL_Init();
  System_Config();
  GPIO_Init();
  USART3_Init(&huart3);
  TIM2_Init(&htim2);
  TIM3_Init(&htim3);

  while (1) {

  }
}
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim)
{
    uint32_t index = 0;

    if (htim->Instance == TIM2) {
        if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1) index = 0;
        else if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2) index = 1;
        else if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_3) index = 2;
        else if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_4) index = 3;
    }
    else if (htim->Instance == TIM3) {
        if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1) index = 4;
        else if (htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2) index = 5;
    }

    if (is_first[index] == 0) {
        ic_start[index] = HAL_TIM_ReadCapturedValue(htim, htim->Channel);
        __HAL_TIM_SET_CAPTUREPOLARITY(htim, htim->Channel, TIM_INPUTCHANNELPOLARITY_FALLING);
        is_first[index] = 1;
    } else {
        uint32_t ic_end = HAL_TIM_ReadCapturedValue(htim, htim->Channel);

        if (ic_end >= ic_start[index]) {
            pwm_channels[index] = ic_end - ic_start[index];
        } else {
            pwm_channels[index] = (htim->Instance->ARR - ic_start[index]) + ic_end + 1;
        }

        __HAL_TIM_SET_CAPTUREPOLARITY(htim, htim->Channel, TIM_INPUTCHANNELPOLARITY_RISING);
        is_first[index] = 0;
    }
}

void Error_Handler(void)
{
	__disable_irq();
	while (1) {
	}
}


