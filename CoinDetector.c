int rs1_sensor1,rs2_sensor1,rs5_sensor1,rs10_sensor1,rs1_sensor2,rs2_sensor2,rs5_sensor2,rs10_sensor2;
int adc1,adc2,adc3,sum,counter;
int rs1counter,rs2counter,rs5counter,rs10counter;
 char a[5];
// LCD module connections

sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;

// End LCD module connections


void main() {


counter=0;
rs1_sensor1 =25 ;
rs2_sensor1=77 ;
rs5_sensor1 =153;
rs10_sensor1=244;

rs1_sensor2 =51 ;
rs2_sensor2=204 ;
rs5_sensor2 =102;
rs10_sensor2=153;


TRISA = 0b11111111;
TRISD = 0b00000000;

ADC_Init();
adc1=0;
adc2=0;
PORTD=0;

 Lcd_Init(); // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR); // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off

while(1){


             rs1counter=0;
             rs2counter=0;
             rs5counter=0;
             rs10counter=0;
             if(adc1<rs1_sensor1){adc1=ADC_Read(0);adc1=adc1>>2;}
             if(adc2<rs1_sensor2){adc2=ADC_Read(1);adc2=adc2>>2;}

             if(adc1>=rs1_sensor1 || adc2>=rs1_sensor2){
                                  counter++;
                                  PORTD = PORTD | 128;
              }
              else PORTD =PORTD & (!128);

            if(adc1>=rs10_sensor1)rs10counter++;
            else if(adc1>=rs5_sensor1)rs5counter++;
            else if(adc1>=rs2_sensor1)rs2counter++;
            else if(adc1>=rs1_sensor1)rs1counter++;



            if(adc2>=rs2_sensor2)rs2counter++;            
            else if(adc2>=rs10_sensor2)rs10counter++;
            else if(adc2>=rs5_sensor2)rs5counter++;
            else if(adc2>=rs1_sensor2)rs1counter++;



            if(rs1counter>1){

                      PORTD=1;
                      adc1=0;
                      adc2=0;
                      adc3=0;
                      delay_ms(500);
                      PORTD=0;
                      sum=sum+1;
                      counter=0;
            }

            else if(rs2counter>1){
                      PORTD=2;
                      adc1=0;
                      adc2=0;
                      adc3=0;
                      delay_ms(500);
                      PORTD=0;
                      sum=sum+2;
                      counter=0;

            }

            else if(rs5counter>1){

                   PORTD=4;
                   adc1=0;
                   adc2=0;
                   adc3=0;
                   delay_ms(500);
                   PORTD=0;
                   sum=sum+5;
                   counter=0;



            }

            else if(rs10counter>1){

                 PORTD=8;
                 adc1=0;
                 adc2=0;
                 adc3=0;
                 delay_ms(500);
                 PORTD=0;
                 sum=sum+10;
                 counter=0;

            }


            if(counter>150){

                   adc1=0;
                   adc2=0;
                   adc3=0;
                   counter=0;
                   PORTD=255;
                   delay_ms(500);
                   PORTD=0;

            }

                   a[0]=(sum%10000)/1000 + '0';
                   a[1]=(sum%1000)/100 + '0';
                   a[2]=(sum%100)/10+ '0';
                   a[3]=(sum%10)/1+ '0';
                   a[4]='\0';


                   Lcd_Out(1,1,"Total =");
                   Lcd_out(2,1,a);

          }

}