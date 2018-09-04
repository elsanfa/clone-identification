function ciri_glcm = ekstraksi_ciri_glcm(citra_histeq)

jml_level = 8; %tergantung dicoba-coba sampai warna kontras dllnya pas
jarak = 2; % scan kearah tetangganya 
ofset = [0 1; -1 1;-1 0;-1 -1] .* jarak;% arah nya didapat dari matlab, jeraknya terserah

glcms = graycomatrix(citra_histeq,'NumLevels',jml_level,'Offset',ofset);%rumus glcm dari matlab
stats = graycoprops(glcms,{'contrast','correlation','energy','homogeneity'}); %variable yang dilihat dan akan diamati
ciri_glcm = [stats.Contrast stats.Correlation stats.Energy stats.Homogeneity];%menghasilkan 16 ciri karena setiap offset arah tersebut menghasilkan 4 nilai variable yang diamati
