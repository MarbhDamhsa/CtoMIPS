# CtoMIPS


    Rewrite C statement
    B[8] = A[i - j]
    in MIPS assembly

    i == 11
    j == 10

Pseudocode to follow:

int main()
 {
    const int A_SIZE = 2;
    const int B_SIZE = 9;
    int i = 11;
    int j = 10;
    int B[ ]; // this makes B[8] a legal array element
    int A[ ] = { 0x11, 0x22 }; // this makes A[i - j] legal
    
    B[8] = A[i - j];
 }


# loopDemo

Rewrite C statement

while (left < right ) {
     ++left;
     print left ( 2 3 4 5 6 7 8 9 10 )
}

in MIPS assembly.
