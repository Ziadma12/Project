#line 1 "C:/Users/Ziad/Desktop/Embeded/code/ziad progect.c"







 void _counter1(signed char count1){
 char left=count1/10;
 char right=count1%10;
 portc.b0=0; portc.B2=0;portc.B3=1; portc.b1=1;
  portb =right;
 delay_ms(20);
 portc.b0=1;portc.B2=1;portc.B3=0; portc.b1=0;
  portb =left;
 delay_ms(20);
}
 signed char count1;
 unsigned char i;
void main(){
 adcon1=0x06;
 trisb=0;
  portb =0;
 trisd=0b11000000;
 RD6_bit=1;RD7_bit=1;
 RD0_bit=RD1_bit=RD2_bit=RD3_bit=RD4_bit=RD5_bit=0;
 trisc=0;
 portc.B0=1; portc.B1=1;portc.B2=1;portc.B3=1;
 porta.b4=1;
 portc.B4=1;
 portc.b5=1;
 while(porta.b4==1);

 for(;;){
 while(portd.b6==1){
 portd=0;
 for(count1=23;count1>=0;count1--){
  portd.b0 =1; portd.b5 =1;
 if(portd.b6==0) {
  portd.b0 =0; portd.b5 =0;
 break;}
 if(count1<=3){ portd.b5 =0; portd.b4 =1;
 if(portd.b6==0){
  portd.b4 =0;
 break;}
 }
 for(i=0;i<25;i++){
 _counter1(count1);

 }}
 for(count1=15;count1>=0;count1--){
  portd.b0 =0;  portd.b4 =0;
  portd.b3 =1; portd.b2 =1;
 if(portd.b6==0){
  portd.b3 =0; portd.b2 =0;
 break;}
 if(count1<=3){ portd.b2 =0; portd.b1 =1;
 if(portd.b6==0){
  portd.b1 =0;
 break;}
 }
 for(i=0;i<25;i++){
 _counter1(count1);
 }}
 }
 while(portd.b6==0){
 portc=1;
 if(portd.b6==1)
 {portd=0;break;}
 while(portd.b7==1);
  portd.b1 =1;  portd.b3 =1;
 if(portd.b6==1)
 {portd=0;break;}
 if( portd.b0 ==1&& portd.b5 ==1){
  portd.b5 =0;  portd.b1 =0;  portd.b3 =0;  portd.b0 =1;  portd.b4 =1;
 if(portd.b6==1)
 {portd=0;break;}}
 if( portd.b0 ==1&& portd.b4 ==1){
 delay_ms(3000); portd.b0 =0;  portd.b4 =0;  portd.b2 =1;  portd.b3 =1;
 if(portd.b6==1)
 {portd=0;break;}}
 while(portd.b7==1);
 if( portd.b2 ==1&& portd.b3 ==1){
  portd.b2 =0;  portd.b1 =1;
 if(portd.b6==1)
 {portd=0;break;}}
 while(portd.b7==1);
 if( portd.b1 ==1&& portd.b3 ==1){delay_ms(3000); portd.b1 =0; portd.b3 =0;  portd.b0 =1;  portd.b5 =1;
 if(portd.b6==1)
 {portd=0;break;}}
 while(portd.b7==1);

 }

 }
}
