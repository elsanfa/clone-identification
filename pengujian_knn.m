clear
close all
clc

load data_hasil_training

[filename, pathname] = uigetfile('*.jpg','Pilih file citra','C:\Users\user\Pictures\clone identification');
citra = imread([pathname filename]);
figure; imshow(citra);

citra_histeq = preprosesing(citra);
ciri_uji = ekstraksi_ciri_glcm(citra_histeq);

[id_kelas,score,cost] = predict(Mdl,ciri_uji);
kelas_uji = target{id_kelas}