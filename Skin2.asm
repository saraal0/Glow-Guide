.data
welcome: .asciiz " Welcome to Glow Guide \n "
name: .asciiz "Please enter your name: "
checkname: .asciiz "\nIs your name correct?\n1. Yes\n2. Re-enter name\n enter your answer (1 to 2):"
nameerror: .asciiz "\nPLEASE ENTER 1 OR 2 ONLY.\n"

username: .space 20
beginning: .asciiz" answer a few questions to discover the best routine for your skin.\n"

question1: .asciiz "QUESTION 1\n How does your skin feel one hour after washing your face without any roducts?\n1. Oily and shiny\n2. Tight and dry\n3. Normal and comfortable\n4. Oily in some areas only\n"

question2: .asciiz "QUESTION 2\n Which area gets oily the fastest?\n1. My whole face\n2. Only the T zoon
(forehead and nose)\n3. My skin barely gets oily\n4. It depends on the weather\n"

question3: .asciiz "QUESTION 3\n How does your skin react to moisturizer?\n1. It absorbs it quickly and still feels dry\n2. It makes my face feel greasy\n3. It feels balanced and fine\n4. Some areas feel fine 
others dont\n"

question4: .asciiz "QUESTION 4\n Are your pores visible?\n1. Yes, especially around my nose and cheeks\n2. No they are very small\n3. Only in certain areas\n4. Barely noticeable\n"

question5: .asciiz " QUESTION 5\n What is your biggest skin concern?\n1. Acne and excess oil\n2. Dryness and flaking\n3. My skin feels balanced most of the time\n4. Both dryness and oiliness\n"

answer: .asciiz"\n enter your answer (1 to 4):"
resultmsg: .asciiz"==== GLOW GUIDE ====\n   YOUR SKIN TYPE\n========================\n"
design1: .asciiz"  >> "
design2: .asciiz" <<"
RoutineTime: .asciiz" \nChoose your routine: \n1. Morning\n2. Night\n enter your answer (1 to 2):"

oily: .asciiz" OILY SKIN "

dry: .asciiz" DRY SKIN "

combination: .asciiz" COMBINATION SKIN"

normal: .asciiz" NORMAL SKIN "

morningDrymsg: .asciiz"DRY SKIN ROUTINE\n\n* Hydrating Cleanser\n* Hyaluronic Acid Serum\n* Thick Moisturizer\n* Hydrating Sunscreen SPF 50\n\nSTEPS:\n1. Wash with a hydrating cleanser\n2. Apply hyaluronic acid on damp skin\n3. Use a rich moisturizer\n4. Finish with sunscreen\n"

morningOilymsg: .asciiz"OILY SKIN ROUTINE\n\n* Gentle Cleanser\n* Niacinamide Serum\n* Lightweight Moisturizer\n* Oil-Free Sunscreen SPF 50\n\nSTEPS:\n1. Cleanse your face\n2. Apply niacinamide serum\n3. Use a lightweight moisturizer\n4. Finish with sunscreen\n"

morningCombinationmsg: .asciiz"COMBINATION SKIN ROUTINE\n\n* Gentle Cleanser\n* Balancing Serum\n* Lightweight Moisturizer\n* Sunscreen SPF 50\n\nSTEPS:\n1. Cleanse your face gently\n2. Apply balancing serum\n3. Moisturize evenly\n4. Use sunscreen\n"

morningNormalmsg: .asciiz"NORMAL SKIN ROUTINE\n\n* Gentle Cleanser\n* Vitamin C Serum\n* Moisturizer\n* Sunscreen SPF 50\n\nSTEPS:\n1. Cleanse your face\n2. Apply vitamin C serum\n3. Moisturize your skin\n4. Finish with sunscreen\n"

nightDrymsg: .asciiz"DRY SKIN NIGHT ROUTINE\n\n* Hydrating Cleanser\n* Hyaluronic Acid Serum\n* Thick Moisturizer\n\nSTEPS:\n1. Wash with a hydrating cleanser\n2. Apply hydrating serum\n3. Use a rich moisturizer\n"

nightOilymsg: .asciiz"OILY SKIN NIGHT ROUTINE\n\n* Gentle Cleanser\n* Niacinamide or Salicylic Acid Serum\n* Lightweight Moisturizer\n\nSTEPS:\n1. Cleanse your face\n2. Apply serum\n3. Use a lightweight moisturizer\n"

nightCombinationmsg: .asciiz"COMBINATION SKIN NIGHT ROUTINE\n\n* Gentle Cleanser\n* Balancing Serum\n* Lightweight Moisturizer\n\nSTEPS:\n1. Cleanse your face\n2. Apply serum evenly\n3. Moisturize your skin\n"

nightNormalmsg: .asciiz"NORMAL SKIN NIGHT ROUTINE\n\n* Gentle Cleanser\n* Vitamin C or Hydrating Serum\n* Moisturizer\n\nSTEPS:\n1. Cleanse your face\n2. Apply serum\n3. Finish with moisturizer\n"

erorrmsg: .asciiz"\n PLEASE ENTER A NUMBER BETWEEN 1 AND 4.\n"
erorrmsg3: .asciiz"\n PLEASE ENTER A NUMBER BETWEEN 1 AND 2.\n"
Againmsg: .asciiz "\nWOULD YOU LIKE TO USE GLOW GUIDE AGAIN?\n1. YES\n2. NO\n"
answerAgainmsg: .asciiz "\nENTER YOUR CHOICE (1-2): "
thanksMsg1: .asciiz "\n\n THANK YOU FOR USING GLOW GUIDE,"
thanksMsg2: .asciiz "!\n WE HOPE YOU ENJOY YOUR SKINCARE ROUTINE.\n   STAY GLOWING!! \n"

.text
.globl main
main:

li $v0,4
la $a0,welcome
syscall

ENTER_NAME:

li $v0,4
la $a0,name
syscall

li $v0,8
la $a0,username
li $a1,20
syscall

la $t0,username

loop_username:
lb $t1,0($t0)
beq $t1,10,remove
addi $t0,$t0,1
j loop_username

remove:
sb $zero,0($t0)

CHECK_NAME:
li $v0,4
la $a0,username
syscall

li $v0,4
la $a0,checkname
syscall

li $v0,5
syscall
move $t8,$v0

beq $t8,1,START_PROGRAM
beq $t8,2,ENTER_NAME

blt $t8,1,NAME_ERROR
bgt $t8,2,NAME_ERROR

NAME_ERROR:
li $v0,4
la $a0,nameerror
syscall
j CHECK_NAME

START_PROGRAM:

li $v0,4
la $a0,beginning
syscall

li $s0,0
li $s1,0
li $s2,0
li $s3,0
li $s4,0

Q1:
li $v0,4
la $a0,question1
syscall

li $v0,4
la $a0,answer
syscall

li $v0,5
syscall
move $t3,$v0

beq $t3,1,oilyskinQ1
beq $t3,2,dryskinQ1
beq $t3,3,normalskinQ1
beq $t3,4,combinationskinQ1

blt $t3,1,erorr
bgt $t3,4,erorr

erorr:
li $v0,4
la $a0,erorrmsg
syscall
j Q1

oilyskinQ1:
addi $s1,$s1,1
j Q2

dryskinQ1:
addi $s0,$s0,1
j Q2

normalskinQ1:
addi $s3,$s3,1
j Q2

combinationskinQ1:
addi $s2,$s2,1
j Q2

Q2:
li $v0,4
la $a0,question2
syscall

li $v0,4
la $a0,answer
syscall

li $v0,5
syscall
move $t3,$v0

beq $t3,1,oilyskinQ2
beq $t3,2,combinationskinQ2
beq $t3,3,dryskinQ2
beq $t3,4,normalskinQ2

blt $t3,1,erorr1
bgt $t3,4,erorr1

erorr1:
li $v0,4
la $a0,erorrmsg
syscall
j Q2

oilyskinQ2:
addi $s1,$s1,1
j Q3

dryskinQ2:
addi $s0,$s0,1
j Q3

normalskinQ2:
addi $s3,$s3,1
j Q3

combinationskinQ2:
addi $s2,$s2,1
j Q3

Q3:
li $v0,4
la $a0,question3
syscall

li $v0,4
la $a0,answer
syscall

li $v0,5
syscall
move $t3,$v0

beq $t3,1,dryskinQ3
beq $t3,2,oilyskinQ3
beq $t3,3,normalskinQ3
beq $t3,4,combinationskinQ3

blt $t3,1,erorr2
bgt $t3,4,erorr2

erorr2:
li $v0,4
la $a0,erorrmsg
syscall
j Q3

oilyskinQ3:
addi $s1,$s1,1
j Q4

dryskinQ3:
addi $s0,$s0,1
j Q4

normalskinQ3:
addi $s3,$s3,1
j Q4

combinationskinQ3:
addi $s2,$s2,1
j Q4

Q4:
li $v0,4
la $a0,question4
syscall

li $v0,4
la $a0,answer
syscall

li $v0,5
syscall
move $t3,$v0

beq $t3,2,dryskinQ4
beq $t3,1,oilyskinQ4
beq $t3,4,normalskinQ4
beq $t3,3,combinationskinQ4

blt $t3,1,erorr3
bgt $t3,4,erorr3

erorr3:
li $v0,4
la $a0,erorrmsg
syscall
j Q4

oilyskinQ4:
addi $s1,$s1,1
j Q5

dryskinQ4:
addi $s0,$s0,1
j Q5

normalskinQ4:
addi $s3,$s3,1
j Q5

combinationskinQ4:
addi $s2,$s2,1
j Q5

Q5:
li $v0,4
la $a0,question5
syscall

li $v0,4
la $a0,answer
syscall

li $v0,5
syscall
move $t3,$v0

beq $t3,2,dryskinQ5
beq $t3,1,oilyskinQ5
beq $t3,3,normalskinQ5
beq $t3,4,combinationskinQ5

blt $t3,1,erorr4
bgt $t3,4,erorr4

erorr4:
li $v0,4
la $a0,erorrmsg
syscall
j Q5

oilyskinQ5:
addi $s1,$s1,1
j result

dryskinQ5:
addi $s0,$s0,1
j result

normalskinQ5:
addi $s3,$s3,1
j result

combinationskinQ5:
addi $s2,$s2,1
j result

result:
li $v0,4
la $a0,resultmsg
syscall

Routine:
move $t0,$s0
la $t1,dry
li $s5,1

bgt $s1,$t0,setoily
j checkcombination

setoily:
move $t0,$s1
la $t1,oily
li $s5,2

checkcombination:
bgt $s2,$t0,setcombination
j checknormal

setcombination:
move $s2,$t0
la $t1,combination
li $s5,3

checknormal:
bgt $s3,$t0,setnormal
j printtypeskin

setnormal:
move $s3,$t0
la $t1,normal
li $s5,4

printtypeskin:
li $v0,4
la $a0,design1
syscall

li $v0,4
move $a0,$t1
syscall

li $v0,4
la $a0,design2
syscall

j ROUTINE_TIME

ROUTINE_TIME:
li $v0,4
la $a0,RoutineTime
syscall

li $v0,5
syscall
move $t5,$v0

beq $t5,1,MorningRoutine
beq $t5,2,NightRoutine

blt $t5,1,erorr5
bgt $t5,2,erorr5

erorr5:
li $v0,4
la $a0,erorrmsg3
syscall
j ROUTINE_TIME

MorningRoutine:
beq $s5,1,morningDry
beq $s5,2,morningOily
beq $s5,3,morningCombination
beq $s5,4,morningNormal

morningDry:
li $v0,4
la $a0,morningDrymsg
syscall
j AGAIN

morningOily:
li $v0,4
la $a0,morningOilymsg
syscall
j AGAIN

morningCombination:
li $v0,4
la $a0,morningCombinationmsg
syscall
j AGAIN

morningNormal:
li $v0,4
la $a0,morningNormalmsg
syscall
j AGAIN

NightRoutine:
beq $s5,1,nightDry
beq $s5,2,nightOily
beq $s5,3,nightCombination
beq $s5,4,nightNormal

nightDry:
li $v0,4
la $a0,nightDrymsg
syscall
j AGAIN

nightOily:
li $v0,4
la $a0,nightOilymsg
syscall
j AGAIN

nightCombination:
li $v0,4
la $a0,nightCombinationmsg
syscall
j AGAIN

nightNormal:
li $v0,4
la $a0,nightNormalmsg

syscall
j AGAIN

AGAIN:
li $v0,4
la $a0,Againmsg
syscall

li $v0,4
la $a0,answerAgainmsg
syscall

li $v0,5
syscall
move $t7,$v0

beq $t7,1,restart
beq $t7,2,thanksmsg

blt $t7,1,erorr6
bgt $t7,2,erorr6

erorr6:
li $v0,4
la $a0,erorrmsg3
syscall
j AGAIN

restart:
li $s0,0
li $s1,0
li $s2,0
li $s3,0
li $s4,0
j Q1

thanksmsg:
li $v0,4
la $a0,thanksMsg1
syscall

li $v0,4
la $a0,username
syscall

li $v0,4
la $a0,thanksMsg2
syscall

end:
li $v0,10
syscall