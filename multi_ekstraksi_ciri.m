clear
close all
clc

ciri_latih = []; 
group = [];%kelasnya dari kelas 1 sampai 22 dari gmb 1 sampai gmb 11 dll
target = {}; %nama kelasnya didapat dari nama folder
path = uigetdir;
folder = dir(path);
for i=3:length(folder)
    i %supaya kelihatan runningnya dari citra 1 sampai sekian jadi ada 440 data
    namafolder = folder(i).name;
    tempatcitra = [path '\' namafolder];
    gambar = dir(tempatcitra);
    target{i-2} = namafolder;
    for j=3:length(gambar)
        namacitra = gambar(j).name;
        if strcmpi(namacitra(end-2:end),'CR2') %string compare (membandingkan string untuk mengambil gambarnya)
            bacacitra = [tempatcitra '\' namacitra];
            img = imread(bacacitra);
            citra_histeq = preprosesing(img);
            ciri_glcm = ekstraksi_ciri_glcm(citra_histeq);
            ciri_latih = [ciri_latih; ciri_glcm];
            group=[group;i-2];
        end
    end
end

save data_latih.mat ciri_latih target group