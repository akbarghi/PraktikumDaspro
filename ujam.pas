(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(*Nama file 	: lingkaran.pas							*)
(*Topik     	: Modular Programming					*)
(*Tanggal   	: 6 April 2016							*)
(*Deskripsi 	: unit bernama ujam yang mengandung deklarasi type jam berikut operasi-operasinya (dalam bentuk fungsi/prosedur)*)
unit ujam;

interface
     { Type pecahan }
type
	Jam = record
		hh: integer; {0..23, bagian jam}
		mm: integer; {0..59, bagian menit}
		ss: integer; {0..59, bagian detik}
	end;

{ Deklarasi Fungsi/Prosedur }
function IsJamValid (h, m, s : integer) : boolean;
{ Menghasilkan true jika h, m, s dapat membentuk jam yang valid, sesuai definisi jam 
  di atas, dengan h sebagai bagian hh, m sebagai bagian mm, dan s sebagai bagian ss }
  
procedure TulisJam (J : Jam);
{ Menuliskan jam J ke layar dalam bentuk "J.hh:J.mm:J.ss" }
{ Tidak diawali, diselangi, atau diakhiri dengan karakter apa pun, termasuk spasi atau pun enter }
{ I.S.: J terdefinisi }
{ F.S.: J tercetak di layar dalam bentuk "hh:mm:ss" }

function IsJamLebihAwal (J1, J2 : Jam) : boolean;
{ Menghasilkan true jika J1 lebih awal daripada J2 }
{ Menggunakan analisis kasus/kondisional }

function Durasi (J1, J2 : Jam) : longint;
{ Menghasilkan durasi antara J1 dengan J2 dengan cara: jumlah detik J2 – jumlah detik J1 }
{ Untuk menghasilkan jumlah detik dari suatu jam <hh,mm,ss> dari jam <0,0,0> 
  gunakan rumus = hh * 3600 + mm * 60 + ss. }
{ Prekondisi : J1 lebih awal dari atau sama dengan J2 }
		
{ Realisasi Fungsi/Prosedur }
implementation
function IsJamValid (h, m, s : integer) : boolean;
{ Menghasilkan true jika h, m, s dapat membentuk jam yang valid, sesuai definisi jam 
  di atas, dengan h sebagai bagian hh, m sebagai bagian mm, dan s sebagai bagian ss }
begin
	IsJamValid := ((h >= 0) and (h <= 23) and (m >= 0) and (m <= 59) and (s >= 0) and (s <= 59));
end;
  
procedure TulisJam (J : Jam);
{ Menuliskan jam J ke layar dalam bentuk "J.hh:J.mm:J.ss" }
{ Tidak diawali, diselangi, atau diakhiri dengan karakter apa pun, termasuk spasi atau pun enter }
{ I.S.: J terdefinisi }
{ F.S.: J tercetak di layar dalam bentuk "hh:mm:ss" }
begin
	write (J.hh,':',J.mm,':',J.ss);
end;

function IsJamLebihAwal (J1, J2 : Jam) : boolean;
{ Menghasilkan true jika J1 lebih awal daripada J2 }
{ Menggunakan analisis kasus/kondisional }
begin
	if (J1.hh < J2.hh) then
		begin
			IsJamLebihAwal := TRUE;
		end
	else 
		if (J1.hh > J2.hh) then 
			begin
				IsJamLebihAwal := FALSE;
			end
		else
			if (J1.hh = J2.hh) then
				begin
					if (J1.mm < J2.mm) then
						begin
							IsJamLebihAwal := TRUE;
						end
					else
						if (J1.mm > J2. mm) then
							begin
								IsJamLebihAwal := FALSE;
							end
						else
							if (J1.mm = J2.mm) then
								begin
									if (J1.ss < J2.ss) then
										begin
											IsJamLebihAwal := TRUE;
										end
									else
										if (J1.ss > J2.ss) then
											begin
												IsJamLebihAwal := FALSE;
											end; {Asumsi J1 dan J2 berbeda}
								end;
				end;
end;

function Durasi (J1, J2 : Jam) : longint;
{ Menghasilkan durasi antara J1 dengan J2 dengan cara: jumlah detik J2 – jumlah detik J1 }
{ Untuk menghasilkan jumlah detik dari suatu jam <hh,mm,ss> dari jam <0,0,0> 
  gunakan rumus = hh * 3600 + mm * 60 + ss. }
{ Prekondisi : J1 lebih awal dari atau sama dengan J2 }
begin
	Durasi := -((J1.hh-J2.hh) * 3600 + (J1.mm-J2.mm) * 60 + (J1.ss-J2.ss));
end;

end.

