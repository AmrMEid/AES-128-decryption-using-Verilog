# AES-128-decryption-using-Verilog
designing a hardware using Verilog to decrypt AES message and implement the design with less than 3% of zynq FPGA resources in one-lab CU competition


## Algorithm

The Advanced Encryption Standard (AES) is a famous method for the encryption of electronic data. AES operates on 16 bytes long text (or 128-bits) which arrange in a 4 × 4 matrix .

![Asset 4](https://user-images.githubusercontent.com/43087648/94997694-12556700-05ad-11eb-93f2-b2b307737167.png)
![Asset 1](https://user-images.githubusercontent.com/43087648/94997703-2ac58180-05ad-11eb-9ac2-96f4dd565c99.png)

Encryption or Dycryption consists of 10 rounds of processing for 128-bit keys. All rounds are simialr except the last one as shown in next figure . 

![Asset 5](https://user-images.githubusercontent.com/43087648/94997635-c9051780-05ac-11eb-90ab-9208b907185f.png)

This project divided to 2 main blocks . key expansion block and Rounds block which also divided to 4 smaller blocks(shift rows-subbytes - add round key - mix columns).

### 1.Shift Rows

It's a trasportation step which rotates right wise n elements in every n-th row. 
As shown in next figure, first row (row number 0) no change happens.in second row(row number 1) 1 element rotates right. and so on.

![Asset 1](https://user-images.githubusercontent.com/43087648/94997793-b5a67c00-05ad-11eb-857b-8b96c52c01b8.png)  ![Asset 2](https://user-images.githubusercontent.com/43087648/94997783-a7f0f680-05ad-11eb-848c-1a223f118797.png) 
### 2.Sub bytes

This step replaces each entry in the matrix from the corresponding entry in the inverse S-Box as shown in next figure. for example if you have elemnt equals 0x32 you will replace it with 0xa1 and so on.

![Inverse-S-box-substitution-values-for-the-byte-xy-in-hexadecimal-format](https://user-images.githubusercontent.com/43087648/94997814-e71f4780-05ad-11eb-92bb-b9640c527358.png)

### 3.Add round key

it's a simple step where only xor key with the dycrepted data.


### 4.inverse mix col

this is step is a matrix multiplcation with the inverse convert matrix. every col will multiplied with each row of the inverse matrix to evaluate the new col and addition is just xor operation. as example to evaluate the first new element. the column will be multiplied with the first row in the inverse matrix. 
result= 0x0E * 16 + 0x0B * 15 + 0x0D * 14 + 0x09 * 13

![Asset 3](https://user-images.githubusercontent.com/43087648/94997827-0918ca00-05ae-11eb-95f7-a89975e23e2e.png)  ![Asset 1](https://user-images.githubusercontent.com/43087648/94997831-18981300-05ae-11eb-8875-c638870ad458.png)

in this step we used the adavnced multplication method to avoid using multpliers. in this method we used the shift property to evaluate x0= elem
x1= elem * 2
x2= elem * 4
x3= elem * 8
and adding them to have the combination of the inverse matrix as example if we need to multiply element by 0x09 we will add x3+x0 and so on.

another note in this method if the last bit in the element equals 1 before shifting then xor the result after shifting with 0x1B

