00000000 <__vectors>:
   0:   0c 94 34 00     jmp     0x68    ; 0x68 <__ctors_end>
   4:   0c 94 e7 00     jmp     0x1ce   ; 0x1ce <__vector_1>
   8:   0c 94 c0 00     jmp     0x180   ; 0x180 <__vector_2>
   c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  10:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  14:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  18:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  1c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  20:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  24:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  28:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  2c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  30:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  34:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  38:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  3c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  40:   0c 94 76 00     jmp     0xec    ; 0xec <__vector_16>
  44:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  48:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  4c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  50:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  54:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  58:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  5c:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  60:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>
  64:   0c 94 51 00     jmp     0xa2    ; 0xa2 <__bad_interrupt>

00000068 <__ctors_end>:
  68:   11 24           eor     r1, r1
  6a:   1f be           out     0x3f, r1        ; 63
  6c:   cf ef           ldi     r28, 0xFF       ; 255
  6e:   d8 e0           ldi     r29, 0x08       ; 8
  70:   de bf           out     0x3e, r29       ; 62
  72:   cd bf           out     0x3d, r28       ; 61

00000074 <__do_copy_data>:
  74:   11 e0           ldi     r17, 0x01       ; 1
  76:   a0 e0           ldi     r26, 0x00       ; 0
  78:   b1 e0           ldi     r27, 0x01       ; 1
  7a:   e8 ed           ldi     r30, 0xD8       ; 216
  7c:   f2 e0           ldi     r31, 0x02       ; 2
  7e:   02 c0           rjmp    .+4             ; 0x84 <__do_copy_data+0x10>
  80:   05 90           lpm     r0, Z+
  82:   0d 92           st      X+, r0
  84:   a4 30           cpi     r26, 0x04       ; 4
  86:   b1 07           cpc     r27, r17
  88:   d9 f7           brne    .-10            ; 0x80 <__do_copy_data+0xc>

0000008a <__do_clear_bss>:
  8a:   21 e0           ldi     r18, 0x01       ; 1
  8c:   a4 e0           ldi     r26, 0x04       ; 4
  8e:   b1 e0           ldi     r27, 0x01       ; 1
  90:   01 c0           rjmp    .+2             ; 0x94 <.do_clear_bss_start>

00000092 <.do_clear_bss_loop>:
  92:   1d 92           st      X+, r1

00000094 <.do_clear_bss_start>:
  94:   a1 31           cpi     r26, 0x11       ; 17
  96:   b2 07           cpc     r27, r18
  98:   e1 f7           brne    .-8             ; 0x92 <.do_clear_bss_loop>
  9a:   0e 94 0e 01     call    0x21c   ; 0x21c <main>
  9e:   0c 94 6a 01     jmp     0x2d4   ; 0x2d4 <_exit>

000000a2 <__bad_interrupt>:
  a2:   0c 94 00 00     jmp     0       ; 0x0 <__vectors>

000000a6 <nothing>:
#include <avr/pgmspace.h>
#include <stdio.h>

#include "wiring_private.h"

static void nothing(void) {
  a6:   08 95           ret

000000a8 <_Z22handleEncoderInterruptv>:
}


void handleEncoderInterrupt(){
  // Leggi lo stato corrente dei segnali A e B
  PIND & (1 << encoderPinB) ? encoderPosition +=1 : encoderPosition -=1;
  a8:   4a 9b           sbis    0x09, 2 ; 9
  aa:   0c c0           rjmp    .+24            ; 0xc4 <_Z22handleEncoderInterruptv+0x1c>
  ac:   80 91 04 01     lds     r24, 0x0104     ; 0x800104 <__data_end>
  b0:   90 91 05 01     lds     r25, 0x0105     ; 0x800105 <__data_end+0x1>
  b4:   a0 91 06 01     lds     r26, 0x0106     ; 0x800106 <__data_end+0x2>
  b8:   b0 91 07 01     lds     r27, 0x0107     ; 0x800107 <__data_end+0x3>
  bc:   01 96           adiw    r24, 0x01       ; 1
  be:   a1 1d           adc     r26, r1
  c0:   b1 1d           adc     r27, r1
  c2:   0b c0           rjmp    .+22            ; 0xda <_Z22handleEncoderInterruptv+0x32>
  c4:   80 91 04 01     lds     r24, 0x0104     ; 0x800104 <__data_end>
  c8:   90 91 05 01     lds     r25, 0x0105     ; 0x800105 <__data_end+0x1>
  cc:   a0 91 06 01     lds     r26, 0x0106     ; 0x800106 <__data_end+0x2>
  d0:   b0 91 07 01     lds     r27, 0x0107     ; 0x800107 <__data_end+0x3>
  d4:   01 97           sbiw    r24, 0x01       ; 1
  d6:   a1 09           sbc     r26, r1
  d8:   b1 09           sbc     r27, r1
  da:   80 93 04 01     sts     0x0104, r24     ; 0x800104 <__data_end>
  de:   90 93 05 01     sts     0x0105, r25     ; 0x800105 <__data_end+0x1>
  e2:   a0 93 06 01     sts     0x0106, r26     ; 0x800106 <__data_end+0x2>
  e6:   b0 93 07 01     sts     0x0107, r27     ; 0x800107 <__data_end+0x3>
  ea:   08 95           ret

000000ec <__vector_16>:
#if defined(TIM0_OVF_vect)
ISR(TIM0_OVF_vect)
#else
ISR(TIMER0_OVF_vect)
#endif
{
  ec:   1f 92           push    r1
  ee:   0f 92           push    r0
  f0:   0f b6           in      r0, 0x3f        ; 63
  f2:   0f 92           push    r0
  f4:   11 24           eor     r1, r1
  f6:   2f 93           push    r18
  f8:   3f 93           push    r19
  fa:   8f 93           push    r24
  fc:   9f 93           push    r25
  fe:   af 93           push    r26
 100:   bf 93           push    r27
        // copy these to local variables so they can be stored in registers
        // (volatile variables must be read from memory on every access)
        unsigned long m = timer0_millis;
 102:   80 91 0d 01     lds     r24, 0x010D     ; 0x80010d <timer0_millis>
 106:   90 91 0e 01     lds     r25, 0x010E     ; 0x80010e <timer0_millis+0x1>
 10a:   a0 91 0f 01     lds     r26, 0x010F     ; 0x80010f <timer0_millis+0x2>
 10e:   b0 91 10 01     lds     r27, 0x0110     ; 0x800110 <timer0_millis+0x3>
        unsigned char f = timer0_fract;
 112:   30 91 0c 01     lds     r19, 0x010C     ; 0x80010c <timer0_fract>

        m += MILLIS_INC;
        f += FRACT_INC;
 116:   23 e0           ldi     r18, 0x03       ; 3
 118:   23 0f           add     r18, r19
        if (f >= FRACT_MAX) {
 11a:   2d 37           cpi     r18, 0x7D       ; 125
 11c:   20 f4           brcc    .+8             ; 0x126 <__vector_16+0x3a>
        // copy these to local variables so they can be stored in registers
        // (volatile variables must be read from memory on every access)
        unsigned long m = timer0_millis;
        unsigned char f = timer0_fract;

        m += MILLIS_INC;
 11e:   01 96           adiw    r24, 0x01       ; 1
 120:   a1 1d           adc     r26, r1
 122:   b1 1d           adc     r27, r1
 124:   05 c0           rjmp    .+10            ; 0x130 <__vector_16+0x44>
        f += FRACT_INC;
        if (f >= FRACT_MAX) {
                f -= FRACT_MAX;
 126:   26 e8           ldi     r18, 0x86       ; 134
 128:   23 0f           add     r18, r19
                m += 1;
 12a:   02 96           adiw    r24, 0x02       ; 2
 12c:   a1 1d           adc     r26, r1
 12e:   b1 1d           adc     r27, r1
        }

        timer0_fract = f;
 130:   20 93 0c 01     sts     0x010C, r18     ; 0x80010c <timer0_fract>
        timer0_millis = m;
 134:   80 93 0d 01     sts     0x010D, r24     ; 0x80010d <timer0_millis>
 138:   90 93 0e 01     sts     0x010E, r25     ; 0x80010e <timer0_millis+0x1>
 13c:   a0 93 0f 01     sts     0x010F, r26     ; 0x80010f <timer0_millis+0x2>
 140:   b0 93 10 01     sts     0x0110, r27     ; 0x800110 <timer0_millis+0x3>
        timer0_overflow_count++;
 144:   80 91 08 01     lds     r24, 0x0108     ; 0x800108 <timer0_overflow_count>
 148:   90 91 09 01     lds     r25, 0x0109     ; 0x800109 <timer0_overflow_count+0x1>
 14c:   a0 91 0a 01     lds     r26, 0x010A     ; 0x80010a <timer0_overflow_count+0x2>
 150:   b0 91 0b 01     lds     r27, 0x010B     ; 0x80010b <timer0_overflow_count+0x3>
 154:   01 96           adiw    r24, 0x01       ; 1
 156:   a1 1d           adc     r26, r1
 158:   b1 1d           adc     r27, r1
 15a:   80 93 08 01     sts     0x0108, r24     ; 0x800108 <timer0_overflow_count>
 15e:   90 93 09 01     sts     0x0109, r25     ; 0x800109 <timer0_overflow_count+0x1>
 162:   a0 93 0a 01     sts     0x010A, r26     ; 0x80010a <timer0_overflow_count+0x2>
 166:   b0 93 0b 01     sts     0x010B, r27     ; 0x80010b <timer0_overflow_count+0x3>
}
 16a:   bf 91           pop     r27
 16c:   af 91           pop     r26
 16e:   9f 91           pop     r25
 170:   8f 91           pop     r24
 172:   3f 91           pop     r19
 174:   2f 91           pop     r18
 176:   0f 90           pop     r0
 178:   0f be           out     0x3f, r0        ; 63
 17a:   0f 90           pop     r0
 17c:   1f 90           pop     r1
 17e:   18 95           reti

00000180 <__vector_2>:
IMPLEMENT_ISR(INT7_vect, EXTERNAL_INT_7)

#else

IMPLEMENT_ISR(INT0_vect, EXTERNAL_INT_0)
IMPLEMENT_ISR(INT1_vect, EXTERNAL_INT_1)
 180:   1f 92           push    r1
 182:   0f 92           push    r0
 184:   0f b6           in      r0, 0x3f        ; 63
 186:   0f 92           push    r0
 188:   11 24           eor     r1, r1
 18a:   2f 93           push    r18
 18c:   3f 93           push    r19
 18e:   4f 93           push    r20
 190:   5f 93           push    r21
 192:   6f 93           push    r22
 194:   7f 93           push    r23
 196:   8f 93           push    r24
 198:   9f 93           push    r25
 19a:   af 93           push    r26
 19c:   bf 93           push    r27
 19e:   ef 93           push    r30
 1a0:   ff 93           push    r31
 1a2:   e0 91 02 01     lds     r30, 0x0102     ; 0x800102 <__data_start+0x2>
 1a6:   f0 91 03 01     lds     r31, 0x0103     ; 0x800103 <__data_start+0x3>
 1aa:   09 95           icall
 1ac:   ff 91           pop     r31
 1ae:   ef 91           pop     r30
 1b0:   bf 91           pop     r27
 1b2:   af 91           pop     r26
 1b4:   9f 91           pop     r25
 1b6:   8f 91           pop     r24
 1b8:   7f 91           pop     r23
 1ba:   6f 91           pop     r22
 1bc:   5f 91           pop     r21
 1be:   4f 91           pop     r20
 1c0:   3f 91           pop     r19
 1c2:   2f 91           pop     r18
 1c4:   0f 90           pop     r0
 1c6:   0f be           out     0x3f, r0        ; 63
 1c8:   0f 90           pop     r0
 1ca:   1f 90           pop     r1
 1cc:   18 95           reti

000001ce <__vector_1>:
IMPLEMENT_ISR(INT6_vect, EXTERNAL_INT_6)
IMPLEMENT_ISR(INT7_vect, EXTERNAL_INT_7)

#else

IMPLEMENT_ISR(INT0_vect, EXTERNAL_INT_0)
 1ce:   1f 92           push    r1
 1d0:   0f 92           push    r0
 1d2:   0f b6           in      r0, 0x3f        ; 63
 1d4:   0f 92           push    r0
 1d6:   11 24           eor     r1, r1
 1d8:   2f 93           push    r18
 1da:   3f 93           push    r19
 1dc:   4f 93           push    r20
 1de:   5f 93           push    r21
 1e0:   6f 93           push    r22
 1e2:   7f 93           push    r23
 1e4:   8f 93           push    r24
 1e6:   9f 93           push    r25
 1e8:   af 93           push    r26
 1ea:   bf 93           push    r27
 1ec:   ef 93           push    r30
 1ee:   ff 93           push    r31
 1f0:   e0 91 00 01     lds     r30, 0x0100     ; 0x800100 <__data_start>
 1f4:   f0 91 01 01     lds     r31, 0x0101     ; 0x800101 <__data_start+0x1>
 1f8:   09 95           icall
 1fa:   ff 91           pop     r31
 1fc:   ef 91           pop     r30
 1fe:   bf 91           pop     r27
 200:   af 91           pop     r26
 202:   9f 91           pop     r25
 204:   8f 91           pop     r24
 206:   7f 91           pop     r23
 208:   6f 91           pop     r22
 20a:   5f 91           pop     r21
 20c:   4f 91           pop     r20
 20e:   3f 91           pop     r19
 210:   2f 91           pop     r18
 212:   0f 90           pop     r0
 214:   0f be           out     0x3f, r0        ; 63
 216:   0f 90           pop     r0
 218:   1f 90           pop     r1
 21a:   18 95           reti

0000021c <main>:

void init()
{
        // this needs to be called before setup() or some functions won't
        // work there
        sei();
 21c:   78 94           sei

        // on the ATmega168, timer 0 is also used for fast hardware pwm
        // (using phase-correct PWM would mean that timer 0 overflowed half as often
        // resulting in different millis() behavior on the ATmega8 and ATmega168)
#if defined(TCCR0A) && defined(WGM01)
        sbi(TCCR0A, WGM01);
 21e:   84 b5           in      r24, 0x24       ; 36
 220:   82 60           ori     r24, 0x02       ; 2
 222:   84 bd           out     0x24, r24       ; 36
        sbi(TCCR0A, WGM00);
 224:   84 b5           in      r24, 0x24       ; 36
 226:   81 60           ori     r24, 0x01       ; 1
 228:   84 bd           out     0x24, r24       ; 36
        // this combination is for the standard atmega8
        sbi(TCCR0, CS01);
        sbi(TCCR0, CS00);
#elif defined(TCCR0B) && defined(CS01) && defined(CS00)
        // this combination is for the standard 168/328/1280/2560
        sbi(TCCR0B, CS01);
 22a:   85 b5           in      r24, 0x25       ; 37
 22c:   82 60           ori     r24, 0x02       ; 2
 22e:   85 bd           out     0x25, r24       ; 37
        sbi(TCCR0B, CS00);
 230:   85 b5           in      r24, 0x25       ; 37
 232:   81 60           ori     r24, 0x01       ; 1
 234:   85 bd           out     0x25, r24       ; 37

        // enable timer 0 overflow interrupt
#if defined(TIMSK) && defined(TOIE0)
        sbi(TIMSK, TOIE0);
#elif defined(TIMSK0) && defined(TOIE0)
        sbi(TIMSK0, TOIE0);
 236:   80 91 6e 00     lds     r24, 0x006E     ; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
 23a:   81 60           ori     r24, 0x01       ; 1
 23c:   80 93 6e 00     sts     0x006E, r24     ; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
        // this is better for motors as it ensures an even waveform
        // note, however, that fast pwm mode can achieve a frequency of up
        // 8 MHz (with a 16 MHz clock) at 50% duty cycle

#if defined(TCCR1B) && defined(CS11) && defined(CS10)
        TCCR1B = 0;
 240:   10 92 81 00     sts     0x0081, r1      ; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>

        // set timer 1 prescale factor to 64
        sbi(TCCR1B, CS11);
 244:   80 91 81 00     lds     r24, 0x0081     ; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 248:   82 60           ori     r24, 0x02       ; 2
 24a:   80 93 81 00     sts     0x0081, r24     ; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
#if F_CPU >= 8000000L
        sbi(TCCR1B, CS10);
 24e:   80 91 81 00     lds     r24, 0x0081     ; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
 252:   81 60           ori     r24, 0x01       ; 1
 254:   80 93 81 00     sts     0x0081, r24     ; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
        sbi(TCCR1, CS10);
#endif
#endif
        // put timer 1 in 8-bit phase correct pwm mode
#if defined(TCCR1A) && defined(WGM10)
        sbi(TCCR1A, WGM10);
 258:   80 91 80 00     lds     r24, 0x0080     ; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
 25c:   81 60           ori     r24, 0x01       ; 1
 25e:   80 93 80 00     sts     0x0080, r24     ; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>

        // set timer 2 prescale factor to 64
#if defined(TCCR2) && defined(CS22)
        sbi(TCCR2, CS22);
#elif defined(TCCR2B) && defined(CS22)
        sbi(TCCR2B, CS22);
 262:   80 91 b1 00     lds     r24, 0x00B1     ; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
 266:   84 60           ori     r24, 0x04       ; 4
 268:   80 93 b1 00     sts     0x00B1, r24     ; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>

        // configure timer 2 for phase correct pwm (8-bit)
#if defined(TCCR2) && defined(WGM20)
        sbi(TCCR2, WGM20);
#elif defined(TCCR2A) && defined(WGM20)
        sbi(TCCR2A, WGM20);
 26c:   80 91 b0 00     lds     r24, 0x00B0     ; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
 270:   81 60           ori     r24, 0x01       ; 1
 272:   80 93 b0 00     sts     0x00B0, r24     ; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
#endif

#if defined(ADCSRA)
        // set a2d prescaler so we are inside the desired 50-200 KHz range.
        #if F_CPU >= 16000000 // 16 MHz / 128 = 125 KHz
                sbi(ADCSRA, ADPS2);
 276:   80 91 7a 00     lds     r24, 0x007A     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 27a:   84 60           ori     r24, 0x04       ; 4
 27c:   80 93 7a 00     sts     0x007A, r24     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
                sbi(ADCSRA, ADPS1);
 280:   80 91 7a 00     lds     r24, 0x007A     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 284:   82 60           ori     r24, 0x02       ; 2
 286:   80 93 7a 00     sts     0x007A, r24     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
                sbi(ADCSRA, ADPS0);
 28a:   80 91 7a 00     lds     r24, 0x007A     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 28e:   81 60           ori     r24, 0x01       ; 1
 290:   80 93 7a 00     sts     0x007A, r24     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
                cbi(ADCSRA, ADPS2);
                cbi(ADCSRA, ADPS1);
                sbi(ADCSRA, ADPS0);
        #endif
        // enable a2d conversions
        sbi(ADCSRA, ADEN);
 294:   80 91 7a 00     lds     r24, 0x007A     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
 298:   80 68           ori     r24, 0x80       ; 128
 29a:   80 93 7a 00     sts     0x007A, r24     ; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
        // here so they can be used as normal digital i/o; they will be
        // reconnected in Serial.begin()
#if defined(UCSRB)
        UCSRB = 0;
#elif defined(UCSR0B)
        UCSR0B = 0;
 29e:   10 92 c1 00     sts     0x00C1, r1      ; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
#define encoderPinA 3
#define encoderPinB 2
volatile long encoderPosition=0;
void setup() {
  //setup rotary encoder
  DDRD &= ~((1 << encoderPinA) | (1 << encoderPinB));
 2a2:   8a b1           in      r24, 0x0a       ; 10
 2a4:   83 7f           andi    r24, 0xF3       ; 243
 2a6:   8a b9           out     0x0a, r24       ; 10
  // Abilita i pull-up interni
  PORTD |= (1 << encoderPinA) | (1 << encoderPinB);
 2a8:   8b b1           in      r24, 0x0b       ; 11
 2aa:   8c 60           ori     r24, 0x0C       ; 12
 2ac:   8b b9           out     0x0b, r24       ; 11
};
// volatile static voidFuncPtr twiIntFunc;

void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), int mode) {
  if(interruptNum < EXTERNAL_NUM_INTERRUPTS) {
    intFunc[interruptNum] = userFunc;
 2ae:   84 e5           ldi     r24, 0x54       ; 84
 2b0:   90 e0           ldi     r25, 0x00       ; 0
 2b2:   90 93 03 01     sts     0x0103, r25     ; 0x800103 <__data_start+0x3>
 2b6:   80 93 02 01     sts     0x0102, r24     ; 0x800102 <__data_start+0x2>
    #endif
      break;

    case 1:
    #if defined(EICRA) && defined(ISC10) && defined(ISC11) && defined(EIMSK)
      EICRA = (EICRA & ~((1 << ISC10) | (1 << ISC11))) | (mode << ISC10);
 2ba:   80 91 69 00     lds     r24, 0x0069     ; 0x800069 <__TEXT_REGION_LENGTH__+0x7e0069>
 2be:   8c 60           ori     r24, 0x0C       ; 12
 2c0:   80 93 69 00     sts     0x0069, r24     ; 0x800069 <__TEXT_REGION_LENGTH__+0x7e0069>
      EIMSK |= (1 << INT1);
 2c4:   e9 9a           sbi     0x1d, 1 ; 29

        setup();

        for (;;) {
                loop();
                if (serialEventRun) serialEventRun();
 2c6:   c0 e0           ldi     r28, 0x00       ; 0
 2c8:   d0 e0           ldi     r29, 0x00       ; 0
 2ca:   20 97           sbiw    r28, 0x00       ; 0
 2cc:   f1 f3           breq    .-4             ; 0x2ca <main+0xae>
 2ce:   0e 94 00 00     call    0       ; 0x0 <__vectors>
 2d2:   fb cf           rjmp    .-10            ; 0x2ca <main+0xae>

000002d4 <_exit>:
 2d4:   f8 94           cli

000002d6 <__stop_program>:
 2d6:   ff cf           rjmp    .-2             ; 0x2d6 <__stop_program>