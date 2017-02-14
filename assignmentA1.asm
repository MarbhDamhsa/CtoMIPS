

    .data
i:  .word 11
j:  .word 10
A:  .word 0x11, 0x22, 0x33
B:  .word 0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8
    .text
    la $s3, i          # load address of i
    la $s4, j          # load address of j
    la $s6, A          # load address of A
    la $s7, B          # load address of B

    lw  $t1, ($s3)              # $t1 = i
    lw  $t1, i                  # $t1 = i does the same
    lw  $t2, ($s4)              # $t2 = j
    lw  $t2, j                  #         does the same
    sub $t0, $t1, $t2           # $t0 = i - j
    ##########################################
    # scale array index by 4 ( size of int ) #
    ##########################################
    mul $t0, $t0, 4             # $t0 = $t0 * 4
    lw  $t1, A( $t0 )           # $t1 = A[i - j]
    
    ################################################################
    #### After execution, the program returns the value of 22   ####
    ################################################################
    
