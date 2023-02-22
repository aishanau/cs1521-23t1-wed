main:
# x in register $t0
	li	$v0, 4		# printf("Enter a number: ")
	la	$a0, prompt
	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall
	move 	$t0, $v0

	ble	$t0, 100, small_big_label
	bge	$t0, 1000, small_big_label

	li	$v0, 4
	la	$a0, medium_str
	syscall

	b	return_statement

small_big_label:
	li	$v0, 4
	la	$a0, small_big_str
	syscall

return_statement:
	li 	$v0, 0		# return 0;
	jr	$ra		

	.data
prompt:
	.asciiz "Enter a number: "

small_big_str:
	.asciiz "small/big\n"

medium_str:
	.asciiz "medium\n"