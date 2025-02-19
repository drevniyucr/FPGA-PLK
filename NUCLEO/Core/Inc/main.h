/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define USER_Btn_Pin GPIO_PIN_13
#define USER_Btn_GPIO_Port GPIOC

//LEDS
#define LD3_Pin GPIO_PIN_14
#define LD3_GPIO_Port GPIOB
#define LD2_Pin GPIO_PIN_7
#define LD2_GPIO_Port GPIOB

#define MCO_Pin GPIO_PIN_0
#define MCO_GPIO_Port GPIOH
//ETH
#define RMII_MDC_Pin GPIO_PIN_1
#define RMII_MDC_GPIO_Port GPIOC
#define RMII_REF_CLK_Pin GPIO_PIN_1
#define RMII_REF_CLK_GPIO_Port GPIOA
#define RMII_MDIO_Pin GPIO_PIN_2
#define RMII_MDIO_GPIO_Port GPIOA
#define RMII_CRS_DV_Pin GPIO_PIN_7
#define RMII_CRS_DV_GPIO_Port GPIOA
#define RMII_RXD0_Pin GPIO_PIN_4
#define RMII_RXD0_GPIO_Port GPIOC
#define RMII_RXD1_Pin GPIO_PIN_5
#define RMII_RXD1_GPIO_Port GPIOC
#define RMII_TXD1_Pin GPIO_PIN_13
#define RMII_TXD1_GPIO_Port GPIOB
#define RMII_TX_EN_Pin GPIO_PIN_11
#define RMII_TX_EN_GPIO_Port GPIOG
#define RMII_TXD0_Pin GPIO_PIN_13
#define RMII_TXD0_GPIO_Port GPIOG

#define STLK_RX_Pin GPIO_PIN_8
#define STLK_RX_GPIO_Port GPIOD
#define STLK_TX_Pin GPIO_PIN_9
#define STLK_TX_GPIO_Port GPIOD

//USB
#define USB_PowerSwitchOn_Pin GPIO_PIN_6
#define USB_PowerSwitchOn_GPIO_Port GPIOG
#define USB_OverCurrent_Pin GPIO_PIN_7
#define USB_OverCurrent_GPIO_Port GPIOG
#define USB_SOF_Pin GPIO_PIN_8
#define USB_SOF_GPIO_Port GPIOA
#define USB_VBUS_Pin GPIO_PIN_9
#define USB_VBUS_GPIO_Port GPIOA
#define USB_ID_Pin GPIO_PIN_10
#define USB_ID_GPIO_Port GPIOA
#define USB_DM_Pin GPIO_PIN_11
#define USB_DM_GPIO_Port GPIOA
#define USB_DP_Pin GPIO_PIN_12
#define USB_DP_GPIO_Port GPIOA

#define TMS_Pin GPIO_PIN_13
#define TMS_GPIO_Port GPIOA

#define TCK_Pin GPIO_PIN_14
#define TCK_GPIO_Port GPIOA

#define NSS_Pin GPIO_PIN_5
#define NSS_GPIO_Port GPIOD


//OUTPUTS
#define XP7_O1_GPIO_Port GPIOB
#define XP7_O1_Pin GPIO_PIN_9
#define XP7_O2_GPIO_Port GPIOB
#define XP7_O2_Pin GPIO_PIN_8
#define XP7_O3_GPIO_Port GPIOA
#define XP7_O3_Pin GPIO_PIN_6
#define XP7_O4_GPIO_Port GPIOA
#define XP7_O4_Pin GPIO_PIN_5

#define XP9_O1_GPIO_Port GPIOB
#define XP9_O1_Pin GPIO_PIN_10
#define XP9_O2_GPIO_Port GPIOB
#define XP9_O2_Pin GPIO_PIN_3
#define XP9_O3_GPIO_Port GPIOD
#define XP9_O3_Pin GPIO_PIN_11
#define XP9_O4_GPIO_Port GPIOA
#define XP9_O4_Pin GPIO_PIN_3


#define XP11_O1_GPIO_Port GPIOE
#define XP11_O1_Pin GPIO_PIN_12
#define XP11_O2_GPIO_Port GPIOE
#define XP11_O2_Pin GPIO_PIN_10
#define XP11_O3_GPIO_Port GPIOE
#define XP11_O3_Pin GPIO_PIN_15
#define XP11_O4_GPIO_Port GPIOE
#define XP11_O4_Pin GPIO_PIN_14


//INPUTS
#define XP8_I1_GPIO_Port GPIOD
#define XP8_I1_Pin GPIO_PIN_3
#define XP8_I2_GPIO_Port GPIOC
#define XP8_I2_Pin GPIO_PIN_0
#define XP8_I3_GPIO_Port GPIOC
#define XP8_I3_Pin GPIO_PIN_2
#define XP8_I4_GPIO_Port GPIOA
#define XP8_I4_Pin GPIO_PIN_4

#define XP10_I1_GPIO_Port GPIOE
#define XP10_I1_Pin GPIO_PIN_4
#define XP10_I2_GPIO_Port GPIOE
#define XP10_I2_Pin GPIO_PIN_2
#define XP10_I3_GPIO_Port GPIOG
#define XP10_I3_Pin GPIO_PIN_3
#define XP10_I4_GPIO_Port GPIOG
#define XP10_I4_Pin GPIO_PIN_2

#define XP12_I1_GPIO_Port GPIOF
#define XP12_I1_Pin GPIO_PIN_9
#define XP12_I2_GPIO_Port GPIOF
#define XP12_I2_Pin GPIO_PIN_8
#define XP12_I3_GPIO_Port GPIOF
#define XP12_I3_Pin GPIO_PIN_2
#define XP12_I4_GPIO_Port GPIOE
#define XP12_I4_Pin GPIO_PIN_5

#define XP14_I1_GPIO_Port GPIOG
#define XP14_I1_Pin GPIO_PIN_10
#define XP14_I2_GPIO_Port GPIOG
#define XP14_I2_Pin GPIO_PIN_15
#define XP14_I3_GPIO_Port GPIOE
#define XP14_I3_Pin GPIO_PIN_6
#define XP14_I4_GPIO_Port GPIOG
#define XP14_I4_Pin GPIO_PIN_1

//RELAYS
#define XP13_R1_GPIO_Port GPIOG
#define XP13_R1_Pin GPIO_PIN_14
#define XP13_R2_GPIO_Port GPIOG
#define XP13_R2_Pin GPIO_PIN_4

//CURRENT LOOP
#define XP2_LOOP1_GPIO_Port GPIOC
#define XP2_LOOP1_Pin GPIO_PIN_7
#define XP4_LOOP2_GPIO_Port GPIOC
#define XP4_LOOP2_Pin GPIO_PIN_6
#define XP5_LOOP3_GPIO_Port GPIOC
#define XP5_LOOP3_Pin GPIO_PIN_9
#define XP5_LOOP4_GPIO_Port GPIOB
#define XP5_LOOP4_Pin GPIO_PIN_0


/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
