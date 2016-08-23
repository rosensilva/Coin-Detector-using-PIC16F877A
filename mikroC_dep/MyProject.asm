
_main:

;MyProject.c,23 :: 		void main() {
;MyProject.c,26 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,27 :: 		rs1_sensor1 =25 ;
	MOVLW      25
	MOVWF      _rs1_sensor1+0
	MOVLW      0
	MOVWF      _rs1_sensor1+1
;MyProject.c,28 :: 		rs2_sensor1=77 ;
	MOVLW      77
	MOVWF      _rs2_sensor1+0
	MOVLW      0
	MOVWF      _rs2_sensor1+1
;MyProject.c,29 :: 		rs5_sensor1 =153;
	MOVLW      153
	MOVWF      _rs5_sensor1+0
	CLRF       _rs5_sensor1+1
;MyProject.c,30 :: 		rs10_sensor1=244;
	MOVLW      244
	MOVWF      _rs10_sensor1+0
	CLRF       _rs10_sensor1+1
;MyProject.c,32 :: 		rs1_sensor2 =51 ;
	MOVLW      51
	MOVWF      _rs1_sensor2+0
	MOVLW      0
	MOVWF      _rs1_sensor2+1
;MyProject.c,33 :: 		rs2_sensor2=204 ;
	MOVLW      204
	MOVWF      _rs2_sensor2+0
	CLRF       _rs2_sensor2+1
;MyProject.c,34 :: 		rs5_sensor2 =102;
	MOVLW      102
	MOVWF      _rs5_sensor2+0
	MOVLW      0
	MOVWF      _rs5_sensor2+1
;MyProject.c,35 :: 		rs10_sensor2=153;
	MOVLW      153
	MOVWF      _rs10_sensor2+0
	CLRF       _rs10_sensor2+1
;MyProject.c,38 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;MyProject.c,39 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;MyProject.c,41 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,42 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,43 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,44 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,46 :: 		Lcd_Init(); // Initialize LCD
	CALL       _Lcd_Init+0
;MyProject.c,47 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,50 :: 		while(1){
L_main0:
;MyProject.c,53 :: 		rs1counter=0;
	CLRF       _rs1counter+0
	CLRF       _rs1counter+1
;MyProject.c,54 :: 		rs2counter=0;
	CLRF       _rs2counter+0
	CLRF       _rs2counter+1
;MyProject.c,55 :: 		rs5counter=0;
	CLRF       _rs5counter+0
	CLRF       _rs5counter+1
;MyProject.c,56 :: 		rs10counter=0;
	CLRF       _rs10counter+0
	CLRF       _rs10counter+1
;MyProject.c,57 :: 		if(adc1<rs1_sensor1){adc1=ADC_Read(0);adc1=adc1>>2;}
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       _rs1_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc1+0
	MOVF       R0+1, 0
	MOVWF      _adc1+1
	MOVF       R0+0, 0
	MOVWF      _adc1+0
	MOVF       R0+1, 0
	MOVWF      _adc1+1
	RRF        _adc1+1, 1
	RRF        _adc1+0, 1
	BCF        _adc1+1, 7
	BTFSC      _adc1+1, 6
	BSF        _adc1+1, 7
	RRF        _adc1+1, 1
	RRF        _adc1+0, 1
	BCF        _adc1+1, 7
	BTFSC      _adc1+1, 6
	BSF        _adc1+1, 7
L_main2:
;MyProject.c,58 :: 		if(adc2<rs1_sensor2){adc2=ADC_Read(1);adc2=adc2>>2;}
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       _rs1_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc2+0
	MOVF       R0+1, 0
	MOVWF      _adc2+1
	MOVF       R0+0, 0
	MOVWF      _adc2+0
	MOVF       R0+1, 0
	MOVWF      _adc2+1
	RRF        _adc2+1, 1
	RRF        _adc2+0, 1
	BCF        _adc2+1, 7
	BTFSC      _adc2+1, 6
	BSF        _adc2+1, 7
	RRF        _adc2+1, 1
	RRF        _adc2+0, 1
	BCF        _adc2+1, 7
	BTFSC      _adc2+1, 6
	BSF        _adc2+1, 7
L_main3:
;MyProject.c,60 :: 		if(adc1>=rs1_sensor1 || adc2>=rs1_sensor2){
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVF       _rs1_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L__main35
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       _rs1_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L__main35
	GOTO       L_main6
L__main35:
;MyProject.c,61 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;MyProject.c,62 :: 		PORTD = PORTD | 128;
	BSF        PORTD+0, 7
;MyProject.c,63 :: 		}
	GOTO       L_main7
L_main6:
;MyProject.c,64 :: 		else PORTD =PORTD & (!128);
	MOVLW      0
	ANDWF      PORTD+0, 1
L_main7:
;MyProject.c,66 :: 		if(adc1>=rs10_sensor1)rs10counter++;
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs10_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVF       _rs10_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main41:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
	INCF       _rs10counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs10counter+1, 1
	GOTO       L_main9
L_main8:
;MyProject.c,67 :: 		else if(adc1>=rs5_sensor1)rs5counter++;
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs5_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVF       _rs5_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main42:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
	INCF       _rs5counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs5counter+1, 1
	GOTO       L_main11
L_main10:
;MyProject.c,68 :: 		else if(adc1>=rs2_sensor1)rs2counter++;
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs2_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVF       _rs2_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main43:
	BTFSS      STATUS+0, 0
	GOTO       L_main12
	INCF       _rs2counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs2counter+1, 1
	GOTO       L_main13
L_main12:
;MyProject.c,69 :: 		else if(adc1>=rs1_sensor1)rs1counter++;
	MOVLW      128
	XORWF      _adc1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       _rs1_sensor1+0, 0
	SUBWF      _adc1+0, 0
L__main44:
	BTFSS      STATUS+0, 0
	GOTO       L_main14
	INCF       _rs1counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs1counter+1, 1
L_main14:
L_main13:
L_main11:
L_main9:
;MyProject.c,73 :: 		if(adc2>=rs2_sensor2)rs2counter++;
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs2_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVF       _rs2_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main45:
	BTFSS      STATUS+0, 0
	GOTO       L_main15
	INCF       _rs2counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs2counter+1, 1
	GOTO       L_main16
L_main15:
;MyProject.c,74 :: 		else if(adc2>=rs10_sensor2)rs10counter++;
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs10_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       _rs10_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main46:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
	INCF       _rs10counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs10counter+1, 1
	GOTO       L_main18
L_main17:
;MyProject.c,75 :: 		else if(adc2>=rs5_sensor2)rs5counter++;
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs5_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _rs5_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main47:
	BTFSS      STATUS+0, 0
	GOTO       L_main19
	INCF       _rs5counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs5counter+1, 1
	GOTO       L_main20
L_main19:
;MyProject.c,76 :: 		else if(adc2>=rs1_sensor2)rs1counter++;
	MOVLW      128
	XORWF      _adc2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1_sensor2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _rs1_sensor2+0, 0
	SUBWF      _adc2+0, 0
L__main48:
	BTFSS      STATUS+0, 0
	GOTO       L_main21
	INCF       _rs1counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _rs1counter+1, 1
L_main21:
L_main20:
L_main18:
L_main16:
;MyProject.c,80 :: 		if(rs1counter>1){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs1counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       _rs1counter+0, 0
	SUBLW      1
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;MyProject.c,82 :: 		PORTD=1;
	MOVLW      1
	MOVWF      PORTD+0
;MyProject.c,83 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,84 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,85 :: 		adc3=0;
	CLRF       _adc3+0
	CLRF       _adc3+1
;MyProject.c,86 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;MyProject.c,87 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,88 :: 		sum=sum+1;
	INCF       _sum+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sum+1, 1
;MyProject.c,89 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,90 :: 		}
	GOTO       L_main24
L_main22:
;MyProject.c,92 :: 		else if(rs2counter>1){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs2counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       _rs2counter+0, 0
	SUBLW      1
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;MyProject.c,93 :: 		PORTD=2;
	MOVLW      2
	MOVWF      PORTD+0
;MyProject.c,94 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,95 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,96 :: 		adc3=0;
	CLRF       _adc3+0
	CLRF       _adc3+1
;MyProject.c,97 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
	NOP
;MyProject.c,98 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,99 :: 		sum=sum+2;
	MOVLW      2
	ADDWF      _sum+0, 1
	BTFSC      STATUS+0, 0
	INCF       _sum+1, 1
;MyProject.c,100 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,102 :: 		}
	GOTO       L_main27
L_main25:
;MyProject.c,104 :: 		else if(rs5counter>1){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs5counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       _rs5counter+0, 0
	SUBLW      1
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;MyProject.c,106 :: 		PORTD=4;
	MOVLW      4
	MOVWF      PORTD+0
;MyProject.c,107 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,108 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,109 :: 		adc3=0;
	CLRF       _adc3+0
	CLRF       _adc3+1
;MyProject.c,110 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;MyProject.c,111 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,112 :: 		sum=sum+5;
	MOVLW      5
	ADDWF      _sum+0, 1
	BTFSC      STATUS+0, 0
	INCF       _sum+1, 1
;MyProject.c,113 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,117 :: 		}
	GOTO       L_main30
L_main28:
;MyProject.c,119 :: 		else if(rs10counter>1){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _rs10counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _rs10counter+0, 0
	SUBLW      1
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L_main31
;MyProject.c,121 :: 		PORTD=8;
	MOVLW      8
	MOVWF      PORTD+0
;MyProject.c,122 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,123 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,124 :: 		adc3=0;
	CLRF       _adc3+0
	CLRF       _adc3+1
;MyProject.c,125 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;MyProject.c,126 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,127 :: 		sum=sum+10;
	MOVLW      10
	ADDWF      _sum+0, 1
	BTFSC      STATUS+0, 0
	INCF       _sum+1, 1
;MyProject.c,128 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,130 :: 		}
L_main31:
L_main30:
L_main27:
L_main24:
;MyProject.c,133 :: 		if(counter>150){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _counter+0, 0
	SUBLW      150
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;MyProject.c,135 :: 		adc1=0;
	CLRF       _adc1+0
	CLRF       _adc1+1
;MyProject.c,136 :: 		adc2=0;
	CLRF       _adc2+0
	CLRF       _adc2+1
;MyProject.c,137 :: 		adc3=0;
	CLRF       _adc3+0
	CLRF       _adc3+1
;MyProject.c,138 :: 		counter=0;
	CLRF       _counter+0
	CLRF       _counter+1
;MyProject.c,139 :: 		PORTD=255;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,140 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;MyProject.c,141 :: 		PORTD=0;
	CLRF       PORTD+0
;MyProject.c,143 :: 		}
L_main33:
;MyProject.c,147 :: 		a[0]=(sum%10000)/1000 + '0';
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	MOVF       _sum+0, 0
	MOVWF      R0+0
	MOVF       _sum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _a+0
;MyProject.c,148 :: 		a[1]=(sum%1000)/100 + '0';
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _sum+0, 0
	MOVWF      R0+0
	MOVF       _sum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _a+1
;MyProject.c,149 :: 		a[2]=(sum%100)/10+ '0';
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sum+0, 0
	MOVWF      R0+0
	MOVF       _sum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _a+2
;MyProject.c,150 :: 		a[3]=(sum%10)/1+ '0';
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _sum+0, 0
	MOVWF      R0+0
	MOVF       _sum+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _a+3
;MyProject.c,151 :: 		a[4]='\0';
	CLRF       _a+4
;MyProject.c,155 :: 		Lcd_Out(1,1,"Total =");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,156 :: 		Lcd_out(2,1,a);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _a+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,158 :: 		}
	GOTO       L_main0
;MyProject.c,160 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
