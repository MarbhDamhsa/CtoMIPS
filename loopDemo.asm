    .eqv SERVICE_PRINT_INT 1
    .eqv SERVICE_EXIT      10
.data
    left:  .word 1
    right:  .word 10
.text
    # loop example
    # while (left < right ) {
    #     ++left;
    #     print left ( 2 3 4 5 6 7 8 9 10 )
    # }
    
    lw   $t1, left                     # $t1 = left
    lw   $t2, right                    # $t2 = right
    
while_loop_begin:
        # while (left < right ) {
        slt  $t3, $t1, $t2                 # if ( $t1 < $t2 ) $t3 = 1; otherwise $t3 = 0
        beq  $t3, $zero, while_loop_end    # if ( $t3 == 0 ) jump out of the loop
        addi $t1, $t1, 1                   #     ++left;
        
        #li  $v0, 1           # service 1 is print integer
        #add $a0, $t1, $zero  # load desired value into argument register $a0, using pseudo-op
        #syscall
        jal print_t1          # subroutine call
        
        j while_loop_begin                 # }
        
while_loop_end:
    li $v0, SERVICE_EXIT
    syscall
    
print_t1:    # subroutine
        li  $v0, SERVICE_PRINT_INT           
        add $a0, $t1, $zero  # load desired value into argument register $a0, using pseudo-op
        move $s7, $ra        # preserve return address
        syscall
        move $ra, $s7
        jr  $ra              # return from the call
