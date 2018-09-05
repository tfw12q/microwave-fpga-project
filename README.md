# microwave-fpga-project
Final project for digital systems

DESCRIPTION: 
This is a prototype that is used to apply principles of engineering to create the basic functions of a microwave. The system will, upon being sent to the board, begin counting down from 30 seconds, and stop at 0. The heart of the system is based on the timer, which controls all of the functions. When the timer is counting down, the bits are sent through an 8-input OR gate which is connected to the fan, motors, and buzzer that act as different functionalities of a microwave oven. 
ONBOARD LEFT BUTTON: Using the left push-button on the FPGA, the timer can be set to 30 seconds. 
ONBOARD LED: The LED’s on-board indicate the LSB values because some digits are displayed incorrectly on the 7 segment display but still works correctly.

OVEN LIGHT: An LED will indicate that the oven is on.

TIMER: The timer bits are sent to a 7447 decoder to display the number on a 7 segment display.

SERVO: During operation, there will be a servo motor used to simulate the oven tray that will swivel back and forth. The servo motor is controlled by using the on-board clock and will alternate the swiveling every second. It changes direction, CW to CCW, based on the logical level of the LSB in the counter. 

MOTOR PWM: There will be a motor fan that will have power levels in increments of 10% that is set by using the dip switches on the FPGA board. The increments are selected by using BCD values, 0-9 that will speed up or slow down the fan. The fan is controlled with pulse width modulation (PWM). 

BUZZER: When the timer reaches zero, a Piezo buzzer will continue to beep until the oven is reset or disconnected.

VENT: Two LED’s will represent vent speeds that are controlled by a toggle switch.
