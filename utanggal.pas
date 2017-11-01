(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(*Nama file 	: lingkaran.pas							*)
(*Topik     	: Modular Programming					*)
(*Tanggal   	: 6 April 2016							*)
(*Deskripsi 	: unit bernama utanggal yang mengandung deklarasi type tanggal berikut operasi-operasinya (dalam bentuk fungsi/prosedur). 										*)
unit utanggal;

interface
     { Type tanggal }
type
	tanggal = record
		dd: integer; {hari, 1 <= dd <= 31}
		mm: integer; {bulan, 1 <= mm <= 12}
		yy: integer; {tahun, 0 < yy <= 9999}
	end;

{ Deklarasi Fungsi/Prosedur }
function IsKabisat (y : integer) : boolean;
{ Menghasilkan true jika y adalah tahun kabisat,
  yaitu jika tahun abad (habis dibagi 100) maka harus habis dibagi 400
  atau jika bukan tahun abad (tidak habis dibagi 100), maka harus habis dibagi 4 }
  
function IsTanggalValid (d, m, y : integer) : boolean;
{ Menghasilkan true jika d, m, y dapat membentuk tanggal yang valid 
  dengan d sebagai hari, m sebagai bulan, dan y sebagai tahun. }
{ Beberapa syarat tanggal valid selain syarat rentang nilai di atas:
  Jika mm salah satu dari [1,3,5,7,8,10,12] maka 1 <= dd <= 31;
  Jika mm salah satu dari [4,6,9,11] maka 1 <= dd <= 30       
  Jika mm = 2, jika yy tahun kabisat, maka 1 <= dd <= 29 
               jika yy bukan tahun kabisat, maka 1 <= dd <= 28 }

procedure TulisTanggal (T : tanggal);
{ Menuliskan tanggal P ke layar dalam bentuk "T.dd/T.mm/T.yy" }
{ Tidak diawali, diselangi, atau diakhiri dengan karakter apa pun, termasuk spasi 
  atau pun enter }
{ I.S.: T terdefinisi }
{ F.S.: T tercetak di layar dalam bentuk "T.dd/T.mm/T.yy" }

function IsLebihAkhir (T1, T2 : tanggal) : boolean;
{ Menghasilkan true jika T1 lebih akhir dari T2 }
{ Menggunakan analisis kasus }

{ Realisasi Fungsi/Prosedur }
implementation
function IsKabisat (y : integer) : boolean;
{ Menghasilkan true jika y adalah tahun kabisat,
  yaitu jika tahun abad (habis dibagi 100) maka harus habis dibagi 400
  atau jika bukan tahun abad (tidak habis dibagi 100), maka harus habis dibagi 4 }
begin
	IsKabisat := (((y mod 100 = 0) and (y mod 400 = 0)) or ((y mod 100 <> 0) and 
	(y mod 4 = 0)));
end;

function IsTanggalValid (d, m, y : integer) : boolean;
{ Menghasilkan true jika d, m, y dapat membentuk tanggal yang valid 
  dengan d sebagai hari, m sebagai bulan, dan y sebagai tahun. }
{ Beberapa syarat tanggal valid selain syarat rentang nilai di atas:
  Jika mm salah satu dari [1,3,5,7,8,10,12] maka 1 <= dd <= 31;
  Jika mm salah satu dari [4,6,9,11] maka 1 <= dd <= 30       
  Jika mm = 2, jika yy tahun kabisat, maka 1 <= dd <= 29 
               jika yy bukan tahun kabisat, maka 1 <= dd <= 28 }
begin
	if ((y > 0) and (y <= 9999) and (m >= 1) and (m <= 12)) then
		begin
			if (m in [1,3,5,7,8,10,12]) then
				begin
					if ((d >= 1) and (d <= 31)) then
						begin
							IsTanggalValid := TRUE;
						end
					else
						begin
							IsTanggalValid := FALSE;
						end;
				end
			else
				if (m in [4,6,9,11]) then
					begin
						if ((d >= 1) and (d <= 30)) then
							begin
								IsTanggalValid := TRUE;
							end
						else
							begin
								IsTanggalValid := FALSE;
							end;
					end
				else {if (m = 2) then}
					begin
						if (IsKabisat (y)) then
							begin
								if ((d >= 1) and (d <= 29)) then
									begin
										IsTanggalValid := TRUE;
									end
								else
									begin
										IsTanggalValid := FALSE;
									end;
							end
						else {not IsKabisat (y)}
							begin
								if ((d >= 1) and (d <= 28)) then
									begin
										IsTanggalValid := TRUE;
									end
								else
									begin
										IsTanggalValid := FALSE;
									end;
							end;
					end;
		end
	else {y <= 0 or y > 9999 or m < 1 or m > 12}
		begin
			IsTanggalValid := FALSE;
		end;
end;

procedure TulisTanggal (T : tanggal);
{ Menuliskan tanggal P ke layar dalam bentuk "T.dd/T.mm/T.yy" }
{ Tidak diawali, diselangi, atau diakhiri dengan karakter apa pun, termasuk spasi 
  atau pun enter }
{ I.S.: T terdefinisi }
{ F.S.: T tercetak di layar dalam bentuk "T.dd/T.mm/T.yy" }
begin
	write(T.dd,'/',T.mm,'/',T.yy);
end;

function IsLebihAkhir (T1, T2 : tanggal) : boolean;
{ Menghasilkan true jika T1 lebih akhir dari T2 }
{ Menggunakan analisis kasus }
begin
	if (T1.yy > T2.yy) then
		begin
			IsLebihAkhir := TRUE;
		end
	else 
		if (T1.yy < T2.yy) then 
			begin
				IsLebihAkhir := FALSE;
			end
		else
			if (T1.yy = T2.yy) then
				begin
					if (T1.mm > T2.mm) then
						begin
							IsLebihAkhir := TRUE;
						end
					else
						if (T1.mm < T2. mm) then
							begin
								IsLebihAkhir := FALSE;
							end
						else
							if (T1.mm = T2.mm) then
								begin
									if (T1.dd > T2.dd) then
										begin
											IsLebihAkhir := TRUE;
										end
									else
										if (T1.dd < T2.dd) then
											begin
												IsLebihAkhir := FALSE;
											end; {Asumsi J1 dan J2 berbeda}
								end;
				end;
end;

end.
