# AES-128-decryption-using-Verilog
designing a hardware using Verilog to decrypt AES message and implement the design with less than 3% of zynq FPGA resources in one-lab CU competition


## Algorithm

The Advanced Encryption Standard (AES) is a famous method for the encryption of electronic data. AES operates on 16 bytes long text (or 128-bits) which arrange in a 4 × 4 matrix . Encryption or Dycryption consists of 10 rounds of processing for 128-bit keys. All rounds are simialr except the last one as shown in next figure . 

This project divided to 2 main blocks . key expansion block and Rounds block which also divided to 4 smaller blocks(shift rows-subbytes - add round key - mix columns).

# 1.Shift Rows

It's a trasportation step which rotates right wise n elements in every n-th row. 
As shown in next figure, first row (row number 0) no change happens.in second row(row number 1) 1 element rotates right. and so on.


# 2.Sub bytes

This step replaces each entry in the matrix from the corresponding entry in the inverse S-Box as shown in next figure. for example if you have elemnt equals 0x32 you will replace it with 0xa1 and so on.

# 3.Add round key

it's a simple step where only xor key with the dycrepted data.


# 4.inverse mix col

this is step is a matrix multiplcation with the inverse convert matrix. every col will multiplied with each row of the inverse matrix to evaluate the new col and addition is just xor operation. as example to evaluate the first new element. the column will be multiplied with the first row in the inverse matrix. 
result= 0x0E * 16 + 0x0B * 15 + 0x0D * 14 + 0x09 * 13

in this step we used the adavnced multplication method to avoid using multpliers. in this method we used the shift property to evaluate x0= elem
x1= elem * 2
x2= elem * 4
x3= elem * 8
and adding them to have the combination of the inverse matrix as example if we need to multiply element by 0x09 we will add x3+x0 and so on.

another note in this method if the last bit in the element equals 1 before shifting then xor the result after shifting with 0x1B

