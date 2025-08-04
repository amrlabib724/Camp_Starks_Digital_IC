
/*==================******************************************================*
 *==================**   Author: Mohamed Samir Hashish      **================*
 *==================**               NTI                    **================*
 *==================******************************************================*/

#include "../LIB/BIT_MATH.h"
#include "../LIB/STD_TYPES.h"
#include "util/delay.h"
//#include "avr/io.h"
#include "../MCAL/DIO/DIO_Interface.h"
#include "../MCAL/EXT_INT/EXTINT_Interface.h"
#include "../MCAL/UART/UART_Interface.h"
#include "../MCAL/GIE/GIE_Interface.h"
#include "../MCAL/ADC/ADC_Interface.h"
#include "../MCAL/TIMER0/TMR0_Interface.h"
#include "../HAL/KEYPAD/KPD_Interface.h"
#include "../HAL/LCD/LCD_Interface.h"
#include "../MCAL/TIMER1/TIMER1_int.h"
#include "../MCAL/I2C/TWI_int.h"
#include "../MCAL/I2C/TWI_private.h"
#include "../HAL/EEPROM/EXT_EEPROM_int.h"
#include "../MCAL/SPI/SPI_Interface.h"
#include <util/delay.h>
#include"string.h"
#ifndef F_CPU
#define F_CPU 8000000UL
#endif




int main()
{

	LCD_voidInit();



	while(1)
	{



	}/* end of ----->  while(1)*/


	return 0 ;
}

