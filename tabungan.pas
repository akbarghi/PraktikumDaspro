(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(* Nama file 	: tabungan.pas							*)
(*Topik     	: Skema									*)
(*Tanggal   	: 13 April 2016*)
(*Deskripsi 	: program yang digunakan untuk membaca masukan jumlah tabungan dari sejumlah siswa di suatu kelas. Program pertama-tama akan membaca input N yang merupakan jumlah siswa. N diasumsikan selalu valid, yaitu N > 0. Selanjutnya, program akan meminta input nilai tabungan sebanyak N (input nilai tabungan dianggap selalu valid, yaitu > 0) dan menghitung jumlah tabungan.*)

program tabungan;

var
	i, n, tab, temp: integer;
	
begin
	readln (n);
	tab := 0;
	for i := 1 to n do
		begin
			readln (temp);
			tab := tab + temp;
		end;
	writeln (tab);
end.
