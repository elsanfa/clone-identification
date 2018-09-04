 clear
close all
clc

load data_latih

k = 1;

Mdl = fitcknn(ciri_latih, group, 'NumNeighbors', k, 'Distance', 'minkowski','Standardize',1);

save data_hasil_training Mdl target