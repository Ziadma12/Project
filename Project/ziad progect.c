#define redS portd.b0
#define yellS portd.b1
#define greeS portd.b2
#define redW portd.b3
#define yellW portd.b4
#define greeW portd.b5
#define display portb
   void _counter1(signed char count1){
        char left=count1/10;
        char right=count1%10;
        portc.b0=0;  portc.B2=0;portc.B3=1; portc.b1=1;
        display=right;
        delay_ms(20);
        portc.b0=1;portc.B2=1;portc.B3=0; portc.b1=0;
        display=left;
        delay_ms(20);
}
  signed char count1;
  unsigned char i;
void main(){
     adcon1=0x06;
     trisb=0;
     display=0;
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
          redS=1;greeW=1;
          if(portd.b6==0) {
          redS=0;greeW=0;
          break;}
          if(count1<=3){greeW=0;yellW=1;
           if(portd.b6==0){
           yellW=0;
           break;}
          }
          for(i=0;i<25;i++){
          _counter1(count1);

                }}
      for(count1=15;count1>=0;count1--){
           redS=0; yellW=0;
           redW=1;greeS=1;
           if(portd.b6==0){
           redW=0;greeS=0;
           break;}
           if(count1<=3){greeS=0;yellS=1;
           if(portd.b6==0){
           yellS=0;
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
      yellS=1; redW=1;
      if(portd.b6==1)
      {portd=0;break;}
      if(redS==1&&greeW==1){
       greeW=0; yellS=0; redW=0; redS=1; yellW=1;
      if(portd.b6==1)
      {portd=0;break;}}
      if(redS==1&&yellW==1){ 
      delay_ms(3000);redS=0; yellW=0; greeS=1; redW=1;
      if(portd.b6==1)
      {portd=0;break;}}
      while(portd.b7==1);
      if(greeS==1&&redW==1){
      greeS=0; yellS=1;
      if(portd.b6==1)
      {portd=0;break;}}
      while(portd.b7==1);
      if(yellS==1&&redW==1){delay_ms(3000);yellS=0;redW=0; redS=1; greeW=1;
      if(portd.b6==1)
      {portd=0;break;}}
      while(portd.b7==1);

    }

  }
}