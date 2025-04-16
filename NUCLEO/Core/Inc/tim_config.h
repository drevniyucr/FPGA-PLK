#ifndef TIM_CONFIG_H_
#define TIM_CONFIG_H_

#include "stm32f7xx_hal.h"

void TIM2_Init(TIM_HandleTypeDef *htim2);
void TIM3_Init(TIM_HandleTypeDef *htim3);
TIM_HandleTypeDef *GetHTIM3();

#endif
