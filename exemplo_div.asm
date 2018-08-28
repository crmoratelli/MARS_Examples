#Exemplo de divisão usando instruçao div.

.data
msg1: .asciiz "Dividendo: "
msg2: .asciiz "Divisor: "
msg3: .asciiz "Resultado: "
msg4: .asciiz "\n"
msg5: .asciiz "Resto: "

.text
	la $a0, msg1 	#exibe mensagem
	li $v0, 4
	syscall 
	
	li $v0, 5	#ler dividendo
	syscall
	
	move $t0, $v0	#dividendo em t0
		
	la $a0, msg2 	#exibe mensagem
	li $v0, 4
	syscall 
	
	li $v0, 5	#ler divisor
	syscall
	
	move $t1, $v0	#divisor em t1
		
		
	div $t0, $t1 	#t0 divididor por t1
	
	la $a0 msg3	#exibe o quociente da divisao
	li $v0, 4
	syscall
	
	mflo $a0	#quociente fica em lo (a0 = lo)
	li $v0, 1
	syscall
	
	la $a0 msg4   #quebra de linha
	li $v0, 4
	syscall

	la $a0 msg5	#exibe o resto da divisao
	li $v0, 4
	syscall
	
	mfhi $a0	#resto da divisao fica em hi (a0 = hi)
	li $v0, 1
	syscall	
	
	li $v0, 10	#termina programa
	syscall		
