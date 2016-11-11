EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Relais-cache
EELAYER 25 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BC547 Q1
U 1 1 58067C87
P 3950 4550
F 0 "Q1" H 4150 4625 50  0000 L CNN
F 1 "BC547" H 4150 4550 50  0000 L CNN
F 2 "TO-92" H 4150 4475 50  0000 L CIN
F 3 "" H 3950 4550 50  0000 L CNN
	1    3950 4550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 58067DA5
P 5150 4150
F 0 "P2" H 5150 4300 50  0000 C CNN
F 1 "3.5" V 5250 4150 50  0000 C CNN
F 2 "" H 5150 4150 50  0000 C CNN
F 3 "" H 5150 4150 50  0000 C CNN
	1    5150 4150
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58067E4C
P 3400 4550
F 0 "R1" V 3480 4550 50  0000 C CNN
F 1 "2k" V 3400 4550 50  0000 C CNN
F 2 "" V 3330 4550 50  0000 C CNN
F 3 "" H 3400 4550 50  0000 C CNN
	1    3400 4550
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58067F5B
P 3650 4800
F 0 "R2" V 3730 4800 50  0000 C CNN
F 1 "10k" V 3650 4800 50  0000 C CNN
F 2 "" V 3580 4800 50  0000 C CNN
F 3 "" H 3650 4800 50  0000 C CNN
	1    3650 4800
	-1   0    0    1   
$EndComp
$Comp
L Switch_SPDT_x2 SW1
U 1 1 580682AE
P 4500 4000
F 0 "SW1" H 4300 4250 50  0000 C CNN
F 1 "Switch_SPDT_x2" H 4750 4250 50  0000 C CNN
F 2 "" H 4500 4000 50  0000 C CNN
F 3 "" H 4500 4000 50  0000 C CNN
	1    4500 4000
	1    0    0    -1  
$EndComp
NoConn ~ 4800 3900
Wire Wire Line
	4800 4100 4950 4100
Wire Wire Line
	4200 4000 4200 4200
Wire Wire Line
	4200 4200 4950 4200
$Comp
L +12V #PWR4
U 1 1 580686F7
P 4050 3850
F 0 "#PWR4" H 4050 3700 50  0001 C CNN
F 1 "+12V" H 4050 3990 50  0000 C CNN
F 2 "" H 4050 3850 50  0000 C CNN
F 3 "" H 4050 3850 50  0000 C CNN
	1    4050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3850 4050 4000
Wire Wire Line
	4050 4200 4050 4350
Wire Wire Line
	3550 4550 3750 4550
Wire Wire Line
	3650 4650 3650 4550
Connection ~ 3650 4550
$Comp
L GND #PWR3
U 1 1 580687E0
P 3650 5050
F 0 "#PWR3" H 3650 4800 50  0001 C CNN
F 1 "GND" H 3650 4900 50  0000 C CNN
F 2 "" H 3650 5050 50  0000 C CNN
F 3 "" H 3650 5050 50  0000 C CNN
	1    3650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5050 3650 4950
Wire Wire Line
	4050 5000 4050 4750
Connection ~ 3650 5000
Wire Wire Line
	2900 4550 3250 4550
Wire Wire Line
	2500 3900 4050 3900
Connection ~ 4050 3900
$Comp
L C C1
U 1 1 58068C6A
P 3050 4800
F 0 "C1" H 3075 4900 50  0000 L CNN
F 1 "100n" H 3075 4700 50  0000 L CNN
F 2 "" H 3088 4650 50  0000 C CNN
F 3 "" H 3050 4800 50  0000 C CNN
	1    3050 4800
	1    0    0    -1  
$EndComp
$Comp
L L_Small K1
U 1 1 580CAD6A
P 4050 4100
F 0 "K1" H 4100 3900 50  0000 L CNN
F 1 "K" H 4000 4200 50  0000 L CNN
F 2 "" H 4050 4100 50  0000 C CNN
F 3 "" H 4050 4100 50  0000 C CNN
	1    4050 4100
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 580CADD5
P 3900 4100
F 0 "D1" V 4100 4050 50  0000 C CNN
F 1 "1N4001" H 3900 4000 50  0000 C CNN
F 2 "" H 3900 4100 50  0000 C CNN
F 3 "" H 3900 4100 50  0000 C CNN
	1    3900 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 4250 4050 4250
Connection ~ 4050 4250
Wire Wire Line
	3050 4950 3050 5050
Wire Wire Line
	3050 3350 3050 4650
Wire Wire Line
	2900 4650 2900 5000
Connection ~ 3050 5000
$Comp
L PWR_FLAG #FLG3
U 1 1 580CB11E
P 3900 3750
F 0 "#FLG3" H 3900 3845 50  0001 C CNN
F 1 "PWR_FLAG" H 3900 3930 50  0000 C CNN
F 2 "" H 3900 3750 50  0000 C CNN
F 3 "" H 3900 3750 50  0000 C CNN
	1    3900 3750
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG1
U 1 1 580CB14B
P 3050 5050
F 0 "#FLG1" H 3050 5145 50  0001 C CNN
F 1 "PWR_FLAG" H 3050 5230 50  0000 C CNN
F 2 "" H 3050 5050 50  0000 C CNN
F 3 "" H 3050 5050 50  0000 C CNN
	1    3050 5050
	-1   0    0    1   
$EndComp
Connection ~ 3050 3900
Text Notes 4050 10900 0    60   ~ 0
PTT Box
$Comp
L USB_A P4
U 1 1 5824DEF9
P 5050 3300
F 0 "P4" H 5250 3100 50  0000 C CNN
F 1 "USB_A" H 5000 3500 50  0000 C CNN
F 2 "" V 5000 3200 50  0000 C CNN
F 3 "" V 5000 3200 50  0000 C CNN
	1    5050 3300
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 5824E05A
P 2300 3950
F 0 "P1" H 2300 4100 50  0000 C CNN
F 1 "5.5x2.1" V 2400 3950 50  0000 C CNN
F 2 "" H 2300 3950 50  0000 C CNN
F 3 "" H 2300 3950 50  0000 C CNN
	1    2300 3950
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X05 U1
U 1 1 5824E155
P 3250 3150
F 0 "U1" H 3250 3450 50  0000 C CNN
F 1 "AXA003A0X-SRZ" V 3350 3150 50  0000 C CNN
F 2 "" H 3250 3150 50  0000 C CNN
F 3 "" H 3250 3150 50  0000 C CNN
	1    3250 3150
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 5824E497
P 2700 4600
F 0 "P3" H 2700 4750 50  0000 C CNN
F 1 "MTA100-2" V 2800 4600 50  0000 C CNN
F 2 "" H 2700 4600 50  0000 C CNN
F 3 "" H 2700 4600 50  0000 C CNN
	1    2700 4600
	-1   0    0    1   
$EndComp
NoConn ~ 5150 3600
NoConn ~ 4750 3200
NoConn ~ 4750 3300
Connection ~ 3900 3900
$Comp
L GND #PWR2
U 1 1 5824F423
P 3150 3400
F 0 "#PWR2" H 3150 3150 50  0001 C CNN
F 1 "GND" H 3150 3250 50  0000 C CNN
F 2 "" H 3150 3400 50  0000 C CNN
F 3 "" H 3150 3400 50  0000 C CNN
	1    3150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3400 3150 3350
Wire Wire Line
	4200 3100 4750 3100
$Comp
L GND #PWR5
U 1 1 5824F52C
P 4700 3450
F 0 "#PWR5" H 4700 3200 50  0001 C CNN
F 1 "GND" H 4700 3300 50  0000 C CNN
F 2 "" H 4700 3450 50  0000 C CNN
F 3 "" H 4700 3450 50  0000 C CNN
	1    4700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3450 4700 3400
Wire Wire Line
	4600 3400 4750 3400
$Comp
L R R3
U 1 1 5824F595
P 3400 3500
F 0 "R3" V 3480 3500 50  0000 C CNN
F 1 "1k47" V 3400 3500 50  0000 C CNN
F 2 "" V 3330 3500 50  0000 C CNN
F 3 "" H 3400 3500 50  0000 C CNN
	1    3400 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 3500 3250 3350
Wire Wire Line
	3350 3350 3350 3400
Wire Wire Line
	3350 3400 3600 3400
Wire Wire Line
	3600 3400 3600 3500
Wire Wire Line
	3600 3500 3550 3500
Wire Wire Line
	3900 3750 3900 3950
Wire Wire Line
	3450 3350 4200 3350
Wire Wire Line
	4200 3350 4200 3100
Wire Wire Line
	2900 5000 4050 5000
$Comp
L GND #PWR1
U 1 1 58250919
P 2700 4050
F 0 "#PWR1" H 2700 3800 50  0001 C CNN
F 1 "GND" H 2700 3900 50  0000 C CNN
F 2 "" H 2700 4050 50  0000 C CNN
F 3 "" H 2700 4050 50  0000 C CNN
	1    2700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4000 2700 4000
$Comp
L PWR_FLAG #FLG2
U 1 1 58250CBE
P 3850 3250
F 0 "#FLG2" H 3850 3345 50  0001 C CNN
F 1 "PWR_FLAG" H 3850 3430 50  0000 C CNN
F 2 "" H 3850 3250 50  0000 C CNN
F 3 "" H 3850 3250 50  0000 C CNN
	1    3850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3250 3850 3350
Connection ~ 3850 3350
$Comp
L CP C2
U 1 1 582512A5
P 2700 3700
F 0 "C2" H 2725 3800 50  0000 L CNN
F 1 "100u" H 2725 3600 50  0000 L CNN
F 2 "" H 2738 3550 50  0000 C CNN
F 3 "" H 2700 3700 50  0000 C CNN
	1    2700 3700
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 58251446
P 4400 3300
F 0 "C3" H 4425 3400 50  0000 L CNN
F 1 "100u" H 4200 3150 50  0000 L CNN
F 2 "" H 4438 3150 50  0000 C CNN
F 3 "" H 4400 3300 50  0000 C CNN
	1    4400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3150 4400 3100
Connection ~ 4400 3100
Wire Wire Line
	4600 3400 4600 3500
Wire Wire Line
	4600 3500 4400 3500
Wire Wire Line
	4400 3500 4400 3450
Connection ~ 4700 3400
Wire Wire Line
	2700 3850 2700 4050
Connection ~ 2700 4000
Wire Wire Line
	2700 3550 2700 3500
Wire Wire Line
	2700 3500 3050 3500
Connection ~ 3050 3500
$EndSCHEMATC