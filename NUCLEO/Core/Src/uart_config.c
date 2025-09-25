#include "uart_config.h"


static DMA_HandleTypeDef hdma_usart3_tx;
static DMA_HandleTypeDef hdma_usart3_rx;

static UART_HandleTypeDef *pHUART3 = NULL;
static UART_HandleTypeDef *pHUART5 = NULL;

void USART3_Init(UART_HandleTypeDef *huart){

__HAL_RCC_USART3_CLK_ENABLE();

  huart->Instance = USART3;
  huart->Init.BaudRate = 115200;
  huart->Init.WordLength = UART_WORDLENGTH_8B;
  huart->Init.StopBits = UART_STOPBITS_1;
  huart->Init.Parity = UART_PARITY_NONE;
  huart->Init.Mode = UART_MODE_TX_RX;
  huart->Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart->Init.OverSampling = UART_OVERSAMPLING_16;
  huart->Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart->AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

  hdma_usart3_tx.Instance = DMA1_Stream3;
  hdma_usart3_tx.Init.Channel = DMA_CHANNEL_4;
  hdma_usart3_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;
  hdma_usart3_tx.Init.PeriphInc = DMA_PINC_DISABLE;
  hdma_usart3_tx.Init.MemInc = DMA_MINC_ENABLE;
  hdma_usart3_tx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
  hdma_usart3_tx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
  hdma_usart3_tx.Init.Mode = DMA_NORMAL;
  hdma_usart3_tx.Init.Priority = DMA_PRIORITY_LOW;
  hdma_usart3_tx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;

  HAL_DMA_Init(&hdma_usart3_tx);

  __HAL_LINKDMA(huart,hdmatx,hdma_usart3_tx);

  hdma_usart3_rx.Instance = DMA1_Stream1;
  hdma_usart3_rx.Init.Channel = DMA_CHANNEL_4;
  hdma_usart3_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
  hdma_usart3_rx.Init.PeriphInc = DMA_PINC_DISABLE;
  hdma_usart3_rx.Init.MemInc = DMA_MINC_ENABLE;
  hdma_usart3_rx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
  hdma_usart3_rx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
  hdma_usart3_rx.Init.Mode = DMA_CIRCULAR;
  hdma_usart3_rx.Init.Priority = DMA_PRIORITY_LOW;
  hdma_usart3_rx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;

  HAL_DMA_Init(&hdma_usart3_rx);

  __HAL_LINKDMA(huart,hdmarx,hdma_usart3_rx);

  HAL_NVIC_SetPriority(USART3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(USART3_IRQn);

  HAL_UART_Init(huart);

  RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};
  PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_USART3;
  PeriphClkInitStruct.Usart3ClockSelection = RCC_USART3CLKSOURCE_PCLK1;

  HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct);

  pHUART3 = huart;
}

void UART5_Init(UART_HandleTypeDef *huart){

	 __HAL_RCC_UART5_CLK_ENABLE();

  huart->Instance = UART5;
  huart->Init.BaudRate = 115200;
  huart->Init.WordLength = UART_WORDLENGTH_8B;
  huart->Init.StopBits = UART_STOPBITS_1;
  huart->Init.Parity = UART_PARITY_NONE;
  huart->Init.Mode = UART_MODE_TX_RX;
  huart->Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart->Init.OverSampling = UART_OVERSAMPLING_16;
  huart->Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart->AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;


  HAL_NVIC_SetPriority(USART3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(USART3_IRQn);

  HAL_UART_Init(huart);

  RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};
  PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_UART5;
  PeriphClkInitStruct.Usart3ClockSelection = RCC_UART5CLKSOURCE_PCLK1;

  HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct);

  pHUART5 = huart;
}

void USART3_IRQHandler(void){HAL_UART_IRQHandler(pHUART3);}

void USART5_IRQHandler(void){HAL_UART_IRQHandler(pHUART5);}

void DMA1_Stream3_IRQHandler(void){HAL_DMA_IRQHandler(&hdma_usart3_tx);}

void DMA1_Stream1_IRQHandler(void){HAL_DMA_IRQHandler(&hdma_usart3_rx);}
