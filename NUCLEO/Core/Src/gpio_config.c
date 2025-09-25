#include "gpio_config.h"
#include "common_def.h"

void GPIO_Init(void){

  GPIO_InitTypeDef GPIO_InitStruct = {0};

   __HAL_RCC_GPIOC_CLK_ENABLE();
   __HAL_RCC_GPIOF_CLK_ENABLE();
   __HAL_RCC_GPIOA_CLK_ENABLE();
   __HAL_RCC_GPIOB_CLK_ENABLE();
   __HAL_RCC_GPIOE_CLK_ENABLE();
   __HAL_RCC_GPIOD_CLK_ENABLE();
   __HAL_RCC_GPIOG_CLK_ENABLE();

   HAL_GPIO_WritePin(GPIOA,
   	XP7_O3_Pin | XP7_O4_Pin | XP9_O4_Pin , GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOB,
   	XP7_O1_Pin | XP7_O2_Pin | XP9_O1_Pin | XP9_O2_Pin |LD3_Pin | LD2_Pin, GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOD,
   	XP9_O3_Pin, GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOE,
   	XP11_O1_Pin | XP11_O2_Pin | XP11_O3_Pin | XP11_O4_Pin , GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOG,
   	XP13_R1_Pin | XP13_R2_Pin, GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(USB_PowerSwitchOn_GPIO_Port, USB_PowerSwitchOn_Pin,
   			GPIO_PIN_RESET);

   	/* INIT STRUCT */
   	GPIO_InitStruct.Pin = XP7_O3_Pin | XP7_O4_Pin | XP9_O4_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP7_O1_Pin | XP7_O2_Pin | XP9_O1_Pin | XP9_O2_Pin | LD3_Pin | LD2_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP8_LOOP1_Pin
   			| XP9_LOOP2_Pin | XP10_LOOP3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
   	GPIO_InitStruct.Alternate =GPIO_AF2_TIM3;
   	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP2_LOOP4_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
   	GPIO_InitStruct.Alternate =GPIO_AF2_TIM3;
   	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP9_O3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP11_O1_Pin | XP11_O2_Pin | XP11_O3_Pin | XP11_O4_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP13_R1_Pin | XP13_R2_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP8_I4_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP8_I2_Pin | XP8_I3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP8_I1_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP10_I1_Pin | XP10_I2_Pin | XP12_I4_Pin | XP14_I3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);


   	GPIO_InitStruct.Pin = XP12_I1_Pin | XP12_I2_Pin | XP12_I3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOF, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP10_I3_Pin | XP10_I4_Pin | XP14_I1_Pin | XP14_I2_Pin
   			| XP14_I4_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = NSS_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(NSS_GPIO_Port, &GPIO_InitStruct);

 	GPIO_InitStruct.Pin =  USER_Btn_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(USER_Btn_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = USER_Btn_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(USER_Btn_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RMII_TXD1_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF11_ETH;
   	HAL_GPIO_Init(RMII_TXD1_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RMII_MDC_Pin | RMII_RXD0_Pin | RMII_RXD1_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF11_ETH;
   	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RMII_REF_CLK_Pin | RMII_MDIO_Pin | RMII_CRS_DV_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF11_ETH;
   	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = USB_PowerSwitchOn_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(USB_PowerSwitchOn_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = USB_OverCurrent_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(USB_OverCurrent_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = USB_SOF_Pin | USB_ID_Pin | USB_DM_Pin | USB_DP_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF10_OTG_FS;
   	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RMII_TX_EN_Pin | RMII_TXD0_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF11_ETH;
   	HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = STLK_RX_Pin|STLK_TX_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF7_USART3;
   	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = RS485_RX_Pin;
   	GPIO_InitStruct.Alternate = GPIO_AF8_UART5;
   	HAL_GPIO_Init(RS485_RX_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RS485_TX_Pin;
   	HAL_GPIO_Init(RS485_TX_GPIO_Port, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = RS485_RE_DE_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_MEDIUM;
   	GPIO_InitStruct.Alternate = 0;
   	HAL_GPIO_Init(RS485_RE_DE_GPIO_Port, &GPIO_InitStruct);
   	//UART STLINK

   		//CAN
   	GPIO_InitStruct.Pin = CAN1_RX_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF9_CAN1;
   	HAL_GPIO_Init(CAN1_RX_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = CAN1_TX_Pin;
   	HAL_GPIO_Init(CAN1_TX_GPIO_Port, &GPIO_InitStruct);


   	GPIO_InitStruct.Pin = GPIO_PIN_2;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF7_SPI3;
   	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = GPIO_PIN_15;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_PULLUP;
 	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
 	GPIO_InitStruct.Alternate = GPIO_AF6_SPI3;
 	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

 	GPIO_InitStruct.Pin = GPIO_PIN_10;
 	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
 	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
 	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
 	GPIO_InitStruct.Alternate = GPIO_AF6_SPI3;
 	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);
}
