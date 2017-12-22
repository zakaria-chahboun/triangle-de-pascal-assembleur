## Projet (Trinagle de Pascal) ::LP2I:: zakaria CHAHBOUN
.data 
		msg: .asciiz "Enterz un entier\n"
		retLine: .asciiz "\n"
		i: .word -1
		j: .word 0
		c: .word 1
.text
.globl main
main:		
	# message ..
	li $v0,4
	la $a0,msg
	syscall
	
	# saisir un entier
	li $v0,5
	syscall
	move $8,$v0 # couper le contenu dans $8 (n=$8)
	
	lw $9,i
	lw $10,j
	lw $12,c
	
	for1:
		beq $9,$8,exit    #while(i<n)
		addi $12,$12,0    #c=1;
		li $10,0		  #j=0;initialisation
		addi $9,$9,1      #i++
		j for2			  #Boucle..
	for2:
		beq $10,$9,print    #while(j<=i)

		li $v0,1		   #afficher(c)
		move $a0,$12       #....
		syscall 		   #....
		sub $13,$9,$10     #tamp1=i-j
		addi $14,$10,1     #temp2=j+1
		mul $15,$13,$12    #tamp3=tamp1*c
		div $12,$15,$14    #c=tamp3/tamp2
		addi $10,$10,1     #j++
		j for2			   #Boucle..
	print:
		li $v0,1           #afficher(1)
		li $a0,1           #....
		syscall
		li $v0,4		   #afficher(\n)
		la $a0,retLine     #....  
		syscall
		j for1             #Boucle..
	exit:
		li $v0,10 # code de sortir
		syscall