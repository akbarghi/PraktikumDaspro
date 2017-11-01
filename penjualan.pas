(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(* Nama file 	: penjualan.pas						*)
(*Topik     	: Skema									*)
(*Tanggal   	: 13 April 2016*)
(*Deskripsi 	: Buatlah sebuah program yang digunakan untuk membaca data penjualan suatu toko setiap hari dalam 20 hari. Input selalu dianggap valid yaitu > 0. Setelah nilai lengkap, program akan menuliskan semua nilai penjualan (diawali dengan indeks hari, lihat contoh), nilai penjualan tertinggi, dan penjualan terendah.*)

program penjualan;

var
	H: array [1..20] of integer;
	i, min, max: integer;
	
begin
	for i := 1 to 20 do
		begin
			readln (H[i]);
		end;
	min := H[1];
	min := H[1];
	writeln ('[H1]',H[1]);
	for i := 2 to 20 do
		begin
			writeln ('[H',i,']',H[i]);
			if (H[i] > max) then
				begin
					max := H[i];
				end;
			{else tidak melakukan apa-apa}
			if (H[i] < min) then
				begin
					min := H[i];
				end;
			{else tidak melakukan apa-apa}
		end;
	writeln ('Tertinggi = ', max);
	writeln ('Terendah = ', min);
end.
