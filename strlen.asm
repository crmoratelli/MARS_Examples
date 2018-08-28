# Exemplo de implementação e chamada de procedimentos.

.data
str: .asciiz "Hello World!"

.text
	j PROC_main	#Salta para o inicio do programa.


# Procedimento para determinar o tamanho da string.
# Entradas:
# 	a0: ponteiro para a string
# Saída:
#	v0: Número de caracteres da string.
PROC_strlen:
	addi $sp, $sp, -8  # aloca 8 bytes na pilha
	sw   $s0, 0($sp)   # salva s0 na pilha 	
	sw   $s1, 4($sp)   # salva s1 na pilha	

	move $s0, $a0      
loop:
	lb $s1, 0($s0)     # conta os caracteres da string	
	addi $s0, $s0, 1
	bgtu $s1, $zero, loop
	
	sub $v0, $s0, $a0  #Endereco do último caracter menos o endereço do primeiro caracater -1 resulta no tamanho da string.
	subi $v0, $v0, 1

	lw   $s0, 0($sp)   # restaura s0 da pilha 	
	lw   $s1, 4($sp)   # restaura s1 da pilha	
	addi $sp, $sp, 8
	jr $ra
	
# Funcao principal do programa
PROC_main:
	la $a0, str	# chama funcao PROC_strlen
	jal PROC_strlen

	move $a0, $v0	# imprime o resultado
	li $v0, 1
	syscall
	
	li $v0, 10	# termina o programa
	syscall
	
