Decrypt:
ADDI $30, $0, 32
ADDI $12, $0, 12 // init iterator
ADDI $13, $0, 0

LW $1, 36($0) // load a from MEM[36]
LW $2, 37($0) // load b from MEM[37]

-- Loop Start --
ADD $11, $12, $12 // 2 * index
LW $9, 0($11) // load s[2*index]
LW $10, 1($11) // load s[2*index+1]

SUB $2, $2, $10
ADD $3, $0, $2
ADD $4, $0, $1
ANDI $4, $4, 31
BEQ $1, $0, 3
SHR $3, $3, 1 
SUBI $4, $4, 1
BNE $4, $0, -3 // shift b-s[index*2+1] right by a bits
ADD $4, $0, $1
ANDI $4, $4, 31
BEQ $1, $0, 3
SHL $2, $2, 1 
ADDI $4, $4, 1
BNE $4, $30, -3 // shift b-s[index*2+1] left by 32-a bits
OR $2, $2, $3 // right rotate b-s[index*2+1] by a bits
NOR $3, $1, $1 
NOR $4, $2, $2 
OR $3, $3, $2 
OR $4, $4, $1 
AND $2, $3, $4 // a xor b = (!a or b) and (a or !b)

SUB $1, $1, $9
ADD $3, $0, $1
ADD $4, $0, $2
ANDI $4, $4, 31
BEQ $2, $0, 3
SHR $3, $3, 1 
SUBI $4, $4, 1
BNE $4, $0, -3 // shift a-s[index*2] right by b bits
ADD $4, $0, $2
ANDI $4, $4, 31
BEQ $2, $0, 3
SHL $1, $1, 1 
ADDI $4, $4, 1
BNE $4, $30, -3 // shift a-s[index*2] left by 32-b bits
OR $1, $1, $3 // right rotate a-s[index*2] by b bits
NOR $3, $1, $1
NOR $4, $2, $2 
OR $3, $3, $2 
OR $4, $4, $1 
AND $1, $3, $4 // a xor b = (!a or b) and (a or !b)

SUBI $12, $12, 1 // increment index by 1
BNE $12, $13, -41 // loop 12 times
-- Loop End --

LW $9, 0($0) // load s[0]
LW $10, 1($0) // load s[1]
SUB $1, $1, $9
SUB $2, $2, $10

SW $1, 38($0) // Store decrypted a to MEM[40]
SW $2, 39($0) // Store decrypted b to MEM[41]
HAL