#ifndef COMMON_DEF_H_
#define COMMON_DEF_H_

#include "stm32f7xx_hal.h"

typedef struct{
	uint8_t *CYCL_MESS_STOP;
	uint8_t *UART_RX_OneSymbol;
	uint8_t *SPI_RX_Buff;
	uint8_t *UART_CommandRecived;
	uint8_t *SPI_BuffRecived;
	uint8_t *UART_TxCmpltFlag;
	uint8_t *SPI_CallbackCopyBuff;
}SharedVar;

typedef struct {
	uint16_t pin_number;
	GPIO_TypeDef *port;
	GPIO_PinState state;
	const char *name;
} PinState;

typedef enum {
	HELP,CHK_XPO,
	XP7_O1_ON,  XP7_O2_ON,  XP7_O3_ON,  XP7_O4_ON,
	XP9_O1_ON,  XP9_O2_ON,  XP9_O3_ON,  XP9_O4_ON,
	XP11_O1_ON, XP11_O2_ON, XP11_O3_ON, XP11_O4_ON,

	XP7_O1_OFF,  XP7_O2_OFF,  XP7_O3_OFF,  XP7_O4_OFF,
	XP9_O1_OFF,  XP9_O2_OFF,  XP9_O3_OFF,  XP9_O4_OFF,
	XP11_O1_OFF, XP11_O2_OFF, XP11_O3_OFF, XP11_O4_OFF,

	R1_ON,R1_OFF,R2_ON,R2_OFF,

	ALL_XPO_ON,ALL_XPO_OFF,

	CHK_EN,CHK_EN_CKL,CHK_XPI,

	UNKNOWN,
	XP_COM

} CommandType;

typedef struct {
    const char *cmd_str;
    CommandType type;
} CommandEntry;

#define USART_TX_Buff_size 128
#define INPUT_COUNT 16
#define RELAY_COUNT 2
#define OUTPUT_COUNT 12
#define CRC32_POLYNOMIAL 0xEDB88320
#define CMD_BUFF_SIZE 64
#define SPI_BUFFER_SIZE  36

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
#define XP8_LOOP1_GPIO_Port GPIOC
#define XP8_LOOP1_Pin GPIO_PIN_7
#define XP9_LOOP2_GPIO_Port GPIOC
#define XP9_LOOP2_Pin GPIO_PIN_6
#define XP10_LOOP3_GPIO_Port GPIOC
#define XP10_LOOP3_Pin GPIO_PIN_9
#define XP2_LOOP4_GPIO_Port GPIOB
#define XP2_LOOP4_Pin GPIO_PIN_0
//TIM2
#define TIM2_CH3_GPIO_Port GPIOA
#define TIM2_CH3_Pin GPIO_PIN_2

#define TIM2_CH4_GPIO_Port GPIOA
#define TIM2_CH4_Pin GPIO_PIN_3
//TIM3
#define TIM3_CH1_GPIO_Port GPIOA
#define TIM3_CH1_Pin GPIO_PIN_6

#define TIM3_CH2_GPIO_Port GPIOA
#define TIM3_CH2_Pin GPIO_PIN_7

#define TIM3_CH3_GPIO_Port GPIOB
#define TIM3_CH3_Pin GPIO_PIN_0

#define TIM3_CH4_GPIO_Port GPIOB
#define TIM3_CH4_Pin GPIO_PIN_1


#define CAN1_RX_GPIO_Port GPIOD
#define CAN1_RX_Pin GPIO_PIN_0

#define CAN1_TX_GPIO_Port GPIOD
#define CAN1_TX_Pin GPIO_PIN_1

#define RS485_RX_GPIO_Port GPIOD
#define RS485_RX_Pin GPIO_PIN_2

#define RS485_TX_GPIO_Port GPIOC
#define RS485_TX_Pin GPIO_PIN_12

#define RS485_RE_DE_GPIO_Port GPIOC
#define RS485_RE_DE_Pin GPIO_PIN_11



#endif
