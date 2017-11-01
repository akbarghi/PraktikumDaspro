-- NIM/NAMA		: 16516282/Akbar Ghifari
-- NAMA FILE	: LuasTrapesium.hs
-- TOPIK		: Luas Trapesium
-- TANGGAL		: 22 Februari 2017
-- DESKRIPSI	: Mencari luas trapesium dari input float

module LuasTrapesium where
--DEFINISI SPESIFIKASI
luasTrapesium :: Float -> Float -> Float -> Float
--REALISASI
luasTrapesium t s1 s2 =
 0.5*t*(s1+s2)
