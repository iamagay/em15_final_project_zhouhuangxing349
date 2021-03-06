#include "xparameters.h"
#include "xgpio.h"
#include "xutil.h"
  

//====================================================

int main (void) 
{

    XGpio led, button,key;
	int button_check=0;
	int key_check=0;
	int counter=0;
	
    xil_printf("-- Start of the Program --\r\n");
 
    XGpio_Initialize(&key, XPAR_SWITCH_DEVICE_ID);
	XGpio_SetDataDirection(&key, 1, 0x1);

	XGpio_Initialize(&button, XPAR_BUTTON_DEVICE_ID);
	XGpio_SetDataDirection(&button, 1, 0xf);

	XGpio_Initialize(&led, XPAR_LED_DEVICE_ID);
	XGpio_SetDataDirection(&led, 1, 0x0);
	
	
	while (1)
	{

		button_check = XGpio_DiscreteRead(&button, 1);
		key_check = XGpio_DiscreteRead(&key, 1);
		if(key_check==0)
		{
			if(counter==0)
			{
				XGpio_DiscreteWrite(&led,1,0x0);
				counter=1;
			}
			else if(counter==1)
			{
				XGpio_DiscreteWrite(&led,1,0x1);
				counter=2;
			}
			else if(counter==2)
			{
				XGpio_DiscreteWrite(&led,1,0x2);
				counter=3;
			}
			else if(counter==3)
			{
				XGpio_DiscreteWrite(&led,1,0x4);
				counter=0;
			}
		}
		else if(button_check)
		{
			if(counter!=0)
			{
				XGpio_DiscreteWrite(&led,1,0x7);
				counter=0;
			}
			else
			{
				XGpio_DiscreteWrite(&led,1,0x0);
				counter++;
			}
		}

	//xil_printf("key_check value is %x\r\n",key_check);
	key_check=1;
	button_check=0;
	}
}
