(*NIM/Nama  	: 16515034/Mikhael Artur Darmakesuma	*)
(*Nama file 	: lingkaran.pas							*)
(*Topik     	: Modular Programming					*)
(*Tanggal   	: 6 April 2016							*)
(*Deskripsi 	: Program menrima input 2 buah lingkaran kemudian menghasilkan output luas dan keliling kedua lingkaran serta hubungan kedua lingkaran										*)
Program ProsesLingkaran;
{ Input: 2 buah Lingkaran }
{ Output: luas, keliling, dan hubungan lingkaran A dan B }

{ KAMUS }
const
        PI : real = 3.1415;
type
        { Definisi Type Koordinat }
        Koordinat = record
				x, y: real;
        end;
        { Definisi Type Lingkaran }
        Lingkaran = record
                      c : Koordinat; { titik pusat lingkaran }
                      r : real;      { jari-jari, > 0 }
        end;
var
        A, B : Lingkaran; { variabel untuk lingkaran A dan B }
 
{ FUNGSI DAN PROSEDUR }
function IsRValid (r: real):boolean;
{Menghasilkan true jika r > 0 dan false jika r <= 0}
begin
	IsRValid := (r > 0);
end;

procedure InputLingkaran (var A : Lingkaran);
{ I.S.: A sembarang }
{ F.S.: A terdefinisi sesuai dengan masukan pengguna. Pemasukan jari-jari diulangi 
        sampai didapatkan jari-jari yang benar yaitu r > 0. Pemeriksaan apakah jari-
        jari valid menggunakan fungsi IsRValid.
        Jika jari-jari tidak valid, dikeluarkan pesan kesalahan “Jari-jari harus > 0”. }
begin
	readln (A.c.x,A.c.y);
	readln (A.r);
	while (not IsRValid (A.r)) do
		begin
			writeln ('Jari-jari harus > 0');
			readln (A.r);
		end;
end;
 
function KelilingLingkaran (A: Lingkaran) : real; 
{ Menghasilkan keliling lingkaran A = 2 * PI * A.r }
begin
	KelilingLingkaran := 2 * PI * A.r;
end;
 
function LuasLingkaran (A: Lingkaran) : real; 
{ Menghasilkan luas lingkaran A = PI * A.r * A.r }
begin
	LuasLingkaran := PI * A.r * A.r;
end;
 
function Jarak (P1, P2: Koordinat) : real;
{ Menghasilkan jarak antara P1 dan P2 }
begin
	Jarak := sqrt(((P1.x-P2.x)*(P1.x-P2.x))+((P1.y-P2.y)*(P1.y-P2.y)))
end;

function HubunganLingkaran (A1, A2: Lingkaran) : integer;
{ Menghasilkan integer yang menyatakan hubungan lingkaran A dan B, yaitu:
  1 = A dan B sama;
  2 = A dan B berimpit; 
  3 = A dan B beririsan;
  4 = A dan B bersentuhan;
  5 = A dan B saling lepas }
begin
	if (Jarak (A1.c, A2.c) = 0) then
		begin
			if (A1.r = A2.r) then
				begin
					HubunganLingkaran := 1;
				end
			else
				begin
					HubunganLingkaran := 2;
				end;
		end
	else
		if (Jarak (A1.c, A2.c) = (A1.r + A2.r)) then
			begin
				HubunganLingkaran := 4;
			end
		else
			if (Jarak (A1.c, A2.c) < (A1.r + A2.r)) then
				begin
					HubunganLingkaran := 3;
				end
			else
				if (Jarak (A1.c, A2.c) > (A1.r + A2.r)) then
					begin
						HubunganLingkaran := 5;
					end;
end;
 
{ ALGORITMA PROGRAM UTAMA }
begin
        writeln('Masukkan lingkaran A:');
		InputLingkaran (A); 
        writeln('Masukkan lingkaran B:');
        InputLingkaran (B); 
        writeln('Keliling lingkaran A = ', KelilingLingkaran (A):0:2); 
        writeln('Luas lingkaran A = ', LuasLingkaran (A):0:2);
        writeln('Keliling lingkaran B = ', KelilingLingkaran (B):0:2); 
        writeln('Luas lingkaran B = ', LuasLingkaran (B):0:2); 
        write('A dan B adalah ');
		if (HubunganLingkaran (A,B)) = 1 then
			begin
				writeln ('sama');
			end
		else
			if (HubunganLingkaran (A,B)) = 2 then
				begin
					writeln ('berimpit');
				end
			else
				if (HubunganLingkaran (A,B)) = 3 then
					begin
						writeln ('beririsan');
					end
				else
					if (HubunganLingkaran (A,B)) = 4 then
						begin
							writeln ('bersentuhan');
						end
					else
						if (HubunganLingkaran (A,B)) = 5 then
							begin
								writeln ('saling lepas');
							end;
end. 
