#include "system_init.h"

void System_Config(void){

	 RCC_OscInitTypeDef RCC_OscInitStruct = {0};
	    RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

	    // 1. Включаем питание и конфигурацию регулятора напряжения
	    __HAL_RCC_PWR_CLK_ENABLE();
	    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	    // 2. Настройка HSE и PLL
	    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	    RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	    RCC_OscInitStruct.PLL.PLLM = 4;
	    RCC_OscInitStruct.PLL.PLLN = 144; // 8MHz / 4 * 144 = 288 -> /2 = 144 MHz SYSCLK
	    RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	    RCC_OscInitStruct.PLL.PLLQ = 4;
	    RCC_OscInitStruct.PLL.PLLR = 2;
	    HAL_RCC_OscConfig(&RCC_OscInitStruct);

	    // 3. Настройка делителей шин
	    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK |
	                                  RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;        // HCLK = SYSCLK = 144 MHz
	    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;         // APB1 = 36 MHz ✅
	    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;         // APB2 = 72 MHz

	    HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4); // FLASH_LATENCY для 144 МГц
}

void DMA_Init(void){

  __HAL_RCC_DMA1_CLK_ENABLE();

  HAL_NVIC_SetPriority(DMA1_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream0_IRQn);

  HAL_NVIC_SetPriority(DMA1_Stream1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream1_IRQn);

  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);
}



