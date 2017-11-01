program caricharacter;
{
NIM/Nama  : 16515034/Mikhael Artur Darmakesuma
Nama file : caricharacter.pas
Topik     : skema
Tanggal   : 27 April 2016
Deskripsi : program akan membaca sebuah integer positif N. Nilai N harus divalidasi sampai didapatkan nilai N yang benar, yaitu 0 < N <= 100. Jika masukan N salah, tuliskan pesan “Masukan salah. Ulangi!”. Setelah didapatkan nilai N yang benar, program meminta masukan N buah character.

Selanjutnya, program menerima masukan sebuah character, misalnya CC, dan menghasilkan:
	Jika CC = ‘S’ atau CC = ‘s’ (kependekan dari “small”), tuliskan urutan pertama ditemukannya character huruf kecil dan tuliskan hurufnya. Jika tidak ada character huruf kecil, tuliskan “Tidak ada huruf kecil”.
	Jika CC = ‘L’ atau CC = ‘l’ (el, kependekan dari “large”), tuliskan urutan pertama ditemukannya character huruf besar dan tuliskan hurufnya. Jika tidak ada character huruf besar, tuliskan “Tidak ada huruf besar”.
	Jika CC = ‘X’ atau CC = ‘x’, tuliskan urutan pertama ditemukannya character selain huruf dan tuliskan character-nya. Jika tidak ada character selain huruf, tuliskan “Semua huruf”.
	Jika CC selain selain ‘S’,’s’,’L’,’l’,’X’,’x’ tuliskan: “Tidak diproses”.
}
var
	cc: char;
	C: array [1..100] of char;
	N, i, idx: integer;
	found: boolean;

begin
	readln (N);
	while (N <= 0) or (N > 100) do
		begin
			writeln ('Masukan salah. Ulangi!');
			readln (N);
		end;
	for i := 1 to N do
		begin
			readln (C[i]);
		end;
	readln (cc);
	idx := 0;
	i := 1;
	found := FALSE;
	if (cc in ['s', 'S']) then
		begin
			while (i <= N) and not found do
				begin
					if ((ord(C[i]) >= 97) and (ord(C[i]) <= 122)) then
						begin
							idx := i;
							found := TRUE;
						end;
					i := i + 1;
				end;
			if (idx = 0) then
				begin
					writeln ('Tidak ada huruf kecil');
				end
			else
				begin
					writeln (idx, ' ', C[idx]);
				end;
		end
	else
		if (cc in ['l', 'L']) then
			begin
				while (i <= N) and not found do
					begin
						if ((ord(C[i]) >= 65) and (ord(C[i]) <= 90)) then
							begin
								idx := i;
								found := TRUE;
							end;
						i := i + 1;
					end;
				if (idx = 0) then
					begin
						writeln ('Tidak ada huruf besar');
					end
				else
					begin
						writeln (idx, ' ', C[idx]);
					end;
			end
		else
			if (cc in ['x', 'X']) then
				begin
					while (i <= N) and not found do
						begin
							if not (((ord(C[i]) >= 65) and (ord(C[i]) <= 90)) or ((ord(C[i]) >= 97) and (ord(C[i]) <= 122))) then
								begin
									idx := i;
									found := TRUE;
								end;
							i := i + 1;
						end;
					if (idx = 0) then
						begin
							writeln ('Semua huruf');
						end
					else
						begin
							writeln (idx, ' ', C[idx]);
						end;
				end
			else {not cc in [‘S’,’s’,’L’,’l’,’X’,’x’]}
				begin
					writeln ('Tidak diproses');
				end;
end.
