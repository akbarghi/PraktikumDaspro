(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(* Nama file 	: tinggi.pas							*)
(*Topik     	: Skema									*)
(*Tanggal   	: 13 April 2016*)
(*Deskripsi 	: program digunakan untuk membaca masukan tinggi tubuh mahasiswa (dalam bentuk angka) dalam suatu kelas, sampai pengguna mengetikkan -999 (-999 tidak termasuk nilai yang diproses). Harus diperiksa bahwa nilai yang dimasukkan berada dalam range 100-300. Jika ada data nilai yang salah, maka data tersebut diabaikan (tidak termasuk dalam pemrosesan). 

Selanjutnya program menuliskan ada berapa banyak mahasiswa keseluruhan, berapa banyak mahasiswa dengan tinggi <= 150, berapa banyak mahasiswa dengan tinggi >=170, dan berapa rata-rata tinggi mahasiswa. Tinggi rata-rata dituliskan tanpa koma (dibulatkan, gunakan fungsi round). 

Semua data nilai yang salah diabaikan (tidak termasuk yang diproses). Jika pengguna dari awal mengetikkan -999 (artinya tidak ada data yang dimasukkan) atau tidak ada data yang valid, tuliskan pesan: “Data kosong”.*)

program tinggi;

var
	lebih, kurang, tot, ttinggi, i: integer;
	
begin
	i := 0;
	lebih := 0;
	kurang := 0;
	tot := 0;
	repeat
		readln (ttinggi);
		if (ttinggi >= 100) and (ttinggi <= 300) then
			begin
				i := i + 1;
				tot := tot + ttinggi;
				if (ttinggi <= 150) then
					begin
						kurang := kurang + 1;
					end
				else
					if (ttinggi >= 170) then
						begin
							lebih := lebih + 1;
						end;
					{else tidak melakukan apa-apa}
			end;
		{else tidak melakukan apa-apa}
	until (ttinggi = -999);
	if (i = 0) then
		begin
			writeln ('Data kosong');
		end
	else
		begin
			writeln (i);
			writeln (kurang);
			writeln (lebih);
			writeln (round(tot/i));
		end;
end.
