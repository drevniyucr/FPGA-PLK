#include "commands.h"
#include "encoders.h"
#include "stdio.h"
#include "common_def.h"
#include "uart_driver.h"
#include "string.h"
#include "messages.h"

static const CommandEntry command_table[] = {
    {"$HELP", HELP},
    {"$CHK_XPO", CHK_XPO},

    {"$XP7_O1_ON", XP7_O1_ON},   {"$XP7_O2_ON", XP7_O2_ON},
    {"$XP7_O3_ON", XP7_O3_ON},   {"$XP7_O4_ON", XP7_O4_ON},
    {"$XP9_O1_ON", XP9_O1_ON},   {"$XP9_O2_ON", XP9_O2_ON},
    {"$XP9_O3_ON", XP9_O3_ON},   {"$XP9_O4_ON", XP9_O4_ON},
    {"$XP11_O1_ON", XP11_O1_ON}, {"$XP11_O2_ON", XP11_O2_ON},
    {"$XP11_O3_ON", XP11_O3_ON}, {"$XP11_O4_ON", XP11_O4_ON},

    {"$XP7_O1_OFF", XP7_O1_OFF},   {"$XP7_O2_OFF", XP7_O2_OFF},
    {"$XP7_O3_OFF", XP7_O3_OFF},   {"$XP7_O4_OFF", XP7_O4_OFF},
    {"$XP9_O1_OFF", XP9_O1_OFF},   {"$XP9_O2_OFF", XP9_O2_OFF},
    {"$XP9_O3_OFF", XP9_O3_OFF},   {"$XP9_O4_OFF", XP9_O4_OFF},
    {"$XP11_O1_OFF", XP11_O1_OFF}, {"$XP11_O2_OFF", XP11_O2_OFF},
    {"$XP11_O3_OFF", XP11_O3_OFF}, {"$XP11_O4_OFF", XP11_O4_OFF},

    {"$RLY1_ON", R1_ON},   {"$RLY1_OFF", R1_OFF},
    {"$RLY2_ON", R2_ON},   {"$RLY2_OFF", R2_OFF},

    {"$ALL_XPO_ON", ALL_XPO_ON},
    {"$ALL_XPO_OFF", ALL_XPO_OFF},

    {"$CHK_EN", CHK_EN},
    {"$CHK_EN_CKL", CHK_EN_CKL},
    {"$CHK_XPI", CHK_XPI},

    {"$XP_COM", XP_COM},

    {NULL, UNKNOWN}
};

static PinState Input_Pin_Arr[] = {

{ XP8_I1_Pin, XP8_I1_GPIO_Port, GPIO_PIN_RESET, "XP8_I1" },
{ XP8_I2_Pin, XP8_I2_GPIO_Port, GPIO_PIN_RESET, "XP8_I2" },
{ XP8_I3_Pin, XP8_I3_GPIO_Port, GPIO_PIN_RESET, "XP8_I3" },
{ XP8_I4_Pin, XP8_I4_GPIO_Port, GPIO_PIN_RESET, "XP8_I4" },

{ XP10_I1_Pin,XP10_I1_GPIO_Port, GPIO_PIN_RESET, "XP10_I1" },
{ XP10_I2_Pin,XP10_I2_GPIO_Port, GPIO_PIN_RESET, "XP10_I2" },
{ XP10_I3_Pin,XP10_I3_GPIO_Port, GPIO_PIN_RESET, "XP10_I3" },
{ XP10_I4_Pin,XP10_I4_GPIO_Port, GPIO_PIN_RESET, "XP10_I4" },

{ XP12_I1_Pin,XP12_I1_GPIO_Port, GPIO_PIN_RESET, "XP12_I1" },
{ XP12_I2_Pin,XP12_I2_GPIO_Port, GPIO_PIN_RESET, "XP12_I2" },
{ XP12_I3_Pin,XP12_I3_GPIO_Port, GPIO_PIN_RESET, "XP12_I3" },
{ XP12_I4_Pin,XP12_I4_GPIO_Port, GPIO_PIN_RESET, "XP12_I4" },

{ XP14_I1_Pin,XP14_I1_GPIO_Port, GPIO_PIN_RESET, "XP14_I1" },
{ XP14_I2_Pin,XP14_I2_GPIO_Port, GPIO_PIN_RESET, "XP14_I2" },
{ XP14_I3_Pin,XP14_I3_GPIO_Port, GPIO_PIN_RESET, "XP14_I3" },
{ XP14_I4_Pin,XP14_I4_GPIO_Port, GPIO_PIN_RESET, "XP14_I4" },
};

static PinState Output_Pin_Arr[] = {

{ XP7_O1_Pin, XP7_O1_GPIO_Port, GPIO_PIN_RESET, "XP7_O1" },
{ XP7_O2_Pin, XP7_O2_GPIO_Port, GPIO_PIN_RESET, "XP7_O2" },
{ XP7_O3_Pin, XP7_O3_GPIO_Port, GPIO_PIN_RESET, "XP7_O3" },
{ XP7_O4_Pin, XP7_O4_GPIO_Port, GPIO_PIN_RESET, "XP7_O4" },

{ XP9_O1_Pin, XP9_O1_GPIO_Port, GPIO_PIN_RESET, "XP9_O1" },
{ XP9_O2_Pin, XP9_O2_GPIO_Port, GPIO_PIN_RESET, "XP9_O2" },
{ XP9_O3_Pin, XP9_O3_GPIO_Port, GPIO_PIN_RESET, "XP9_O3" },
{ XP9_O4_Pin, XP9_O4_GPIO_Port, GPIO_PIN_RESET, "XP9_O4" },

{ XP11_O1_Pin, XP11_O1_GPIO_Port, GPIO_PIN_RESET, "XP11_O1" },
{ XP11_O2_Pin, XP11_O2_GPIO_Port, GPIO_PIN_RESET, "XP11_O2" },
{ XP11_O3_Pin, XP11_O3_GPIO_Port, GPIO_PIN_RESET, "XP11_O3" },
{ XP11_O4_Pin, XP11_O4_GPIO_Port, GPIO_PIN_RESET, "XP11_O4" },
{ XP13_R1_Pin, XP13_R1_GPIO_Port, GPIO_PIN_RESET, "XP13_R1" },
{ XP13_R2_Pin, XP13_R2_GPIO_Port, GPIO_PIN_RESET, "XP13_R2" }
};

size_t Size_Help_Message;
size_t Size_FPGA_Problem_Message;
size_t Size_XP_Com_Success_Message;
size_t Size_Encoder_State_Message;
size_t Size_Unknown_Message ;
size_t Size_State_Input_Message;
size_t Size_Enter_Command_Message;
size_t Size_Invalid_Command_Message;
size_t Size_Encoder_Disabled_Message;

uint8_t CycleMessStop = 1;
uint8_t RX_Data [1];
uint8_t SPI_RX_Buffer[SPI_BUFFER_SIZE];
uint8_t Full_Command_Recived = 0;
uint8_t SPI_Recieve_Complete = 0;
uint8_t UART_TxComplite = 1;
uint8_t SPI_CallbackCopyBuff[SPI_BUFFER_SIZE];

volatile uint8_t p_UART_BUFF = 0;
char ResivedMsgBuff[100];

char Recived_UART_Buff[CMD_BUFF_SIZE];

SharedVar ShrVar ={
		.CYCL_MESS_STOP = &CycleMessStop,
		.SPI_BuffRecived = &SPI_Recieve_Complete,
		.SPI_RX_Buff = SPI_RX_Buffer,
		.UART_CommandRecived = &Full_Command_Recived,
		.UART_RX_OneSymbol = RX_Data,
		.UART_TxCmpltFlag = &UART_TxComplite,
		.SPI_CallbackCopyBuff = SPI_CallbackCopyBuff
};

CommandType identify_command(char *cmd);

void CommandInint(){

	Size_Help_Message = strlen(Help_Message);
	Size_FPGA_Problem_Message = strlen(FPGA_Problem_Message);
	Size_XP_Com_Success_Message = strlen(XP_Com_Success_Message);
	Size_Encoder_Disabled_Message = strlen(Encoder_Disabled_Message);
	Size_Encoder_State_Message = strlen(Encoder_State_Message);
	Size_Unknown_Message =strlen(Unknown_Message) ;
	Size_State_Input_Message =strlen(State_Input_Message);
	Size_Enter_Command_Message = strlen(Enter_Command_Message);
	Size_Invalid_Command_Message = strlen(Invalid_Command_Message);
}

CommandType identify_command(char *cmd){

	size_t $XP_size = 3;

    for (int i = 0; command_table[i].cmd_str != NULL; i++) {
        if (strcmp(command_table[i].cmd_str, cmd) == 0) {
        	if(strncmp(cmd, "$XP",$XP_size) == 0) {
        		if(process_XP_Command(cmd) == 1) {return XP_COM;}
        	}else{return command_table[i].type;}
        }
    }
    return UNKNOWN;
}

void process_Command(char *command, UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi){

	RecivedMessage(huart,command);
	CommandType cmd = identify_command(command);
	switch (cmd) {

	case HELP:
		log_info(huart,Help_Message,Size_Help_Message);
	    break;

	case XP_COM:
		log_info(huart,XP_Com_Success_Message,Size_XP_Com_Success_Message);
		 break;

	case CHK_XPO:
		CycleXPOutCheck();
		break;

	case CHK_EN:
		encoder_Check(SPI_RX_Buffer,hspi,huart,&ShrVar);
		break;

	case CHK_EN_CKL:
		CycleMessStop = 0;
		encoder_Check(SPI_RX_Buffer,hspi,huart,&ShrVar);
		break;

	case ALL_XPO_ON:
		AllXPO_Switch(huart,1);
		break;

	case ALL_XPO_OFF:
		AllXPO_Switch(huart,0);
		break;

	case CHK_XPI:
		XPI_Check(huart);
		break;

	case R1_ON:
		HAL_GPIO_WritePin(Output_Pin_Arr[12].port,Output_Pin_Arr[12].pin_number, GPIO_PIN_SET);
		break;
	case R2_ON:
		HAL_GPIO_WritePin(Output_Pin_Arr[13].port,Output_Pin_Arr[13].pin_number, GPIO_PIN_SET);
		break;
	case R1_OFF:
		HAL_GPIO_WritePin(Output_Pin_Arr[12].port,Output_Pin_Arr[12].pin_number, GPIO_PIN_RESET);
		break;
	case R2_OFF:
		HAL_GPIO_WritePin(Output_Pin_Arr[13].port,Output_Pin_Arr[13].pin_number, GPIO_PIN_RESET);
		break;

	case UNKNOWN:
		log_info(huart,Unknown_Message,Size_Unknown_Message);
		break;

	default:
		log_info(huart,Unknown_Message,Size_Unknown_Message);
	    break;
	}
}

void RecivedMessage (UART_HandleTypeDef *huart, char *cmd){
	size_t len = strlen(cmd);
	cmd[len - 1] = '\0';
	snprintf(ResivedMsgBuff,100,Recived_Message, cmd);
	Try_UART_Transmit(huart, (const uint8_t *) ResivedMsgBuff,strlen(ResivedMsgBuff));
}

void XPI_Check(UART_HandleTypeDef *huart){

	size_t Check_Input_Message_Size = 500;
	char Check_Input_Message[500] = {0};
	uint16_t offset = 0;

	update_Input_State();

	for (int i = 0; i < INPUT_COUNT; i++) {

		offset += snprintf(Check_Input_Message + offset, Check_Input_Message_Size - offset,
		State_Input_Message, Input_Pin_Arr[i].name, Input_Pin_Arr[i].state);
	}
	log_info(huart, Check_Input_Message, strlen(Check_Input_Message));
}

void AllXPO_Switch(UART_HandleTypeDef *huart, uint8_t mode){

	for (int i = 0; i < OUTPUT_COUNT + RELAY_COUNT; i++){
		HAL_GPIO_WritePin(Output_Pin_Arr[i].port,Output_Pin_Arr[i].pin_number,
						  mode ? GPIO_PIN_SET : GPIO_PIN_RESET);
	}
	send_Prompt(huart);
}

void CycleXPOutCheck(void){

	CycleMessStop = 0;
	for (int i = 0; i < OUTPUT_COUNT + RELAY_COUNT; i++){
		HAL_GPIO_WritePin(Output_Pin_Arr[i].port, Output_Pin_Arr[i].pin_number,GPIO_PIN_RESET);
	}
	while(!CycleMessStop){
		for (int i = 0; i < 14; i++){
			HAL_GPIO_TogglePin(Output_Pin_Arr[i].port, Output_Pin_Arr[i].pin_number);
			HAL_Delay(150);
		}
	}
}

void update_Input_State(void){

	for (int i = 0; i < INPUT_COUNT; i++) {
		Input_Pin_Arr[i].state = HAL_GPIO_ReadPin(Input_Pin_Arr[i].port,Input_Pin_Arr[i].pin_number);
	}
}

uint8_t process_XP_Command(const char *command){

	size_t XP_Command_size = 10;
	char* turn_on = strstr(command, "_ON");
	const char *start = strchr(command, '$');
	const char *end = strrchr(start, '_');
	char extracted[XP_Command_size];

	start++;

	size_t len = end - start;

	strncpy(extracted, start, len);
	extracted[len] = '\0';

	for(int i = 0;i<OUTPUT_COUNT+RELAY_COUNT;i++){

		if(strcmp(Output_Pin_Arr[i].name, extracted) == 0){
			HAL_GPIO_WritePin(Output_Pin_Arr[i].port, Output_Pin_Arr[i].pin_number,
					turn_on ? GPIO_PIN_SET : GPIO_PIN_RESET);
			return (1);
		}
	}
	return (0);
}

void log_info(UART_HandleTypeDef *huart,const char *Message, size_t MessageSize){

	Try_UART_Transmit(huart, (const uint8_t *)Message,(uint16_t) MessageSize);
	send_Prompt(huart);
}

void CheckCommandRecived(UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi){

	if (hspi->State == HAL_SPI_STATE_BUSY_RX){
		SPI_Recieve_Complete = 0;
	}
	if (Full_Command_Recived) {
		Full_Command_Recived = 0;
		process_Command(Recived_UART_Buff,huart,hspi);
		memset(Recived_UART_Buff,0,sizeof(Recived_UART_Buff));
	}
}

void start_CIRC_DMA(UART_HandleTypeDef *huart,SPI_HandleTypeDef *hspi){

	HAL_UART_Receive_DMA(huart, RX_Data, 1);

	uint32_t timeout = HAL_GetTick() + 100; // 100ms таймаут

	while(HAL_GetTick() < timeout){
		if(GPIOA->IDR & GPIO_IDR_ID15){
			HAL_SPI_Receive_DMA(hspi, SPI_RX_Buffer, SPI_BUFFER_SIZE);
			break;
		}
	}
}

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi){

	if (hspi->Instance == SPI3) {
		SPI_Recieve_Complete = 1;
		memcpy(SPI_CallbackCopyBuff,SPI_RX_Buffer,SPI_BUFFER_SIZE);
	}
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart){

	if (huart->Instance == USART3) {
		Recived_UART_Buff[p_UART_BUFF] = RX_Data[0];
		p_UART_BUFF++;

		if (RX_Data[0] == '\r'){
			CycleMessStop = 1;
			Full_Command_Recived = 1;
			p_UART_BUFF = 0;
		}
	}
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart){
	UART_TxComplite = 1;
}
void send_Prompt(UART_HandleTypeDef *huart){

	Try_UART_Transmit(huart,(uint8_t *)Enter_Command_Message, Size_Enter_Command_Message);
}

void send_Error(UART_HandleTypeDef *huart){

	Try_UART_Transmit(huart,(uint8_t *) Invalid_Command_Message, Size_Invalid_Command_Message);
}

