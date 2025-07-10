#include "spi_config.h"

static DMA_HandleTypeDef hdma_spi3_rx;
static SPI_HandleTypeDef *pHspi3;

void SPI3_Init(SPI_HandleTypeDef *hspi){

  __HAL_RCC_SPI3_CLK_ENABLE();

  hspi->Instance = SPI3;
  hspi->Init.Mode = SPI_MODE_SLAVE;
  hspi->Init.Direction = SPI_DIRECTION_2LINES_RXONLY;
  hspi->Init.DataSize = SPI_DATASIZE_8BIT;
  hspi->Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi->Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi->Init.NSS = SPI_NSS_HARD_INPUT;
  hspi->Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi->Init.TIMode = SPI_TIMODE_DISABLE;
  hspi->Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi->Init.CRCPolynomial = 7;
  hspi->Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  hspi->Init.NSSPMode = SPI_NSS_PULSE_DISABLE;

  hdma_spi3_rx.Instance = DMA1_Stream0;
  hdma_spi3_rx.Init.Channel = DMA_CHANNEL_0;
  hdma_spi3_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
  hdma_spi3_rx.Init.PeriphInc = DMA_PINC_DISABLE;
  hdma_spi3_rx.Init.MemInc = DMA_MINC_ENABLE;
  hdma_spi3_rx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
  hdma_spi3_rx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
  hdma_spi3_rx.Init.Mode = DMA_CIRCULAR;
  hdma_spi3_rx.Init.Priority = DMA_PRIORITY_HIGH;
  hdma_spi3_rx.Init.FIFOMode = DMA_FIFOMODE_ENABLE;

  HAL_DMA_Init(&hdma_spi3_rx);

  __HAL_LINKDMA(hspi,hdmarx,hdma_spi3_rx);

  HAL_NVIC_SetPriority(SPI3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(SPI3_IRQn);

  HAL_SPI_Init(hspi);

  pHspi3 = hspi;
}

void SPI3_IRQHandler(void){HAL_SPI_IRQHandler(pHspi3);}

void DMA1_Stream0_IRQHandler(void){HAL_DMA_IRQHandler(&hdma_spi3_rx);}
