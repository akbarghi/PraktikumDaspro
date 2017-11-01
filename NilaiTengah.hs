-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: NilaiTengah.hs
-- TOPIK		: mencari nilai tengah
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: Mencari nilai tengah dari 3 input integer

module NilaiTengah where
--DEFINISI SPESIFIKASI
nilaiTengah :: Int -> Int -> Int -> Int
min3 :: Int -> Int -> Int -> Int
max3 :: Int -> Int -> Int -> Int
--REALISASI
min3 a b c
  |((a<b) && (a<c)) =a
  |((b<a) && (b<c)) =b
  |((c<a) && (c<b)) =c
 
max3 a b c
  |((a>b) && (a>c)) =a
  |((b>a) && (b>c)) =b
  |((c>a) && (c>b)) =c

nilaiTengah a b c =
    a+b+c-(min3 a b c)-(max3 a b c)
