/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stdio.h"
#include "string.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define BUFFER_SIZE 32
#define CMD_BUFFER_SIZE 64
#define INPUT_COUNT 16
#define OUTPUT_COUNT 12
#define RELAY_COUNT 2
#define UART_RX_BUFF_SIZE 10
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

SPI_HandleTypeDef hspi3;
DMA_HandleTypeDef hdma_spi3_rx;

TIM_HandleTypeDef htim3;

UART_HandleTypeDef huart3;
DMA_HandleTypeDef hdma_usart3_tx;
DMA_HandleTypeDef hdma_usart3_rx;

/* USER CODE BEGIN PV */

typedef struct {
	uint16_t pin_number;      /* Номер пина (GPIO_PIN_x)*/
	GPIO_TypeDef *port;       /* Порт (GPIOA, GPIOB и т.д.)*/
	GPIO_PinState state; /* Состояние пина (GPIO_PIN_SET / GPIO_PIN_RESET)*/
	const char *name;
} PinState;



/* Строки определены отдельно, как обычные константные указатели*/
const char *Help_Message = "\r\nAvailable command: \r\n"
        "$CHK_EN - Check encoder data\r\n"
        "$CHK_XPI - Check all XP's inputs\r\n"
        "$XP%x_O%y_ON\\OFF - Enable\\disable output port XP %x (7,9,11) pin %y (1-4)\r\n"
        "$ALL_XPO_ON\\OFF - Enable\\disable all XP's outputs\r\n"
        "$XP13_R%x_ON\\OFF Enable\\disable Relay %x (1,2)\r\n";
const char *Recived_Message = "\r\n$Received: %s \r\n";
const char *FPGA_Problem_Message = "\r\n$FPGA_DISABLED OR DMA ERROR";
const char *XP_Com_Succes_Message = "\r\n$XP_Command is complited";
const char *Encoder_Disabled_Message = "$ENC%u is OFF or invalid data\r\n";
const char *Encoder_State_Message = "$ENC%u: res:  %lu, rev:  %u, pos:  %u \r\n"
                    "       resG: %lu, revG: %u, posG: %u \r\n";
const char *Unknown_Message = "\r\n$Unknown message";
const char *State_Input_Message = "\r\n$State Input %s: %u ";
const char *Enter_Command_Message  = "\r\n$Enter command: ";
const char *Invalid_Command_Message ="\r\n$Invalid command. The command must start with '$'. "
		"Check $HELP for more info.\r\n$Enter command: ";



size_t Size_Help_Message ;
size_t Size_FPGA_Problem_Message ;
size_t Size_XP_Com_Succes_Message ;
size_t Size_Encoder_Disabled_Message;
size_t Size_Encoder_State_Message;
size_t Size_Unknown_Message  ;
size_t Size_State_Input_Message ;
size_t Size_Enter_Command_Message ;
size_t Size_Invalid_Command_Message ;


/* �?нициализация структуры с указанием значений строк и их размеров*/



PinState Input_Pin_Arr[] = {

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

PinState Output_Pin_Arr[] = {

{ XP7_O1_Pin, XP7_O1_GPIO_Port, GPIO_PIN_RESET, "XP7_O1" },
{ XP7_O2_Pin, XP7_O2_GPIO_Port, GPIO_PIN_RESET, "XP7_O2" },
{ XP7_O3_Pin, XP7_O3_GPIO_Port, GPIO_PIN_RESET, "XP7_O3" },
{ XP7_O4_Pin, XP7_O4_GPIO_Port, GPIO_PIN_RESET, "XP7_O4" },

{ XP9_O1_Pin, XP9_O1_GPIO_Port, GPIO_PIN_RESET, "XP9_O1" },
{ XP9_O2_Pin, XP9_O2_GPIO_Port, GPIO_PIN_RESET, "XP9_O2" },
{ XP9_O3_Pin, XP9_O3_GPIO_Port, GPIO_PIN_RESET, "XP9_O3" },
{ XP9_O4_Pin, XP9_O4_GPIO_Port, GPIO_PIN_RESET, "XP9_O4" },

{ XP11_O1_Pin, XP11_O1_GPIO_Port, GPIO_PIN_RESET, "XP11_O1" },
{ XP11_O2_Pin, XP11_O2_GPIO_Port, GPIO_PIN_RESET, "XP11_O3" },
{ XP11_O3_Pin, XP11_O3_GPIO_Port, GPIO_PIN_RESET, "XP11_O3" },
{ XP11_O4_Pin, XP11_O4_GPIO_Port, GPIO_PIN_RESET, "XP11_O4" },
{ XP13_R1_Pin, XP13_R1_GPIO_Port, GPIO_PIN_RESET, "XP13_R1" },
{ XP13_R2_Pin, XP13_R2_GPIO_Port, GPIO_PIN_RESET, "XP13_R2" }
};

typedef enum {
	HELP,
	XP7_O1_ON,  XP7_O2_ON,  XP7_O3_ON,  XP7_O4_ON,
	XP9_O1_ON,  XP9_O2_ON,  XP9_O3_ON,  XP9_O4_ON,
	XP11_O1_ON, XP11_O2_ON, XP11_O3_ON, XP11_O4_ON,

	XP7_O1_OFF,  XP7_O2_OFF,  XP7_O3_OFF,  XP7_O4_OFF,
	XP9_O1_OFF,  XP9_O2_OFF,  XP9_O3_OFF,  XP9_O4_OFF,
	XP11_O1_OFF, XP11_O2_OFF, XP11_O3_OFF, XP11_O4_OFF,

	R1_ON,R1_OFF,R2_ON,R2_OFF,

	ALL_XPO_ON,ALL_XPO_OFF,

	CHK_EN,CHK_XPI,

	UNKNOWN,
	XP_COM
} CommandType;

const char  *All_Commands[] = {
		"$HELP\r",
		"$XP7_O1_ON\r",  "$XP7_O2_ON\r",  "$XP7_O3_ON\r",  "$XP7_O4_ON\r",
	    "$XP9_O1_ON\r",  "$XP9_O2_ON\r",  "$XP9_O3_ON\r",  "$XP9_O4_ON\r",
		"$XP11_O1_ON\r", "$XP11_O2_ON\r", "$XP11_O3_ON\r", "$XP11_O4_ON\r",

		"$XP7_O1_OFF\r",  "$XP7_O2_OFF\r",  "$XP7_O3_OFF\r",  "$XP7_O4_OFF\r",
	    "$XP9_O1_OFF\r",  "$XP9_O2_OFF\r",  "$XP9_O3_OFF\r",  "$XP9_O4_OFF\r",
		"$XP11_O1_OFF\r", "$XP11_O2_OFF\r", "$XP11_O3_OFF\r", "$XP11_O4_OFF\r",

		"$XP13_R1_ON\r","$XP13_R1_OFF\r",
		"$XP13_R2_ON\r","$XP13_R2_OFF\r",

		"$ALL_XPO_ON\r","$ALL_XPO_OFF\r",

		"$CHK_EN\r",
		"$CHK_XPI\r",
		NULL
};


uint8_t SPI_RX_Buffer[BUFFER_SIZE];
char Recived_UART_Buff [CMD_BUFFER_SIZE];
uint8_t UART_RX_Data[UART_RX_BUFF_SIZE];
uint8_t RX_Data[1];
uint8_t cmd_index = 0;                     /* �?ндекс в буфере*/
uint8_t command_active = 0;
uint8_t SPI_Recieve_Complete = 1;
uint8_t UART_Transmit_Complite = 1;
uint8_t Full_Command_Recived = 0;
uint8_t p_UART_BUFF = 0;


/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI3_Init(void);
static void MX_USART3_UART_Init(void);
static void MX_TIM3_Init(void);
/* USER CODE BEGIN PFP */
uint8_t sum_Ones(uint32_t Data);
uint32_t gray_To_Binary(uint32_t gray);
void process_Command(char *command);
uint8_t encoder_Check(uint8_t *buff);
void parser_Command(void);
void send_Prompt(void);
void start_UART_DMA(void);
void send_Error(void);
void update_Input_State(void);
CommandType get_Command_Type(const char *command);
uint8_t process_XP_Command(const char *command);
uint8_t Try_UART_Transmit(UART_HandleTypeDef *hspi,const uint8_t *Pbuff, uint16_t Size);
void MyInit(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI3_Init();
  MX_USART3_UART_Init();
  MX_TIM3_Init();
  /* USER CODE BEGIN 2 */


	MyInit();
	start_UART_DMA();


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
	if (Full_Command_Recived) {
		Full_Command_Recived = 0;
		process_Command(Recived_UART_Buff);
		memset(Recived_UART_Buff,0,sizeof(Recived_UART_Buff));
	}
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	}
}

void MyInit(){
	Size_Help_Message = strlen(Help_Message);
	Size_FPGA_Problem_Message = strlen(FPGA_Problem_Message);
	Size_XP_Com_Succes_Message = strlen(XP_Com_Succes_Message);
	Size_Encoder_Disabled_Message = strlen(Encoder_Disabled_Message);
	Size_Encoder_State_Message = strlen(Encoder_State_Message);
	Size_Unknown_Message =strlen(Unknown_Message) ;
	Size_State_Input_Message =strlen(State_Input_Message);
	Size_Enter_Command_Message = strlen(Enter_Command_Message);
	Size_Invalid_Command_Message = strlen(Invalid_Command_Message);
}

uint8_t Try_UART_Transmit(UART_HandleTypeDef *huart,const uint8_t *Pbuff, uint16_t Size){
	while(1){
		if(huart->Instance == USART3 && UART_Transmit_Complite){
			UART_Transmit_Complite = 0;
			HAL_UART_Transmit_DMA(huart,Pbuff,Size);
			return 1;
		}
	}
	return 0;
}

uint8_t Try_SPI_Receive(SPI_HandleTypeDef *hspi,uint8_t *Pbuff, uint16_t Size){
	while(1){
		if(hspi->Instance == SPI3 && UART_Transmit_Complite){
			SPI_Recieve_Complete = 0;
			HAL_SPI_Receive_DMA(hspi,Pbuff,Size);
			return 1;
		}
	}
	return 0;
}

uint8_t encoder_Check(uint8_t *buff) {
	size_t USART_TX_Buff_size = 150;
	char USART_TX_Buff[USART_TX_Buff_size];
	memset(USART_TX_Buff,0,USART_TX_Buff_size);
	memset(buff,0,BUFFER_SIZE);
	/*uint8_t zero_buffer[BUFFER_SIZE] = { 0 };  Массив, заполненный нулями*/

	uint8_t ID;
	uint8_t _CRC;
	uint32_t Norm_Result;
	uint16_t Norm_Rev;
	uint16_t Norm_Pos;
	uint32_t Gray_Result;
	uint16_t Gray_Rev;
	uint16_t Gray_Pos;
	if (Try_SPI_Receive(&hspi3, buff, BUFFER_SIZE-10) == 0) {
		return (0);
	}else {
		for (int i = 0; i < 8; i++) {

			ID = ((buff[(4*i)+3] >> 5) + 1);
			_CRC = (buff[(4*i)+3] & 0x1F);
			Norm_Result = (uint32_t) ((buff[(4*i)+2] << 16)
					| (buff[(4*i)+1] << 8) | buff[(4*i)]);
			Norm_Rev = (uint16_t) ((Norm_Result >> 12) & 0xFFF);
			Norm_Pos = (uint16_t) (Norm_Result & 0xFFF);
			Gray_Result = gray_To_Binary(Norm_Result);
			Gray_Rev = (uint16_t) ((Gray_Result >> 12) & 0xFFF);
			Gray_Pos = (uint16_t) (Gray_Result & 0xFF);

			if (!(Norm_Rev == 4095 && Norm_Pos == 4095)
					&& (sum_Ones(Norm_Result) == _CRC)) {
				snprintf(USART_TX_Buff, USART_TX_Buff_size,Encoder_State_Message,
						ID,Norm_Result, Norm_Rev, Norm_Pos, Gray_Result, Gray_Rev,Gray_Pos);

				Try_UART_Transmit(&huart3,(uint8_t *)USART_TX_Buff,strlen(USART_TX_Buff));
			} else {

				snprintf(USART_TX_Buff,USART_TX_Buff_size,Encoder_Disabled_Message, ID);
				Try_UART_Transmit(&huart3,(uint8_t *)USART_TX_Buff, strlen(USART_TX_Buff));
			}
		}
	}
	return (1);
}

void update_Input_State(void) {
	for (int i = 0; i < INPUT_COUNT; i++) {
		Input_Pin_Arr[i].state = HAL_GPIO_ReadPin(Input_Pin_Arr[i].port,
				Input_Pin_Arr[i].pin_number);
	}
}

CommandType get_Command_Type(const char *command) {
	size_t $XP_size = 3;
    for (int i = 0; All_Commands[i] != NULL; ++i) {
        if (strcmp(command, All_Commands[i]) == 0) {
        	if(strncmp(command, "$XP",$XP_size) == 0){
        		if(process_XP_Command(command) == 1){
        		return (XP_COM);
        		}
        	}else{
        		return ((CommandType)i);
        	}
        }
    }
    return (UNKNOWN);
}
uint8_t process_XP_Command(const char *command){
	size_t XP_Command_size = 10;
	char* turn_on = strstr(command, "_ON");
	const char *start = strchr(command, '$');
	start++;
	const char *end = strrchr(start, '_');
	char extracted[XP_Command_size];
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

void process_Command(char *command) {
	 if (Recived_UART_Buff[0] != '$') {/* Проверяем, начинается ли команда с '$' */
		        send_Error();
		        return;
		    }
	char Resived_message[100];
	snprintf(Resived_message,100, Recived_Message,command);
	Try_UART_Transmit(&huart3, (uint8_t *) Resived_message, strlen(Resived_message));
	CommandType cmd = get_Command_Type(command);

	switch (cmd) {
	case HELP:
		Try_UART_Transmit(&huart3,(uint8_t *) Help_Message,Size_Help_Message);
		send_Prompt();
	    break;
	case XP_COM:
		Try_UART_Transmit(&huart3, (uint8_t *) XP_Com_Succes_Message, Size_XP_Com_Succes_Message);
		send_Prompt();
		 break;

	case CHK_EN:
		if (!encoder_Check(SPI_RX_Buffer)) {
			Try_UART_Transmit(&huart3,(uint8_t *)Encoder_Disabled_Message,Size_Encoder_Disabled_Message);
			send_Prompt();
		}
		break;
	case ALL_XPO_ON:
		for(uint8_t i =1;i<OUTPUT_COUNT;i++){
			HAL_GPIO_WritePin(Output_Pin_Arr[i].port,Output_Pin_Arr[i].pin_number,
			GPIO_PIN_SET);
		}
		send_Prompt();
		break;
	case ALL_XPO_OFF:
		for(uint8_t i =1;i<OUTPUT_COUNT;i++){
			HAL_GPIO_WritePin(Output_Pin_Arr[i].port,Output_Pin_Arr[i].pin_number,
			GPIO_PIN_RESET);
		}
		send_Prompt();
		break;
	case CHK_XPI:
		size_t Check_Input_Message_Size = 500;
		char Check_Input_Message[500];  /* Массив для хранения сообщения */
		uint16_t offset = 0;
		update_Input_State();
		memset(Check_Input_Message, 0, sizeof(Check_Input_Message));
		for (int i = 0; i < INPUT_COUNT; i++) {
			offset += snprintf(Check_Input_Message + offset, Check_Input_Message_Size - offset,
			State_Input_Message, Input_Pin_Arr[i].name, Input_Pin_Arr[i].state);
		}
		Try_UART_Transmit(&huart3,(uint8_t *) Check_Input_Message,strlen(Check_Input_Message));
		send_Prompt();
		break;
	case UNKNOWN:
		Try_UART_Transmit(&huart3,(uint8_t*)Unknown_Message, Size_Unknown_Message);
		send_Prompt();
		break;
		   /* ... обработка остальных команд */
	default:
		Try_UART_Transmit(&huart3,(uint8_t*)Unknown_Message, Size_Unknown_Message);
		send_Prompt();
	    break;
	    }
	}


uint32_t gray_To_Binary(uint32_t Gray) { /* Перевод из Грея в бинарный*/
	uint32_t Binary = 0;
	Binary = Gray;
	while (Gray >>= 1) {
		Binary ^= Gray;
	}
	return (Binary);
}

uint8_t sum_Ones(uint32_t Data) {
	uint8_t Sum = 0;
	while (Data) {
		Sum += Data & 1; /* Увеличиваем счетчик, если младший бит равен 1 */
		Data >>= 1;
	}       /*Сдвигаем число на 1 бит вправо*/
	return (Sum);
}

void start_UART_DMA(void) {
	send_Prompt();
	HAL_UART_Receive_DMA(&huart3, RX_Data, 1);
}

void send_Prompt(void) {
	Try_UART_Transmit(&huart3,(uint8_t *)Enter_Command_Message, Size_Enter_Command_Message);
}

void send_Error(void) {
	Try_UART_Transmit(&huart3,(uint8_t *) Invalid_Command_Message, Size_Invalid_Command_Message);
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
	if (huart == &huart3) {
		Recived_UART_Buff[p_UART_BUFF] = RX_Data[0];
		p_UART_BUFF++;
		if (RX_Data[0] == '\r'){
		Full_Command_Recived = 1;
		p_UART_BUFF = 0;
		}
	}
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart) {
	if (huart == &huart3) {
		UART_Transmit_Complite = 1;
	}
}

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi) {
	if (hspi == &hspi3) {
		SPI_Recieve_Complete = 1;
	}
}
  /* USER CODE END 3 */


/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure LSE Drive Capability
  */
  HAL_PWR_EnableBkUpAccess();

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 96;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Activate the Over-Drive mode
  */
  if (HAL_PWREx_EnableOverDrive() != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief SPI3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI3_Init(void)
{

  /* USER CODE BEGIN SPI3_Init 0 */

  /* USER CODE END SPI3_Init 0 */

  /* USER CODE BEGIN SPI3_Init 1 */

  /* USER CODE END SPI3_Init 1 */
  /* SPI3 parameter configuration*/
  hspi3.Instance = SPI3;
  hspi3.Init.Mode = SPI_MODE_SLAVE;
  hspi3.Init.Direction = SPI_DIRECTION_2LINES_RXONLY;
  hspi3.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi3.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi3.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi3.Init.NSS = SPI_NSS_HARD_INPUT;
  hspi3.Init.FirstBit = SPI_FIRSTBIT_LSB;
  hspi3.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi3.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi3.Init.CRCPolynomial = 7;
  hspi3.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  hspi3.Init.NSSPMode = SPI_NSS_PULSE_ENABLE;
  if (HAL_SPI_Init(&hspi3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI3_Init 2 */

  /* USER CODE END SPI3_Init 2 */

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  /* USER CODE BEGIN TIM3_Init 0 */

  /* USER CODE END TIM3_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM3_Init 1 */

  /* USER CODE END TIM3_Init 1 */
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 7;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 99;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM3_Init 2 */

  /* USER CODE END TIM3_Init 2 */
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief USART3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART3_UART_Init(void)
{

  /* USER CODE BEGIN USART3_Init 0 */

  /* USER CODE END USART3_Init 0 */

  /* USER CODE BEGIN USART3_Init 1 */

  /* USER CODE END USART3_Init 1 */
  huart3.Instance = USART3;
  huart3.Init.BaudRate = 119600;
  huart3.Init.WordLength = UART_WORDLENGTH_8B;
  huart3.Init.StopBits = UART_STOPBITS_1;
  huart3.Init.Parity = UART_PARITY_NONE;
  huart3.Init.Mode = UART_MODE_TX_RX;
  huart3.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart3.Init.OverSampling = UART_OVERSAMPLING_16;
  huart3.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart3.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART3_Init 2 */

  /* USER CODE END USART3_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Stream0_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream0_IRQn);
  /* DMA1_Stream1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream1_IRQn);
  /* DMA1_Stream3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
   __HAL_RCC_GPIOC_CLK_ENABLE();
   __HAL_RCC_GPIOF_CLK_ENABLE();
   __HAL_RCC_GPIOH_CLK_ENABLE();
   __HAL_RCC_GPIOA_CLK_ENABLE();
   __HAL_RCC_GPIOB_CLK_ENABLE();
   __HAL_RCC_GPIOE_CLK_ENABLE();
   __HAL_RCC_GPIOD_CLK_ENABLE();
   __HAL_RCC_GPIOG_CLK_ENABLE();

   HAL_GPIO_WritePin(GPIOA,
   	XP7_O3_Pin | XP7_O4_Pin | XP9_O4_Pin , GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOB,
   	XP7_O1_Pin | XP7_O2_Pin | XP9_O1_Pin | XP9_O2_Pin |
   	XP5_LOOP3_Pin | LD3_Pin | LD2_Pin, GPIO_PIN_RESET);

   	HAL_GPIO_WritePin(GPIOC,
   	XP2_LOOP1_Pin | XP4_LOOP2_Pin | XP5_LOOP3_Pin, GPIO_PIN_RESET);

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

   	GPIO_InitStruct.Pin = XP7_O1_Pin | XP7_O2_Pin | XP9_O1_Pin | XP9_O2_Pin
   			| XP5_LOOP3_Pin | LD3_Pin | LD2_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = XP2_LOOP1_Pin
   			| XP4_LOOP2_Pin | XP5_LOOP3_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
   	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

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

   	GPIO_InitStruct.Pin = USB_VBUS_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(USB_VBUS_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = NSS_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	HAL_GPIO_Init(NSS_GPIO_Port, &GPIO_InitStruct);

   	GPIO_InitStruct.Pin = RMII_TX_EN_Pin | RMII_TXD0_Pin;
   	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
   	GPIO_InitStruct.Pull = GPIO_NOPULL;
   	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
   	GPIO_InitStruct.Alternate = GPIO_AF11_ETH;
   	HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
	}
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
