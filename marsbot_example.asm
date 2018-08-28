 # Faz com que o robô MARSBot pinte uma linha de traços na tela.
 # Antes de executar esse programa você deve abrir o MARSBot no menu Tools.
 
 .data

.text
	li $s0, 0xffff8010	  #endereço para direção do robô
	li $s1, 0xffff8020	  #endereço para pintar
	li $s2, 0xffff8030	  #endereço para coordenada x
	li $s3, 0xffff8040	  #endereço para coordenada y
	li $s4, 0xffff8050	  #endereço para mover ou parar o robô

	li $t0, 145		 # direção do movimento (145° - abaixo e a direita)
	sw $t0, 0($s0)
	
	li $t0, 1		 # faz o robô se mover
	sw $t0, 0($s4)
	
	li $a0, 5000		 # sleep: espera por 5 segundos.
	li $v0, 32
	syscall
	
	sw $zero, 0($s4)	# para o robo
	
	li $t0, 90  		# direção do movimento (90° - direita)
	sw $t0, 0($s0)
	
	li $t0, 1		# faz o robô se mover
	sw $t0, 0($s4)
	
	move $t0, $zero
	move $t1, $zero

loop:
	not $t0, $t0		#alterna t0 entre 0 e 1. 
	andi $t0, $t0, 1	
	sw $t0, 0($s1)      	#Aciona ou desliga pintar. 
	
	li $a0, 1000		# sleep: espera por 1 segundo.
	li $v0, 32
	syscall
	
	addi $t1, $t1, 1
	
	ble $t1, 20, loop	#repete o laço 20 vezes

	sw $zero, 0($s4)    	# para o robô.	
	
	li $t0, 10		#termina o programa
	syscall

