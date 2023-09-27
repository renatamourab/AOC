#Feito por: Renata Moura Barreto

.data
    par_msg:    .asciiz " valor(es) par(es)\n"
    impar_msg:  .asciiz " valor(es) impar(es)\n"
    positivo_msg:   .asciiz " valor(es) positivo(s)\n"
    negativo_msg:   .asciiz " valor(es) negativo(s)\n"
    variavel: .word 0
    
 
.text
.globl main
 
main:
    li $t0, 0       # par
    li $t1, 0       # impar
    li $t2, 0       # positivo
    li $t3, 0       # negativo
    li $t4, 0       # cont
 
loop:
    beq $t4, 5, end    # sair do loop
    
    # Input
    li $v0, 5
    syscall
    sw $v0, variavel
 
    lw $t5, variavel
    rem $t6, $t5, 2
    beqz $t6, Par   # par
    
    
    addi $t1, $t1, 1
    j Positivo_Negativo
    
Par:
    addi $t0, $t0, 1

Positivo_Negativo:
    bgez $t5, Positive
    
    addi $t3, $t3, 1
    j Cont
    
Positive:
    addi $t2, $t2, 1

Cont:
    addi $t4, $t4, 1
    j loop

end:
    # Imprimir resultados
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, par_msg
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, impar_msg
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, positivo_msg
    syscall
    
    li $v0, 1
    move $a0, $t3
    syscall
    
    li $v0, 4
    la $a0, negativo_msg
    syscall
    

    # Encerrar o programa
    li $v0, 10
    syscall
