function citra_histeq = preprosesing(citra)

citra_gray = rgb2gray(citra);
citra_gray = imresize(citra_gray,[512,512]);
%figure; imshow(citra_gray);

level = graythresh(citra_gray); 
citra_bw = not(imbinarize(citra_gray, level)); %untuk membalik warna daunnya yang tadinya hitam jadi putih
citra_bw = bwareaopen(citra_bw, 1000);%utuk menghapus area yang dikurang dari 1000 pixel -> ini tergantung mau 1000 atau berapa
citra_bw = imfill(citra_bw,'holes');%untuk mengisi area yang kosong
%figure; imshow(citra_bw);

sum_baris = sum(citra_bw, 1);
bts_kiri = find(sum_baris > 0, 1, 'first');
bts_kanan = find(sum_baris > 0, 1, 'last');

sum_kolom = sum(citra_bw, 2);
bts_atas = find(sum_kolom > 0, 1, 'first');
bts_bawah = find(sum_kolom > 0, 1, 'last');

temp = double(citra_bw) .* double(citra_gray);
citra_daun_gray = temp(bts_atas:bts_bawah,bts_kiri:bts_kanan);
%figure; imshow(uint8(citra_daun_gray));

citra_histeq = histeq(uint8(citra_daun_gray));
%figure; imshow(uint8(citra_histeq));
