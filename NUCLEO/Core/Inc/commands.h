#ifndef COMMANDS_H_
#define COMMANDS_H_

#include "stm32f7xx_hal.h"

void CommandInint(void);
void log_info(UART_HandleTypeDef *huart,const char *Message, size_t MessageSize);
void CheckCommandRecived(UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi);
void start_CIRC_DMA(UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi);
void UART3_Rx_CallbackHandler(UART_HandleTypeDef *huart);
void process_Command(char *command, UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi);
void send_Prompt(UART_HandleTypeDef *huart);
void send_Error(UART_HandleTypeDef *huart);
void update_Input_State(void);
void AllXPO_Switch(UART_HandleTypeDef *huart, uint8_t mode);
void RecivedMessage(UART_HandleTypeDef *huart,char *command);
void XPI_Check(UART_HandleTypeDef *huart);
uint8_t process_XP_Command(const char *command);
void CycleXPOutCheck(void);


#endif
