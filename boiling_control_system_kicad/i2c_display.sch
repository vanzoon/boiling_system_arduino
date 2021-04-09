EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L power_GOST:COMMON_ PWR5
U 1 1 60404158
P 4410 3095
F 0 "PWR5" H 4470 2985 50  0001 C CNN
F 1 "COMMON_" H 4605 3130 50  0001 C CNN
F 2 "" H 4410 3025 50  0001 C CNN
F 3 "" H 4410 3025 50  0001 C CNN
	1    4410 3095
	1    0    0    -1  
$EndComp
Wire Wire Line
	6760 2130 5720 2130
Wire Wire Line
	6760 2230 5720 2230
Wire Wire Line
	5720 2330 6760 2330
$Comp
L power_GOST:COMMON_ PWR10
U 1 1 60404161
P 6785 4230
F 0 "PWR10" H 6845 4120 50  0001 C CNN
F 1 "COMMON_" H 6980 4265 50  0001 C CNN
F 2 "" H 6785 4160 50  0001 C CNN
F 3 "" H 6785 4160 50  0001 C CNN
	1    6785 4230
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network03 RN1
U 1 1 60404167
P 4410 1855
F 0 "RN1" H 4575 1945 50  0000 L CNN
F 1 "10K" H 4580 1875 31  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP4" V 4685 1855 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4410 1855 50  0001 C CNN
	1    4410 1855
	1    0    0    -1  
$EndComp
Wire Wire Line
	7560 2630 7660 2630
$Comp
L Device:R_Small R11
U 1 1 6040416E
P 6335 3855
F 0 "R11" H 6265 3809 50  0000 R CNN
F 1 "4,7K" H 6265 3900 31  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6265 3855 50  0001 C CNN
F 3 "~" H 6335 3855 50  0001 C CNN
	1    6335 3855
	-1   0    0    1   
$EndComp
Wire Wire Line
	6760 2030 5720 2030
Connection ~ 6335 3680
$Comp
L Display_Character:HY1602E DS1
U 1 1 60404176
P 7160 2630
F 0 "DS1" H 7210 1755 50  0000 L CNN
F 1 "HY1602E" H 7210 1855 50  0000 L CNN
F 2 "Display:HY1602E" H 7160 1730 50  0001 C CIN
F 3 "http://www.icbank.com/data/ICBShop/board/HY1602E.pdf" H 7360 2730 50  0001 C CNN
	1    7160 2630
	1    0    0    1   
$EndComp
NoConn ~ 6760 2730
NoConn ~ 6760 2630
NoConn ~ 6760 2530
NoConn ~ 6760 2430
Wire Wire Line
	6785 3830 6785 3805
Wire Wire Line
	6485 4030 6335 4030
Wire Wire Line
	6335 3680 6335 3755
Wire Wire Line
	6335 3955 6335 4030
Wire Wire Line
	4310 2055 4310 2230
Wire Wire Line
	7160 3430 6335 3430
Wire Wire Line
	6335 3430 6335 3680
Connection ~ 6335 3430
Wire Wire Line
	6560 2930 6560 2730
Wire Wire Line
	6485 3030 6485 2630
Wire Wire Line
	6410 3230 6410 2530
Wire Wire Line
	6485 2630 5720 2630
Wire Wire Line
	6560 2730 5720 2730
Wire Wire Line
	6410 2530 5720 2530
Wire Wire Line
	6560 2930 6760 2930
Wire Wire Line
	6485 3030 6760 3030
Wire Wire Line
	6410 3230 6760 3230
Wire Wire Line
	7560 3230 7560 3555
Connection ~ 6335 4030
Wire Wire Line
	6335 4030 6210 4030
Wire Wire Line
	6210 2430 6210 4030
Wire Wire Line
	5720 2430 6210 2430
Wire Wire Line
	7560 3555 6660 3555
$Comp
L power_GOST:COMMON_ PWR9
U 1 1 60404197
P 6160 1850
F 0 "PWR9" H 6220 1740 50  0001 C CNN
F 1 "COMMON_" H 6355 1885 50  0001 C CNN
F 2 "" H 6160 1780 50  0001 C CNN
F 3 "" H 6160 1780 50  0001 C CNN
	1    6160 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_Small R12
U 1 1 6040419D
P 6445 1680
F 0 "R12" H 6630 1770 50  0000 R CNN
F 1 "10K" H 6585 1630 31  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6375 1680 50  0001 C CNN
F 3 "~" H 6445 1680 50  0001 C CNN
	1    6445 1680
	1    0    0    -1  
$EndComp
Wire Wire Line
	6660 1680 6660 3555
$Comp
L Device:C_Small C1
U 1 1 604041A4
P 6160 1665
F 0 "C1" H 6175 1740 50  0000 L CNN
F 1 "0,1mF" H 6180 1605 31  0000 L CNN
F 2 "" H 6160 1665 50  0001 C CNN
F 3 "~" H 6160 1665 50  0001 C CNN
	1    6160 1665
	1    0    0    -1  
$EndComp
$Comp
L Interface_Expansion:PCF8574 U3
U 1 1 604041AA
P 5220 2330
F 0 "U3" V 5174 3074 50  0000 L CNN
F 1 "PCF8574" V 5265 3074 50  0000 L CNN
F 2 "" H 5220 2330 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 5220 2330 50  0001 C CNN
	1    5220 2330
	1    0    0    1   
$EndComp
NoConn ~ 4720 1930
Wire Wire Line
	4720 2330 4410 2330
Wire Wire Line
	4510 2055 4510 2430
Wire Wire Line
	4510 2430 4720 2430
Wire Wire Line
	4720 2230 4310 2230
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 604041B5
P 4410 2950
F 0 "JP2" V 4505 2940 31  0000 R CNN
F 1 "~" V 4365 2902 50  0000 R CNN
F 2 "" H 4410 2950 50  0001 C CNN
F 3 "~" H 4410 2950 50  0001 C CNN
	1    4410 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4410 2055 4410 2330
Connection ~ 4510 2430
Connection ~ 4310 2230
Wire Wire Line
	4310 2230 4310 2850
Wire Wire Line
	4510 2430 4510 2850
Wire Wire Line
	4410 2850 4410 2330
Connection ~ 4410 2330
Wire Wire Line
	4510 3050 4510 3070
Wire Wire Line
	4510 3070 4310 3070
Wire Wire Line
	4310 3070 4310 3050
Wire Wire Line
	4410 3050 4410 3095
Wire Wire Line
	6755 1830 6755 1775
Wire Wire Line
	6545 1680 6660 1680
Wire Wire Line
	6445 1580 6445 1340
Wire Wire Line
	6445 1340 6755 1340
Wire Wire Line
	6335 1340 6445 1340
Connection ~ 6445 1340
Wire Wire Line
	6335 1340 6335 3430
Wire Wire Line
	6445 1780 6445 1830
Wire Wire Line
	6755 1340 6755 1375
Connection ~ 6755 1830
Wire Wire Line
	6755 1830 7160 1830
Connection ~ 6335 1340
Wire Wire Line
	7560 2530 7760 2530
Wire Wire Line
	6785 3805 7760 3805
Wire Wire Line
	7760 3805 7760 2530
Wire Wire Line
	6405 3680 6335 3680
Wire Wire Line
	7660 3680 6605 3680
Wire Wire Line
	7660 2630 7660 3680
$Comp
L Device:Jumper_NC_Small JP4
U 1 1 604041D8
P 6505 3680
F 0 "JP4" H 6595 3735 31  0000 C CNN
F 1 "~" H 6615 3650 50  0000 C CNN
F 2 "" H 6505 3680 50  0001 C CNN
F 3 "~" H 6505 3680 50  0001 C CNN
	1    6505 3680
	1    0    0    -1  
$EndComp
Wire Wire Line
	6445 1290 6445 1340
$Comp
L power_GOST:+5V #PWR0101
U 1 1 604041DF
P 6445 1290
F 0 "#PWR0101" H 6445 1190 79  0001 C CNN
F 1 "+5V" H 6525 1455 50  0000 C CNN
F 2 "" V 6445 1415 98  0000 C CNN
F 3 "" H 6445 1415 98  0001 C CNN
	1    6445 1290
	1    0    0    -1  
$EndComp
Wire Wire Line
	6445 1340 6445 1345
Wire Wire Line
	4310 1340 4310 1655
Wire Wire Line
	4310 1340 6160 1340
Wire Wire Line
	6160 1340 6160 1565
Connection ~ 6160 1340
Wire Wire Line
	6160 1340 6335 1340
$Comp
L Device:R_Small R13
U 1 1 604041EB
P 6755 1475
F 0 "R13" H 6685 1429 50  0000 R CNN
F 1 "4,7K" H 6685 1520 31  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 6685 1475 50  0001 C CNN
F 3 "~" H 6755 1475 50  0001 C CNN
	1    6755 1475
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:S8050 Q1
U 1 1 604041F1
P 6685 4030
F 0 "Q1" H 6885 4155 50  0000 L CNN
F 1 "S8050" H 6885 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6885 3955 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 6685 4030 50  0001 L CNN
	1    6685 4030
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 604041F7
P 6755 1675
F 0 "D1" V 6801 1605 50  0000 R CNN
F 1 "LED_Red" V 6710 1605 50  0000 R CNN
F 2 "" V 6755 1675 50  0001 C CNN
F 3 "~" V 6755 1675 50  0001 C CNN
	1    6755 1675
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6340 3430 6335 3430
Wire Wire Line
	5220 3430 5220 3030
Wire Wire Line
	6335 3430 5220 3430
Wire Wire Line
	5220 1630 5725 1630
Wire Wire Line
	5725 1630 5725 1830
Wire Wire Line
	6160 1765 6160 1830
Wire Wire Line
	5725 1830 6160 1830
Wire Wire Line
	6445 1830 6755 1830
Connection ~ 6445 1830
Wire Wire Line
	6160 1850 6160 1830
Connection ~ 6160 1830
Wire Wire Line
	6160 1830 6445 1830
Connection ~ 4310 1340
Wire Wire Line
	3935 2730 3935 1980
Wire Wire Line
	4135 1980 4135 2630
$Comp
L Device:R_Small R9
U 1 1 6040420E
P 3935 1880
F 0 "R9" H 3935 1785 39  0000 R CNN
F 1 "4,7K" H 3935 1980 31  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 3865 1880 50  0001 C CNN
F 3 "~" H 3935 1880 50  0001 C CNN
	1    3935 1880
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R10
U 1 1 60404214
P 4135 1880
F 0 "R10" H 4255 1980 39  0000 R CNN
F 1 "4,7K" H 4245 1785 31  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P15.24mm_Horizontal" V 4065 1880 50  0001 C CNN
F 3 "~" H 4135 1880 50  0001 C CNN
	1    4135 1880
	1    0    0    -1  
$EndComp
Connection ~ 4135 2630
Wire Wire Line
	4135 1780 4135 1730
Wire Wire Line
	4135 1730 4035 1730
Wire Wire Line
	3935 1730 3935 1780
Wire Wire Line
	4035 1730 4035 1340
Wire Wire Line
	4035 1340 4310 1340
Connection ~ 4035 1730
Wire Wire Line
	4035 1730 3935 1730
Wire Wire Line
	4135 2630 4720 2630
Wire Wire Line
	3935 2730 4720 2730
Connection ~ 3935 2730
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6040422B
P 3345 2530
F 0 "J3" H 3305 2830 50  0000 C CNN
F 1 "Conn_01x04" H 3195 2760 50  0000 C CNN
F 2 "" H 3345 2530 50  0001 C CNN
F 3 "~" H 3345 2530 50  0001 C CNN
	1    3345 2530
	-1   0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 60404231
P 4510 2950
F 0 "JP3" V 4605 2940 31  0000 R CNN
F 1 "~" V 4465 2902 50  0000 R CNN
F 2 "" H 4510 2950 50  0001 C CNN
F 3 "~" H 4510 2950 50  0001 C CNN
	1    4510 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 60404237
P 4310 2950
F 0 "JP1" V 4405 2945 31  0000 R CNN
F 1 "~" V 4265 2902 50  0000 R CNN
F 2 "" H 4310 2950 50  0001 C CNN
F 3 "~" H 4310 2950 50  0001 C CNN
	1    4310 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3545 2730 3935 2730
Text HLabel 3290 2630 0    50   Input ~ 0
SDA
Text HLabel 3290 2530 0    50   Input ~ 0
VCC
Text HLabel 3290 2430 0    50   Input ~ 0
GND
Text HLabel 3290 2730 0    50   Input ~ 0
SCL
Wire Wire Line
	3545 2630 4135 2630
Wire Wire Line
	3290 2530 3545 2530
Wire Wire Line
	3545 2430 3290 2430
Wire Wire Line
	3290 2630 3545 2630
Connection ~ 3545 2630
Wire Wire Line
	3285 2730 3545 2730
Connection ~ 3545 2730
$EndSCHEMATC