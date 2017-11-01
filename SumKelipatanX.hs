-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: SumKelipatanX.hs
-- TOPIK		: Rekursif
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: menghitung jumlah kelipatan x dalam rentang tertentu

module SumKelipatanX where

--DEFINISI SPESIFIKASI
sumKelipatanX :: Int -> Int -> Int -> Int

--REALISASI
sumKelipatanX m n x
 |(m>n) = 0
 |(mod m x /= 0) = sumKelipatanX (m+1) n x
 |otherwise = m + sumKelipatanX (m+x) n x
