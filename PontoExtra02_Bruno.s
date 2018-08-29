#Factorial
#
#
#Objective: Computes the factorial.
#		Input: Request a number.
#	Output: Outputs the factorial.
######################## Data segment #########################
.data
prompt_msg:	.asciiz	"Please enter a number: \n"
result_msg:	.ascii	"The factorial is "
theNumber:	.word	0
theAnswer:	.word 	0
######################## Code segment ########################
.text
.globl main
main:
		
		li 		$v0,4			#Le o numero do usuario
		la		$a0,prompt_msg
		syscall

		li		$v0,5
		syscall

		sw		$v0,theNumber

		
		lw		$a0,theNumber	#Chama a funcao findFactorial
		jal		findFactorial
		sw		$v0,theAnswer

		
		li		$v0,4			#Mostra o resultado na tela
		la		$a0,result_msg
		syscall

		li		$v0,1		
		lw		$a0,theAnswer
		syscall


		li		$v0,10			#Sai do programa
		syscall

#################### Functions ##############################
.globl findFactorial
findFactorial:
				subu	$sp,$sp,8
				sw		$ra,($sp)
				sw		$s0,4($sp)

				
				li		$v0,1	#Caso base
				beq		$a0,0,factorialDone
				
				move	$s0,$a0	#FindFactorial(numero - 1)
				sub 	$a0,$a0,1
				jal		findFactorial

				
				mul		$v0,$s0,$v0	#Realiza a multiplicação

				factorialDone:
								lw		$ra,($sp)
								lw		$s0,4($sp)
								addu	$sp,$sp,8
								jr		$ra

