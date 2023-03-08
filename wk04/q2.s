# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# Constants
FLAG_ROWS = 6
FLAG_COLS = 12

# Registers:


# locals
# $t2: &flag
# $t3: index offset 
# $t4: &flag[row][col]

	# Structure:
	#   main
	#   -> main__print_row_init
	#   -> main__print_row_cond
	#   	-> main__print_col_init
	#   	-> main__print_col_cond
	# 	-> main__print_col_end
	#   -> main__print_row_end
main:

main__print_row_init:
	li	$t0, 0			# row = 0

main__print_row_cond:
	bge	$t0, FLAG_ROWS, main__print_row_end

main__print_col_init:
	li	$t1, 0			# col = 0

main__print_col_cond:
	bge	$t1, FLAG_COLS, main__print_col_end

						# printf("%c", flag[row][col]);
	# calculate the address of element flag[row][col]
	# BaseOffset + (row_index * MAX_COL + col_index) * 1

	la	$t2, flag			# $t2: &flag
	mul	$t3, $t0, FLAG_COLS		# $t3: index offset 
	add	$t3, $t3, $t1

	add	$t4, $t3, $t2			# &flag[row][col]

	# load the character from the array
	lb	$a0, ($t4)
	# print character
	li	$v0, 11
	syscall


	addi	$t1, $t1, 1
	b 	main__print_col_cond

main__print_col_end:
	# printf("\n");
	la	$a0, '\n'
	li	$v0, 11
	syscall

	addi	$t0, $t0, 1
	b 	main__print_row_cond

main__print_row_end:

	li	$v0, 0                  # return 0
	jr	$ra


	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'