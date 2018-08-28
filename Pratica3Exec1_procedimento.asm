# Procedimento que calcula a multiplicação de dois número através de somas sucessivas. 

.data
msg1: .asciiz "Digite o multiplicador: "
msg2: .asciiz "Digite o multiplicando: "

.text

	j PROC_main	#Salta para a função principal.

#Realiza multiplicacao de pois número através de somas sucessivas.
#Entradas:
#	a0: multiplicador
#	a1: multiplicando
#Saida:
#	v0: resultado	
PROC_mult:
	move $v0, $zero		#inicia v0 com 0.
	move $t0, $a0		#copia o multiplicador para t0

loop:
	subi $t0, $t0, 1	#calcula multiplicacao, resultado em v0
	add $v0, $v0, $t1
	bgtz $t0, loop

	jr $ra
	
	
PROC_main:
	la $a0, msg1		#imprime mensagem
	li $v0, 4
	syscall
		
	li $v0, 5		#ler inteiro
	syscall
	
	move $t0, $v0 		#multiplicador em t0
	
	la $a0, msg2		#imprime mensagem
	li $v0, 4
	syscall
		
	li $v0, 5		#ler inteiro
	syscall

	move $t1, $v0 		#multiplicando em t1
	
	move $a0, $t0		#multiplicador e multiplicando devem estar em a0 e a1, respectivamente.
	move $a1, $t1
	jal PROC_mult
		
	move $a0, $v0		# exibe resultado
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
