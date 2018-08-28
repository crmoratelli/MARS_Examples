# Calcula a multiplicação de dois número através de somas sucessivas. 

.data
msg1: .asciiz "Digite o multiplicador: "
msg2: .asciiz "Digite o multiplicando: "

.text
	la $a0, msg1	#imprime mensagem
	li $v0, 4
	syscall
		
	li $v0, 5	#ler inteiro
	syscall
	
	move $t0, $v0 	#multiplicador em t0
	
	la $a0, msg2	#imprime mensagem
	li $v0, 4
	syscall
		
	li $v0, 5	#ler inteiro
	syscall

	move $t1, $v0 	#multiplicando em t1
	
	
loop:
	subi $t0, $t0, 1	#calcula multiplicacao, resultado em t2
	add $t2, $t2, $t1
	bgtz $t0, loop
	
	move $a0, $t2		# exibe resultado
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
