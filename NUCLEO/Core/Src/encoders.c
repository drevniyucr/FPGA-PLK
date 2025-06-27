#include "encoders.h"
#include "common_def.h"
#include "uart_driver.h"
#include "stdio.h"
#include "string.h"
#include "messages.h"

uint32_t crc32_table[256];

char USART_TX_Buff[USART_TX_Buff_size];
uint8_t SPI_COPY_BUFF[SPI_BUFFER_SIZE];
uint8_t ID;
uint32_t _CRC;
uint32_t CAlC_CRC;
uint32_t Norm_Result;
uint16_t Norm_Rev;
uint16_t Norm_Pos;

uint8_t encoder_Check(uint8_t *buff,SPI_HandleTypeDef *hspi,UART_HandleTypeDef *huart, SharedVar *Shared) {

	while(1){
		while(1){
			if ((Shared->SPI_BuffRecived)){
			memcpy(SPI_COPY_BUFF,(Shared->SPI_CallbackCopyBuff),SPI_BUFFER_SIZE);
			HAL_Delay(1);
			break;
			}
		}
		CAlC_CRC =  crc32_compute(&SPI_COPY_BUFF[0],SPI_BUFFER_SIZE-4);

		_CRC = (SPI_COPY_BUFF[35] << 24)|
			   (SPI_COPY_BUFF[34] << 16)|
			   (SPI_COPY_BUFF[33] << 8) |
			   (SPI_COPY_BUFF[32]);

		Try_UART_Transmit(huart, (uint8_t*)"\033[2J\033[H", 7);

		for (volatile int i = 0; i < 8; i++) {
			ID = SPI_COPY_BUFF[4*i];
			HAL_Delay(5);
			Norm_Result = (uint32_t) ((SPI_COPY_BUFF[(4*i)+1] << 16)|
									  (SPI_COPY_BUFF[(4*i)+2] << 8) |
					                   SPI_COPY_BUFF[(4*i)+3]);
			Norm_Rev = (uint16_t) ((Norm_Result >> 12) & 0xFFF);
			Norm_Pos = (uint16_t) (Norm_Result & 0xFFF);
			if ((CAlC_CRC == _CRC)) {
				snprintf(USART_TX_Buff, USART_TX_Buff_size,Encoder_State_Message,
						ID,Norm_Result, Norm_Rev, Norm_Pos);
			} else {
				snprintf(USART_TX_Buff,USART_TX_Buff_size,Encoder_Disabled_Message, ID);
			}
			Try_UART_Transmit(huart,(uint8_t *)USART_TX_Buff,strlen(USART_TX_Buff));
		}
		if(*(Shared->CYCL_MESS_STOP) == 1){break;}
		HAL_Delay(50);
	}
	return 1;
}

uint32_t gray_To_Binary(uint32_t Gray)
{
	uint32_t Binary = 0;
	Binary = Gray;

	while (Gray >>= 1) {
		Binary ^= Gray;
	}
	return (Binary);
}

uint8_t sum_Ones(uint32_t Data)
{
	uint8_t Sum = 0;

	while (Data) {
		Sum += Data & 1;
		Data >>= 1;
	}
	return (Sum);
}
void CRC_TableInit(){
	for (uint32_t i = 0; i < 256; i++) {
		uint32_t crc = i;
		for (uint32_t j = 0; j < 8; j++) {
			if (crc & 1){crc = (crc >> 1) ^ CRC32_POLYNOMIAL;}
			else{crc >>= 1;}
		}
		crc32_table[i] = crc;
	}
}

uint32_t crc32_compute(const uint8_t *data, size_t length)
{
    uint32_t crc = 0xFFFFFFFF;

    for (size_t i = 0; i < length; i++) {
        uint8_t index = (crc ^ data[i]) & 0xFF;
        crc = (crc >> 8) ^ crc32_table[index];
    }

    return crc ^ 0xFFFFFFFF;
}

