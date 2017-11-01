-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: JamLembur.hs
-- TOPIK		: If dan Depend on
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: menentukan lembur atau tidak dan jam lembur 	

module JamLembur where

--DEFINISI SPESIFIKASI
jamLembur :: Int -> Int -> Int -> (Bool,Int,Int,Int)

--REALISASI
jamLembur j m d =
                   let
                      sisadetik = j*3600 + m*60 + d
                   in
                      if (sisadetik <= 59400) then
                         (False, div(abs(59400-sisadetik)) 3600, div(mod(abs(59400-sisadetik))3600)60, mod(mod(abs(59400-sisadetik))3600)60)
                      else
					     (True, div(abs(59400-sisadetik)) 3600, div(mod(abs(59400-sisadetik))3600)60, mod(mod(abs(59400-sisadetik))3600)60)
