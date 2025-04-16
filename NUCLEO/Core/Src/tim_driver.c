#include "tim_driver.h"
#include "tim_config.h"

static uint16_t duty = 0;
static int16_t step = 100;

TIM_HandleTypeDef *pHTIM3 = NULL;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	if (pHTIM3 == NULL){pHTIM3=GetHTIM3();}

    if (htim->Instance == TIM2) {
        __HAL_TIM_SET_COMPARE(pHTIM3, TIM_CHANNEL_1, duty);
        __HAL_TIM_SET_COMPARE(pHTIM3, TIM_CHANNEL_2, duty);
        __HAL_TIM_SET_COMPARE(pHTIM3, TIM_CHANNEL_3, duty);
        __HAL_TIM_SET_COMPARE(pHTIM3, TIM_CHANNEL_4, duty);
        duty += step;
        if (duty >= 999 || duty == 0) step = -step;
    }
}

