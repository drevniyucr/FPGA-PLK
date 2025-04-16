#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32f7xx_hal.h"
#include "commands.h"
#include "encoders.h"
#include "system_init.h"
#include "gpio_config.h"
#include "spi_config.h"
#include "tim_config.h"
#include "tim_driver.h"
#include "uart_config.h"


void Error_Handler(void);


#ifdef __cplusplus
}
#endif

#endif
