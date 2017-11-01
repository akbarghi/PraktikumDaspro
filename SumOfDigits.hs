-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: SumOfDigits.hs
-- TOPIK		: mencari jumlah dari input integer
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: Mencari jumlah dari 4 angka berurutan

module SumOfDigits where

--DEFINISI SPESIFIKASI
sumOfDigits :: Int -> Int

--REALISASI
sumOfDigits x
 |(x==1) = 1
 |(x==2) = 2
 |(x==3) = 3
 |(x==4) = 4
 |(x==5) = 5
 |(x==6) = 6
 |(x==7) = 7
 |(x==8) = 8
 |(x==9) = 9
 |(x==0) = 0
 |otherwise = ((mod x 10) + sumOfDigits (div x 10))
 
