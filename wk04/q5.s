
# #include <stdio.h>
# int sum4(int a, int b, int c, int d);
# int sum2(int x, int y);


# int main(void) {
#     int z = sum4(11, 13, 17, 19);
#     printf("%d\n", z);
#     return 0;
# }
main: 
	# because main function is calling another function (sum4), 
	# we need to push $ra onto stack
main__prologue:
	begin
	push	$ra

main__body:
	#     int z = sum4(11, 13, 17, 19);
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4
	
	#     printf("%d\n", z);
	move	$a0, $v0
	li	$v0, 1
	syscall

	la	$a0, '\n'
	li	$v0, 11
	syscall

main__epilogue:
	pop	$ra
	end

        li      $v0, 0          # return 0 from function main
        jr      $ra             # return from function main


# int sum4(int a, int b, int c, int d) {
#     int e = sum2(a, b);
#     int f = sum2(c, d);
#     return sum2(e, f);
# }
# assume all 4 args are in $a0-3


	# Args:     
	#	- $a0: int a
	#	- $a1: int b
	#	- $a2: int c
	#	- $a3: int d
	# Returns:  
	#	- $v0: int
	#
	# Frame:    [$ra, $s0, $s1, $s2] # anything you store on the stack i.e. anything you push / pop
	# Uses:     [$ra, $s0, $s1, $s2, $a0, $a1, $a2, $a3, $v0, $t1] # everything that you 'use' in the function
	# Clobbers: [$a0, $a1, $a2, $a3, $v0, $t1] # anything where the value is not the same after it returns
	#
	# Locals:
	#   - $s0: int e
	#   - $t1: int f
	#
	# Structure:
	#   read_board_size
	#   -> [prologue]
	#       -> 
	#   -> [epilogue]
sum4:
sum4__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2

sum4__body:
	# save the values of $a2 and $a3 into the $s registers
	move	$s1, $a2
	move	$s2, $a3

	#     int e = sum2(a, b);
	jal	sum2
	move	$s0, $v0		# we MUST use $s register

	#     int f = sum2(c, d);
	move	$a0, $s1		# currently relying on $a3 and $a2 
	move	$a1, $s2
	jal	sum2
	move	$t1, $v0


	move	$a0, $s0
	move	$a1, $t1
	jal	sum2
	# correct return value is already in $v0

sum4__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

        jr      $ra    


# int sum2(int x, int y) {
#     return x + y;
# }
sum2: 
	# doesn't call any other functions, 
	# so we don't need to place $ra onto stack 
	# we don't need to worry about $s registers

	li	$a2, 1
	li	$a3, 99

	add	$v0, $a0, $a1
	jr	$ra
