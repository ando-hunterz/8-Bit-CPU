# 8 Bit RISC CPU
## Arsitektur
CPU ini memiliki arsitektur yang berdasarkan dari arsitektur Von-Neumman dimana, Control Unit, ALU dan Register berada didalam satu bagian yang disebut dengan CPU, kemudian memory unit terdapat terpisah. Gambar dari Von Neumman Architecture dapat dilihat dibawah ini

![Von-Neumann](https://github.com/ando-hunterz/8-Bit-CPU/blob/master/github_assets/Von_Neumann.png)

## Macro Architecture
CPU ini memiliki Macro Architecture sebagai Berikut

![Macro Architecture](https://github.com/ando-hunterz/8-Bit-CPU/blob/master/github_assets/TopDownView.png)

## Micro Architecture
CPU ini terdiri dari 10 Bagian yaitu

### Control Unit
Control Unit berfungsi sebagai otak dari CPU, pada CPU ini control unit berfungsi untuk memberikan signal kepada blok-blok lainnya yang berada pada CPU.

![Control Unit](https://github.com/ando-hunterz/8-Bit-CPU/blob/master/github_assets/Controller.png)

### ALU 
ALU berfungsi sebagai otak proses penghitungan dari CPU, pada CPU ini, fungsi matematika yang didukung adalah penambahan serta pengurangan (hanya dapat mengurangi dengan satu). CPU ini juga memiliki register Temporary yang digunakan untuk menyimpan integer.

![ALU](https://github.com/ando-hunterz/8-Bit-CPU/blob/master/github_assets/ALU.png)

### Register
Pada CPU ini, Register yang ada berjumlah 16, dimana tiap register dapat menampung sebanyak 8 bit. Sehingga jumlah dari Register adalah sebanyak 16 Byte.

![Register](github_assets/Register)

### Accumulator
Accumulator bekerja sebagai tempat penyimpanan sementara dari hasil proses perhitungan dari ALU. Accumulator yang ada mendapat data dari ALU dan data yang dikeluarkan kemudian juga akan dipakai kembali oleh ALU.

### Instruction Register
Instruction Register mempunyai fungsi untuk menentukan instruksi apa yang akan dijalankan oleh blok-blok yang lainnya. Instruction register mendapat instruksi dari hasil fetch ROM. Selain itu Instruction Register juga berfungsi untuk membedakan address yang diberikan adalah address dari Instruksi atau address untuk Register.

### Program Counter
Program Counter berfungsi sebagai detak jantung dari CPU, dimana program counter sendiri digunakan untuk memberikan alamat dari memory untuk dieksekusi. PC pada CPU kami berfungsi untuk memberikan alamat yang berupa alamat ROM. PC pada CPU ini juga dapat menerima input sebanyak 8 Bit yang berupa address dari ROM.

### RAM
RAM merupakan memory sementara yang digunakan untuk menyimpan data hasil perhitungan ataupun data yang didapatkan dari Register. RAM yang terdapat di CPU adalah sebanyak 256 Bytes atau 256 * 8 Bit.

### ROM
ROM merupakan memory yang digunakan untuk menyimpan instruksi/program yang akan dijalankan oleh CPU. ROM yang terdapat di CPU ini adalah sebanyak 256 Bytes atau 256 * 8 Bit.

### Address Multiplexer
Address Multiplexer digunakan untuk memilih apakah address yang akan diakses adalah address yang diberikan dari PC atau address yang didapatkan dari instruksi. 

## Instruksi

