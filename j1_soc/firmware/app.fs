: send_inc_addres \ ( data add -- addr +1 )
  swap  over  ! 1+
;


: multiplier	\ implementado con manejo del stack
d# 0 d# 12 d# 7
begin  
dup d# 1 and 0= invert  if swap rot swap dup rot + swap rot then 
d# 1 rshift swap d# 1 lshift swap
dup 0= until 2drop emit-uart 
;

variable now
variable ant
: fibonacci
d# 1 now ! d# 0 ant !  
d# 4 d# 0
do
  now dup @ emit-uart drop
  now dup @ swap drop ant dup @ swap drop +
  now dup @ ant ! drop
  now !  
loop
;

: multiplicar		 \ utiliza peripheral_mult.v
multi_a !
multi_b !
d# 1 multi_init !
d# 0 multi_init !
begin multi_done @ d# 1 = until \ espera hasta que la señal done del multiplicador este en 1
multi_pp_high @
multi_pp_low @
;

: dividir		 \ utiliza peripheral_div.v
swap div_a !
div_b !
d# 1 div_init !
d# 1 div_init !
begin div_done @ d# 1 = until \ espera hasta que la señal done del divisor este en 1
div_c @
;

: usar_dpRAM \ envia los 6 primeros terminos de la serie de Fibonnacci a la dpRAM, el periferico invierte su orden, luego son leidos de vuelta

d# 1 h# 7000 !  \ escribe 1 en el registro h# 7000
d# 2 h# 7002 !  \ escribe 2 en el registro h# 7002
d# 3 h# 7004 !  \ escribe 3 en el registro h# 7004
d# 5 h# 7006 !  \ escribe 4 en el registro h# 7006
d# 8 h# 7008 !  \ escribe 8 en el registro h# 7008
d# 13 h# 700A !  \ escribe 13 en el registro h# 700A

begin h# 7008 @ d# 2 = until \ espera hasta que el registro 7008 sea 2, o sea hasta que el periferico reorganize la secuencia

h# 7000 @ \ lee lo que hay en el registro h# 7000, queda almacenado en la pila
h# 7002 @ \ lee lo que hay en el registro h# 7002, queda almacenado en la pila
h# 7004 @ \ lee lo que hay en el registro h# 7004, queda almacenado en la pila
h# 7006 @ \ lee lo que hay en el registro h# 7006, queda almacenado en la pila
h# 7008 @ \ lee lo que hay en el registro h# 7008, queda almacenado en la pila
h# 700A @ \ lee lo que hay en el registro h# 700A, queda almacenado en la pila
;



: main
(
J1 FORTH Processor                                                                                                
Multiplicando:9                                                                                                   
Multiplicador:9 
)
cr
s" J1 FORTH Processor" type-uart
cr
s" Multiplicando:" type-uart
receive-uart   \ Multiplicando en la Pila
dup
emit-uart
cr
s" Multiplicador:" type-uart
receive-uart   \ Multiplicando en la Pila
dup
emit-uart
cr
asc_to_dec
swap
asc_to_dec
multiplicar   \ N Hi PP, T Low PP 
cr
s" Resultado = " type-uart
swap
hex2
hex2
cr


\ d# 9 d# 3 dividir
\ d# 30 d# 3 dividir


\ usar_dpRAM

\ LED
\ d# 4 uart_ctrl !
\ d# 4 uart_ctrl !
\ d# 4 uart_ctrl !
\ d# 0 uart_ctrl !
\ d# 4 uart_ctrl !


\ multiplier
\ fibonacci 

\ s" A " type-uart   \ Almacena el string y la longitud en la pila en el top
\  h# AA h# A000 !       \ ! envía el dato en N  a la dirección T
\  h# BB h# A001 !
\  h# CC h# A002 !
\  h# 30 h# f000 h# 31 h# f001 ! ! 

\ Para enviar varios datos a posiciones de memoria contiguas se utiliza este código
\ Se almacenan los datos a enviar en la pila 30h - 37h, después la primera dirección de memoria en este caso A000h y por último el múmero de datos a enviar 8
\ en este caso. Al ejecutar este segmento de código se escribirán los siguientes datos en las siguientes direcciones:
\ 30h a000; 31h a001; 32h a002; 33h a003; 34h a004; 35h a005; 36h a006; 37h a007;

\  h# 37 h# 36 h# 35 h# 34 h# 33 h# 32 h# 31 h# 30  h# a000  d# 8
\  d# 0 
\  do 
\   send_inc_addres 
\  loop

\ ( lo que debe estar en el stack antes de ejecutar la función -- como queda el stack después de ejecutar la función  )
\ /MOD	 ( n1 n2 -- rem quot )	 Divides. Returns the remainder and quotient.	
\ MOD	 ( n1 n2 -- rem )	 Returns the remainder from division.
\ SWAP is defined to switch the order of the top two stack items.
\ SWAP	 ( n1 n2 -- n2 n1 )	 Reverses the top two stack items.	
\ DUP	 ( n -- n n )	 Duplicates the top stack item.	
\ OVER	 ( n1 n2 -- n2 n1 n2 )	 Makes a copy of the second item and pushes it on top.	
\ ROT	 ( n1 n2 n3 -- n2 n3 n1 )	 Rotates the third item to the top.	
\ DROP	 ( n -- )	 Discards the top stack item.	
\ : PENTAJUMPS  50 0 DO  I .  5 +LOOP ;
;
