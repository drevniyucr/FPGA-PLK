#include "tim_config.h"

static TIM_HandleTypeDef *pHtim2 = NULL;
static TIM_HandleTypeDef *pHtim3 = NULL;

void TIM2_Init(TIM_HandleTypeDef *htim2)
{
  __HAL_RCC_TIM2_CLK_ENABLE();

  htim2->Instance = TIM2;
  htim2->Init.Prescaler = 9000-1;
  htim2->Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2->Init.Period = 10000-1;
  htim2->Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2->Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;

  HAL_TIM_Base_Init(htim2);

  __HAL_TIM_CLEAR_IT(htim2, TIM_IT_UPDATE);

  HAL_TIM_Base_Start_IT(htim2);

  HAL_NVIC_SetPriority(TIM2_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(TIM2_IRQn);

  pHtim2 = htim2;
}

void TIM3_Init(TIM_HandleTypeDef *htim3)
{
  __HAL_RCC_TIM3_CLK_ENABLE();

  TIM_OC_InitTypeDef sConfigOC = {0};

  htim3->Instance = TIM3;
  htim3->Init.Prescaler = 0;
  htim3->Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3->Init.Period = 999;
  htim3->Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3->Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;

  HAL_TIM_PWM_Init(htim3);

  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 500;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;

  HAL_TIM_PWM_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_1);
  HAL_TIM_PWM_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_2);
  HAL_TIM_PWM_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_3);
  HAL_TIM_PWM_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_4);

  HAL_TIM_PWM_Start(htim3, TIM_CHANNEL_1);
  HAL_TIM_PWM_Start(htim3, TIM_CHANNEL_2);
  HAL_TIM_PWM_Start(htim3, TIM_CHANNEL_3);
  HAL_TIM_PWM_Start(htim3, TIM_CHANNEL_4);

  pHtim3 = htim3;
}

TIM_HandleTypeDef *GetHTIM3(){
	return pHtim3;
}

void TIM2_IRQHandler(void){HAL_TIM_IRQHandler(pHtim2);}

void TIM3_IRQHandler(void){HAL_TIM_IRQHandler(pHtim3);}
