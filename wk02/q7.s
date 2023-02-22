main:

	# store x in $t0
	li	$t0, 24 		# int x = 24; 

main_loop_condition:
	bge	$t0, 42, main_end_loop	# if (x >= 42) goto end_loop;

	li	$v0, 1 			# printf("%d", x);
	move	$a0, $t0
	syscall

	li	$v0, 11			# printf("\n");
	li	$a0, '\n'
	syscall

	add	$t0, $t0, 3		# x += 3;

	b	main_loop_condition

main_end_loop:
	li	$v0, 0
	jr	$ra