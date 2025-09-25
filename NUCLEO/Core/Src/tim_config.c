#include "tim_config.h"

static TIM_HandleTypeDef *pHtim2 = NULL;
static TIM_HandleTypeDef *pHtim3 = NULL;

void TIM2_Init(TIM_HandleTypeDef *htim2)
{
	__HAL_RCC_TIM2_CLK_ENABLE();

	htim2->Instance = TIM2;
	htim2->Init.Prescaler = 216 - 1;
	htim2->Init.CounterMode = TIM_COUNTERMODE_UP;
	htim2->Init.Period = 20000 - 1;
	htim2->Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;

	HAL_TIM_IC_Init(htim2);

	TIM_IC_InitTypeDef sConfigIC = { 0 };

	sConfigIC.ICPolarity = TIM_INPUTCHANNELPOLARITY_RISING;
	sConfigIC.ICSelection = TIM_ICSELECTION_DIRECTTI;
	sConfigIC.ICPrescaler = TIM_ICPSC_DIV1;
	sConfigIC.ICFilter = 0;


	HAL_TIM_IC_ConfigChannel(htim2, &sConfigOC, TIM_CHANNEL_3);
	HAL_TIM_IC_ConfigChannel(htim2, &sConfigOC, TIM_CHANNEL_4);


	HAL_TIM_IC_Start_IT(htim2, TIM_CHANNEL_3);
	HAL_TIM_IC_Start_IT(htim2, TIM_CHANNEL_4);

	HAL_NVIC_SetPriority(TIM2_IRQn, 1, 0);
	HAL_NVIC_EnableIRQ(TIM2_IRQn);

	pHtim2 = htim2;
}

void TIM3_Init(TIM_HandleTypeDef *htim3)
{
	__HAL_RCC_TIM3_CLK_ENABLE();

	htim3->Instance = TIM3;
	htim3->Init.Prescaler = 216 - 1;
	htim3->Init.CounterMode = TIM_COUNTERMODE_UP;
	htim3->Init.Period = 20000 - 1;
	htim3->Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;

	HAL_TIM_IC_Init(htim3);

	TIM_IC_InitTypeDef sConfigIC = { 0 };

	sConfigIC.ICPolarity = TIM_INPUTCHANNELPOLARITY_RISING;
	sConfigIC.ICSelection = TIM_ICSELECTION_DIRECTTI;
	sConfigIC.ICPrescaler = TIM_ICPSC_DIV1;
	sConfigIC.ICFilter = 0;

	HAL_TIM_IC_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_1);
	HAL_TIM_IC_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_2);
	HAL_TIM_IC_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_3);
	HAL_TIM_IC_ConfigChannel(htim3, &sConfigOC, TIM_CHANNEL_4);

	HAL_TIM_IC_Start_IT(htim3, TIM_CHANNEL_1);
	HAL_TIM_IC_Start_IT(htim3, TIM_CHANNEL_2);
	HAL_TIM_IC_Start_IT(htim3, TIM_CHANNEL_3);
	HAL_TIM_IC_Start_IT(htim3, TIM_CHANNEL_4);



	HAL_NVIC_SetPriority(TIM3_IRQn, 1, 0);
	HAL_NVIC_EnableIRQ(TIM3_IRQn);

	pHtim3 = htim3;
}

TIM_HandleTypeDef* GetHTIM3(){
	return pHtim3;
}

void TIM2_IRQHandler(void){
	HAL_TIM_IRQHandler(pHtim2);
}

void TIM3_IRQHandler(void){
	HAL_TIM_IRQHandler(pHtim3);
}
