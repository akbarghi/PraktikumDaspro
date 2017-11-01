unit udatasaham;
{
NIM/Nama  : 16515034/Mikhael Artur Darmakesuma
Nama file : udatasaham.pas
Topik     : skema
Tanggal   : 27 April 2016
Deskripsi : unit udatasaham digunakan untuk mengelola data kepemilikan saham perusahaan dari beberapa pemilik perseorangan. udatasaham juga digunakan untuk mengelola (membaca dan menulis) sekuensial file dengan rekaman bertype dataSaham. Mark untuk file bertype dataSaham adalah : < "99999999","XX9999",-999>
}
interface
const NMax = 100;

type 
	dataSaham = record
		IdPemilik : string; { Kode Pemilik Saham }
		IdPT : string;      { Kode Perusahaan }
		Nilai : integer;    { Nilai saham, dalam juta rupiah }
	end;

	tabPemilikSaham = record
		TSaham : array [1..NMax] of dataSaham;
		Neff : integer; { 0..100, nilai efektif, 0 jika tabel kosong }
	end;
	
function EOP (rek : dataSaham): boolean;
{ Menghasilkan true jika rek = mark }

procedure LoadDataNilai (filename: string; var T: tabPemilikSaham);
{ I.S. : filename terdefinisi, T sembarang }
{ F.S. : Tabel T terisi kepemilikan saham dengan data yang dibaca dari file dengan nama = filename. T.Neff = 0 jika file kosong; T diisi dengan seluruh isi file atau sampai T penuh. }

procedure UrutPemilikAsc (var T : tabPemilikSaham);
{ I.S. : T terdefinisi; T mungkin kosong }{ F.S. : Isi tabel T terurut membesar menurut IdPemilik. T tetap jika T kosong. }
{ Proses : Gunakan salah satu algoritma sorting yang diajarkan di kelas. Tuliskan nama algoritmanya dalam bentuk komentar. }

procedure HitungRataRata (T : tabPemilikSaham);
{ I.S. : T terdefinisi; T mungkin kosong }
{ F.S. : Menampilkan IdPemilik dan nilai rata-rata kepemilikan saham dalam tabel dengan format: <IdPemilik>=<rata-rata> 
Nilai rata-rata dibulatkan ke integer terdekat. Gunakan fungsi round. Jika tabel kosong, tuliskan "Data kosong" }
{ Proses : Menggunakan ide algoritma konsolidasi tanpa separator pada file eksternal, hanya saja diberlakukan pada tabel. }

procedure SaveDataNilai (filename : string; T : tabPemilikSaham);
{ I.S. : T dan filename terdefinisi; T mungkin kosong }
{ F.S. : Isi tabel T dituliskan pada file dg nama = filename }

implementation

function EOP (rek : dataSaham): boolean;
{ Menghasilkan true jika rek = mark }
begin
	EOP := (rek.IdPemilik = '99999999') and (rek.IdPT = 'XX9999') and (rek.Nilai = -999);
end;

procedure LoadDataNilai (filename: string; var T: tabPemilikSaham);
{ I.S. : filename terdefinisi, T sembarang }
{ F.S. : Tabel T terisi kepemilikan saham dengan data yang dibaca dari file dengan nama = filename. T.Neff = 0 jika file kosong; T diisi dengan seluruh isi file atau sampai T penuh. }
var
	f: file of dataSaham;
	temp: dataSaham;
begin
	assign (f, filename);
	reset (f);
	T.Neff := 0;
	read (f, temp);
	while not EOP (temp) do
		begin
			T.Tsaham[T.Neff] := temp;
			T.Neff := T.Neff + 1;
			read (f, temp);
		end;
	close (f);
end;

procedure UrutPemilikAsc (var T : tabPemilikSaham);
{ I.S. : T terdefinisi; T mungkin kosong }{ F.S. : Isi tabel T terurut membesar menurut IdPemilik. T tetap jika T kosong. }
{ Menggunakan Bubble Sorting }
var
	temp: dataSaham;
	i, j, k, tempidx: integer;
begin
	for i := 1 to T.Neff do
		begin
			temp := T.TSaham[i];
			for j := (i + 1) to T.Neff do
				begin
					if (temp.IdPemilik > T.TSaham[j].IdPemilik) then
						begin
							temp := T.TSaham[j];
							tempidx := j;
						end;
				end;
			for k := tempidx downto (i + 1) do
				begin
					T.TSaham [k] := T.TSaham [k - 1];
				end;
			T.TSaham[i] := temp;
		end;
end;

procedure HitungRataRata (T : tabPemilikSaham);
{ I.S. : T terdefinisi; T mungkin kosong }
{ F.S. : Menampilkan IdPemilik dan nilai rata-rata kepemilikan saham dalam tabel dengan format: <IdPemilik>=<rata-rata> 
Nilai rata-rata dibulatkan ke integer terdekat. Gunakan fungsi round. Jika tabel kosong, tuliskan "Data kosong" }
{ Proses : Menggunakan ide algoritma konsolidasi tanpa separator pada file eksternal, hanya saja diberlakukan pada tabel. }
var
	i, tempsaham, temp: integer;
begin
	tempsaham := T.TSaham[1].Nilai;
	temp := 1;
	for i := 2 to T.Neff do
		begin
			if (T.TSaham[i - 1].IdPemilik = T.TSaham[i].IdPemilik) then
				begin
					tempsaham := tempsaham + T.TSaham[i].Nilai;
					temp := temp + 1;
				end
			else
				begin
					writeln (T.TSaham[i - 1].IdPemilik, '=', round(tempsaham/temp));
					tempsaham := T.TSaham[i].Nilai;
					temp := 1;
				end;
		end;
	writeln (T.TSaham[i].IdPemilik, '=', tempsaham);
end;

procedure SaveDataNilai (filename : string; T : tabPemilikSaham);
{ I.S. : T dan filename terdefinisi; T mungkin kosong }
{ F.S. : Isi tabel T dituliskan pada file dg nama = filename }
var
	f: file of dataSaham;
	i: integer;
begin
	assign (f, filename);
	rewrite (f);
	for i := 1 to T.Neff do
		begin
			write (f, T.Tsaham[i]);
		end;
	close (f);
end;

end.
