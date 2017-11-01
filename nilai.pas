(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(* Nama file 	: nilai.pas						*)
(*Topik     	: Skema									*)
(*Tanggal   	: 13 April 2016*)
(*Deskripsi 	: program yang digunakan untuk membaca masukan sejumlah nilai mahasiswa (dalam bentuk angka) untuk sebuah kelas mata kuliah, sampai pengguna mengetikkan -9999 (-9999 tidak termasuk nilai yang diproses). Harus diperiksa bahwa nilai yang dimasukkan berada dalam range 0-100. Jika ada data nilai yang salah, maka data tersebut diabaikan (tidak termasuk dalam pemrosesan).

Selanjutnya program menuliskan ada berapa banyak mahasiswa keseluruhan, berapa banyak yang lulus (yaitu yang mendapat nilai >=  40),  berapa yang tidak lulus (nilai <  40), dan rata-rata nilai (tuliskan dengan 2 angka di belakang koma), untuk data-data yang valid. Jika tidak ada data yang valid, maka tuliskan: 0 (menunjukkan banyaknya mahasiswa).

Semua data nilai yang salah diabaikan (tidak termasuk yang diproses). Jika pengguna dari awal mengetikkan -9999 (artinya tidak ada data yang dimasukkan), tuliskan pesan: “Data nilai kosong”.*)

program nilai;

var
	lulus, tlulus, tot, tnilai, i, j: integer;
	
begin
	i := 0;
	lulus := 0;
	tlulus := 0;
	tot := 0;
	j := 0;
	repeat
		j := j + 1;
		readln (tnilai);
		if (tnilai >= 0) and (tnilai <= 100) then
			begin
				i := i + 1;
				tot := tot + tnilai;
				if (tnilai >= 40) then
					begin
						lulus := lulus + 1;
					end
				else
					begin
						tlulus := tlulus + 1;
					end;
			end;
		{else tidak melakukan apa-apa}
	until (tnilai = -9999);
	if (j = 1) and (i = 0) then
		begin
			writeln ('Data nilai kosong');
		end
	else
		if (j > 1) and (i = 0) then
			begin
				writeln (i);
			end
		else 
			if (j > 1) and (i >= 1) then
				begin				
					writeln (i);
					writeln (lulus);
					writeln (tlulus);
					writeln (tot/i:0:2);
				end;
end.
