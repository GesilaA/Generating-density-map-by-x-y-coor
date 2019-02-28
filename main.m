clear;
close all;
clc;
load wData1;    % water: 第一组数据
load wData2;    % 30mM：第二组数据

denfig1 = showDensityImg(wData1(:,1), wData1(:,2));
denfig2 = showDensityImg(wData2(:,1), wData2(:,2));
figure;
subplot(1,2,1), plot(wData1(:,1), wData1(:,2), '.');
axis square;
subplot(1,2,2), surf(denfig1);
colormap('jet');
shading interp;
axis square;
figure;
subplot(1,2,1), plot(wData2(:,1), wData2(:,2), '.');
axis square;
subplot(1,2,2), surf(denfig2);
colormap('jet');
shading interp;
axis square;