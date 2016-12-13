-- Encrypt --
ADDI $30, $0, 32
ADDI $12, $0, 1 // init iterator
ADDI $13, $0, 13

LW $1, 36($0) // load a from MEM[36]
LW $2, 37($0) // load b from MEM[37]
LW $9, 0($0) // load s[0]
LW $10, 1($0) // load s[1]
ADD $1, $1, $9 // a = a + s[0]
ADD $2, $2, $10 // b = b + s[1]

-- Loop Start --
ADD $11, $12, $12 // 2 * index
LW $9, 0($11) // load s[2*index]
LW $10, 1($11) // load s[2*index+1]

NOR $3, $1, $1 
NOR $4, $2, $2 
OR $3, $3, $2 
OR $4, $4, $1 
AND $1, $3, $4 // a xor b = (!a or b) and (a or !b)
ADD $3, $0, $1
ADD $4, $0, $2
ANDI $4, $4, 31
BEQ $2, $0, 3
SHL $3, $3, 1 
SUBI $4, $4, 1
BNE $4, $0, -3 // shift a left by b bits
ADD $4, $0, $2
ANDI $4, $4, 31
BEQ $2, $0, 3
SHR $1, $1, 1 
ADDI $4, $4, 1
BNE $4, $30, -3 // shift a left by 32-b bits
OR $1, $1, $3 // left rotate a by b bits
ADD $1, $1, $9 

NOR $3, $1, $1
NOR $4, $2, $2 
OR $3, $3, $2 
OR $4, $4, $1 
AND $2, $3, $4 // a xor b = (!a or b) and (a or !b)
ADD $3, $0, $2
ADD $4, $0, $1
ANDI $4, $4, 31
BEQ $1, $0, 3
SHL $3, $3, 1 
SUBI $4, $4, 1
BNE $4, $0, -3 // shift b left by a bits
ADD $4, $0, $1
ANDI $4, $4, 31
BEQ $1, $0, 3
SHR $2, $2, 1 
ADDI $4, $4, 1
BNE $4, $30, -3 // shift b left by 32-a bits
OR $2, $2, $3 // left rotate b by a bits
ADD $2, $2, $10

ADDI $12, $12, 1 // increment index by 1
BNE $12, $13, -41 // loop 12 times
-- Loop End --

SW $1, 38($0) // Store encrypted a to MEM[38]
SW $2, 39($0) // Store encrypted b to MEM[39]