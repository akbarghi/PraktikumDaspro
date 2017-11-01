-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: TesSyarat.hs
-- TOPIK		: If dan Depend on
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: menentukan kelas beasiswa dari IP dan pot 	

module TesSyarat where

--DEFINISI SPESIFIKASI
tesSyarat :: Float -> Float -> Int 	

--REALISASI
tesSyarat ip pot
 |(ip >= 3.5)=4
 |otherwise = if (pot < 1) then 1
   else if ((pot >= 1) && (pot < 5) && (ip >=2 )) then 3
   else if ((pot >= 1) && (pot < 5) && (ip <2 )) then 2
   else 0
