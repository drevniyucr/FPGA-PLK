#include "messages.h"

const char *Help_Message = "\r\nAvailable command: \r\n"
        "$CHK_EN - Check encoder data\r\n"
		"$CHK_EN_CKL - Check encoder data in cycle mode\r\n"
        "$CHK_XPI - Check all XP's inputs\r\n"
		"$CHK_XPO - Check all XP's outputs in cycle mode\r\n"
        "$XP%x_O%y_ON\\OFF - Enable\\disable output port XP %x (7,9,11) pin %y (1-4)\r\n"
        "$ALL_XPO_ON\\OFF - Enable\\disable all XP's outputs\r\n"
        "$RLY%x_ON\\OFF Enable\\disable Relay %x (1,2)\r\n";

const char *Recived_Message = "\r\n$Received: %s";

const char *FPGA_Problem_Message = "\r\n$FPGA_DISABLED OR DMA ERROR";

const char *XP_Com_Success_Message = "\r\n$XP_Command is complited";

const char *Encoder_Disabled_Message = "$ENC%u is OFF or invalid data\r\n";

const char *Encoder_State_Message = "$ENC%lu: res:%lu, rev:%lu, pos:%lu \r\n";

const char *Unknown_Message = "\r\n$Unknown message";

const char *State_Input_Message = "\r\n$State Input %s: %u ";

const char *Enter_Command_Message  = "\r\n$Enter command: ";

const char *Invalid_Command_Message = "\r\n$Invalid command. The command must start with '$'. "
		"Check $HELP for more info.\r\n$Enter command: ";

