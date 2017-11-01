(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(* Nama file 	: bujursangkar.pas						*)
(*Topik     	: Skema									*)
(*Tanggal   	: 13 April 2016*)
(*Deskripsi 	: Program menerima input sisi (dalam bentuk integer). Input sisi harus divalidasi sehingga selalu > 0. Apabila sisi yang dimasukkan <= 0, program akan mengeluarkan pesan error. Setelah sisi yang dimasukkan valid, program menghasilkan luas sisi dengan rumus: sisi * sisi*)

program bujursangkar;

var
	x: integer;

begin
	readln (x);
	if (x > 0) then
		begin
			writeln ( x * x );
		end
	else
		begin
			writeln ('Sisi harus > 0');
		end;
end.
