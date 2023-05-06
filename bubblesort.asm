# Garvit Arora - 200372
# Apurb Agarwal - 200179

.data
num: .word 20
arr: .word 5 4 2 10 6 9 0 8 25 69 14 81 80 56 62 44 23 10 18 89

.text
.globl main

main:
    la $t0, num
    lw $a0, 0($t0)
    la $a1, arr
    jal bubblesort
    add $s2, $a0, $zero
    add $s3, $zero, $zero
    print:
        slt $t1, $s3, $s2
        beq $t1, $zero, exitp
        sll $t1, $s3, 2
        add $t2, $t1, $a1
        lw $a0, 0($t2)
        li $v0, 1
        syscall
        addi $a0, $zero, 10
        li $v0, 11
        syscall
        addi $t1, $s3, 1
        add $s3, $t1, $zero
        j print
    exitp:

    li $v0, 10
    syscall
swap:
    addi $t1, $sp, -4
    add $sp, $t1, $zero
    sw $ra, 0($sp)
    add $t1, $t3, $zero
    add $t3, $t5, $zero
    add $t5, $t1, $zero
    lw $ra, 0($sp)
    addi $t1, $sp, 4
    add $sp, $t1, $zero
    jr $ra


bubblesort:
    addi $t1, $sp, -4 #
    add $sp, $t1, $zero #
    sw $ra, 0($sp)  #
    addi $s2, $a0, -1 
    add $s0, $zero, $zero
    loopone:        
        slt $t1, $s0, $s2
        beq $t1, $zero, exitone
        add $s1, $zero, $zero
        sub $t2, $s2, $s0
        looptwo:
            slt $t3, $s1, $t2
            beq $t3, $zero, exittwo
            sll $t3, $s1, 2
            add $t4, $t3, $a1
            lw $t5, 0($t4)
            lw $t3, 4($t4)
            slt $t0, $t3, $t5
            beq $t0, $zero, jump
            jal swap #
            sw $t3, 4($t4) #
            sw $t5, 0($t4) #
            jump:
            addi $t0, $s1, 1
            add $s1, $t0, $zero
            j looptwo
        exittwo:
        addi $t0, $s0, 1
        add $s0, $t0, $zero
        j loopone
    exitone:
    lw $ra, 0($sp) #
    addi $t1, $sp, 4 #
    add $sp, $t1, $zero #
    jr $ra