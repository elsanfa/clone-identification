clear
close all
clc

load data_hasil_training

jml_uji = 0;
jml_benar = 0;

path = uigetdir;
folder = dir(path);
tic
for i=3:length(folder)
    namafolder = folder(i).name;
    tempatcitra = [path '\' namafolder];
    gambar = dir(tempatcitra);
    for j=3:length(gambar)
        namacitra = gambar(j).name;
        if strcmpi(namacitra(end-2:end),'CR2')
            jml_uji = jml_uji + 1;
            bacacitra = [tempatcitra '\' namacitra];
            img = imread(bacacitra);
            citra_histeq = preprosesing(img);
            ciri_uji = ekstraksi_ciri_glcm(citra_histeq);
            [id_kelas,score,cost] = predict(Mdl,ciri_uji);
            kelas_uji = target{id_kelas};
            if strcmpi(kelas_uji, namafolder)
                jml_benar = jml_benar + 1;
                disp([num2str(jml_uji), '. ', namacitra, ' ', namafolder, ' ', kelas_uji, ' = benar']);
            else
                disp([num2str(jml_uji), '. ', namacitra, ' ', namafolder, ' ', kelas_uji, ' = salah']);
            end
        end
    end
end
benar = jml_benar
akurasi = jml_benar ./ jml_uji * 100  %menghitung akurasi
waktu = toc/jml_uji  