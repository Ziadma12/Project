
__counter1:

;ziad progect.c,8 :: 		void _counter1(signed char count1){
;ziad progect.c,9 :: 		char left=count1/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG__counter1_count1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      _counter1_left_L0+0
;ziad progect.c,10 :: 		char right=count1%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG__counter1_count1+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;ziad progect.c,11 :: 		portc.b0=0;  portc.B2=0;portc.B3=1; portc.b1=1;
	BCF        PORTC+0, 0
	BCF        PORTC+0, 2
	BSF        PORTC+0, 3
	BSF        PORTC+0, 1
;ziad progect.c,12 :: 		display=right;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;ziad progect.c,13 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__counter10:
	DECFSZ     R13+0, 1
	GOTO       L__counter10
	DECFSZ     R12+0, 1
	GOTO       L__counter10
	NOP
	NOP
;ziad progect.c,14 :: 		portc.b0=1;portc.B2=1;portc.B3=0; portc.b1=0;
	BSF        PORTC+0, 0
	BSF        PORTC+0, 2
	BCF        PORTC+0, 3
	BCF        PORTC+0, 1
;ziad progect.c,15 :: 		display=left;
	MOVF       _counter1_left_L0+0, 0
	MOVWF      PORTB+0
;ziad progect.c,16 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L__counter11:
	DECFSZ     R13+0, 1
	GOTO       L__counter11
	DECFSZ     R12+0, 1
	GOTO       L__counter11
	NOP
	NOP
;ziad progect.c,17 :: 		}
L_end__counter1:
	RETURN
; end of __counter1

_main:

;ziad progect.c,20 :: 		void main(){
;ziad progect.c,21 :: 		adcon1=0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;ziad progect.c,22 :: 		trisb=0;
	CLRF       TRISB+0
;ziad progect.c,23 :: 		display=0;
	CLRF       PORTB+0
;ziad progect.c,24 :: 		trisd=0b11000000;
	MOVLW      192
	MOVWF      TRISD+0
;ziad progect.c,25 :: 		RD6_bit=1;RD7_bit=1;
	BSF        RD6_bit+0, BitPos(RD6_bit+0)
	BSF        RD7_bit+0, BitPos(RD7_bit+0)
;ziad progect.c,26 :: 		RD0_bit=RD1_bit=RD2_bit=RD3_bit=RD4_bit=RD5_bit=0;
	BCF        RD5_bit+0, BitPos(RD5_bit+0)
	BTFSC      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L__main63
	BCF        RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L__main64
L__main63:
	BSF        RD4_bit+0, BitPos(RD4_bit+0)
L__main64:
	BTFSC      RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L__main65
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
	GOTO       L__main66
L__main65:
	BSF        RD3_bit+0, BitPos(RD3_bit+0)
L__main66:
	BTFSC      RD3_bit+0, BitPos(RD3_bit+0)
	GOTO       L__main67
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
	GOTO       L__main68
L__main67:
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
L__main68:
	BTFSC      RD2_bit+0, BitPos(RD2_bit+0)
	GOTO       L__main69
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
	GOTO       L__main70
L__main69:
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
L__main70:
	BTFSC      RD1_bit+0, BitPos(RD1_bit+0)
	GOTO       L__main71
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L__main72
L__main71:
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
L__main72:
;ziad progect.c,27 :: 		trisc=0;
	CLRF       TRISC+0
;ziad progect.c,28 :: 		portc.B0=1; portc.B1=1;portc.B2=1;portc.B3=1;
	BSF        PORTC+0, 0
	BSF        PORTC+0, 1
	BSF        PORTC+0, 2
	BSF        PORTC+0, 3
;ziad progect.c,29 :: 		porta.b4=1;
	BSF        PORTA+0, 4
;ziad progect.c,30 :: 		portc.B4=1;
	BSF        PORTC+0, 4
;ziad progect.c,31 :: 		portc.b5=1;
	BSF        PORTC+0, 5
;ziad progect.c,32 :: 		while(porta.b4==1);
L_main2:
	BTFSS      PORTA+0, 4
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;ziad progect.c,34 :: 		for(;;){
L_main4:
;ziad progect.c,35 :: 		while(portd.b6==1){
L_main7:
	BTFSS      PORTD+0, 6
	GOTO       L_main8
;ziad progect.c,36 :: 		portd=0;
	CLRF       PORTD+0
;ziad progect.c,37 :: 		for(count1=23;count1>=0;count1--){
	MOVLW      23
	MOVWF      _count1+0
L_main9:
	MOVLW      128
	XORWF      _count1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;ziad progect.c,38 :: 		redS=1;greeW=1;
	BSF        PORTD+0, 0
	BSF        PORTD+0, 5
;ziad progect.c,39 :: 		if(portd.b6==0) {
	BTFSC      PORTD+0, 6
	GOTO       L_main12
;ziad progect.c,40 :: 		redS=0;greeW=0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 5
;ziad progect.c,41 :: 		break;}
	GOTO       L_main10
L_main12:
;ziad progect.c,42 :: 		if(count1<=3){greeW=0;yellW=1;
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count1+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main13
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
;ziad progect.c,43 :: 		if(portd.b6==0){
	BTFSC      PORTD+0, 6
	GOTO       L_main14
;ziad progect.c,44 :: 		yellW=0;
	BCF        PORTD+0, 4
;ziad progect.c,45 :: 		break;}
	GOTO       L_main10
L_main14:
;ziad progect.c,46 :: 		}
L_main13:
;ziad progect.c,47 :: 		for(i=0;i<25;i++){
	CLRF       _i+0
L_main15:
	MOVLW      25
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;ziad progect.c,48 :: 		_counter1(count1);
	MOVF       _count1+0, 0
	MOVWF      FARG__counter1_count1+0
	CALL       __counter1+0
;ziad progect.c,47 :: 		for(i=0;i<25;i++){
	INCF       _i+0, 1
;ziad progect.c,50 :: 		}}
	GOTO       L_main15
L_main16:
;ziad progect.c,37 :: 		for(count1=23;count1>=0;count1--){
	DECF       _count1+0, 1
;ziad progect.c,50 :: 		}}
	GOTO       L_main9
L_main10:
;ziad progect.c,51 :: 		for(count1=15;count1>=0;count1--){
	MOVLW      15
	MOVWF      _count1+0
L_main18:
	MOVLW      128
	XORWF      _count1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main19
;ziad progect.c,52 :: 		redS=0; yellW=0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 4
;ziad progect.c,53 :: 		redW=1;greeS=1;
	BSF        PORTD+0, 3
	BSF        PORTD+0, 2
;ziad progect.c,54 :: 		if(portd.b6==0){
	BTFSC      PORTD+0, 6
	GOTO       L_main21
;ziad progect.c,55 :: 		redW=0;greeS=0;
	BCF        PORTD+0, 3
	BCF        PORTD+0, 2
;ziad progect.c,56 :: 		break;}
	GOTO       L_main19
L_main21:
;ziad progect.c,57 :: 		if(count1<=3){greeS=0;yellS=1;
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count1+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main22
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;ziad progect.c,58 :: 		if(portd.b6==0){
	BTFSC      PORTD+0, 6
	GOTO       L_main23
;ziad progect.c,59 :: 		yellS=0;
	BCF        PORTD+0, 1
;ziad progect.c,60 :: 		break;}
	GOTO       L_main19
L_main23:
;ziad progect.c,61 :: 		}
L_main22:
;ziad progect.c,62 :: 		for(i=0;i<25;i++){
	CLRF       _i+0
L_main24:
	MOVLW      25
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;ziad progect.c,63 :: 		_counter1(count1);
	MOVF       _count1+0, 0
	MOVWF      FARG__counter1_count1+0
	CALL       __counter1+0
;ziad progect.c,62 :: 		for(i=0;i<25;i++){
	INCF       _i+0, 1
;ziad progect.c,64 :: 		}}
	GOTO       L_main24
L_main25:
;ziad progect.c,51 :: 		for(count1=15;count1>=0;count1--){
	DECF       _count1+0, 1
;ziad progect.c,64 :: 		}}
	GOTO       L_main18
L_main19:
;ziad progect.c,65 :: 		}
	GOTO       L_main7
L_main8:
;ziad progect.c,66 :: 		while(portd.b6==0){
L_main27:
	BTFSC      PORTD+0, 6
	GOTO       L_main28
;ziad progect.c,67 :: 		portc=1;
	MOVLW      1
	MOVWF      PORTC+0
;ziad progect.c,68 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main29
;ziad progect.c,69 :: 		{portd=0;break;}
	CLRF       PORTD+0
	GOTO       L_main28
L_main29:
;ziad progect.c,70 :: 		while(portd.b7==1);
L_main30:
	BTFSS      PORTD+0, 7
	GOTO       L_main31
	GOTO       L_main30
L_main31:
;ziad progect.c,71 :: 		yellS=1; redW=1;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 3
;ziad progect.c,72 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main32
;ziad progect.c,73 :: 		{portd=0;break;}
	CLRF       PORTD+0
	GOTO       L_main28
L_main32:
;ziad progect.c,74 :: 		if(redS==1&&greeW==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main35
	BTFSS      PORTD+0, 5
	GOTO       L_main35
L__main60:
;ziad progect.c,75 :: 		greeW=0; yellS=0; redW=0; redS=1; yellW=1;
	BCF        PORTD+0, 5
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BSF        PORTD+0, 0
	BSF        PORTD+0, 4
;ziad progect.c,76 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main36
;ziad progect.c,77 :: 		{portd=0;break;}}
	CLRF       PORTD+0
	GOTO       L_main28
L_main36:
L_main35:
;ziad progect.c,78 :: 		if(redS==1&&yellW==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main39
	BTFSS      PORTD+0, 4
	GOTO       L_main39
L__main59:
;ziad progect.c,79 :: 		delay_ms(3000);redS=0; yellW=0; greeS=1; redW=1;
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	BCF        PORTD+0, 0
	BCF        PORTD+0, 4
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
;ziad progect.c,80 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main41
;ziad progect.c,81 :: 		{portd=0;break;}}
	CLRF       PORTD+0
	GOTO       L_main28
L_main41:
L_main39:
;ziad progect.c,82 :: 		while(portd.b7==1);
L_main42:
	BTFSS      PORTD+0, 7
	GOTO       L_main43
	GOTO       L_main42
L_main43:
;ziad progect.c,83 :: 		if(greeS==1&&redW==1){
	BTFSS      PORTD+0, 2
	GOTO       L_main46
	BTFSS      PORTD+0, 3
	GOTO       L_main46
L__main58:
;ziad progect.c,84 :: 		greeS=0; yellS=1;
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;ziad progect.c,85 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main47
;ziad progect.c,86 :: 		{portd=0;break;}}
	CLRF       PORTD+0
	GOTO       L_main28
L_main47:
L_main46:
;ziad progect.c,87 :: 		while(portd.b7==1);
L_main48:
	BTFSS      PORTD+0, 7
	GOTO       L_main49
	GOTO       L_main48
L_main49:
;ziad progect.c,88 :: 		if(yellS==1&&redW==1){delay_ms(3000);yellS=0;redW=0; redS=1; greeW=1;
	BTFSS      PORTD+0, 1
	GOTO       L_main52
	BTFSS      PORTD+0, 3
	GOTO       L_main52
L__main57:
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BSF        PORTD+0, 0
	BSF        PORTD+0, 5
;ziad progect.c,89 :: 		if(portd.b6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main54
;ziad progect.c,90 :: 		{portd=0;break;}}
	CLRF       PORTD+0
	GOTO       L_main28
L_main54:
L_main52:
;ziad progect.c,91 :: 		while(portd.b7==1);
L_main55:
	BTFSS      PORTD+0, 7
	GOTO       L_main56
	GOTO       L_main55
L_main56:
;ziad progect.c,93 :: 		}
	GOTO       L_main27
L_main28:
;ziad progect.c,95 :: 		}
	GOTO       L_main4
;ziad progect.c,96 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
