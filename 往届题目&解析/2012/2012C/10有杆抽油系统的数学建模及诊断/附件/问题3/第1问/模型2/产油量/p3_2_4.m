clc
clear all
close all
nw=0.912;%��ˮ��
B0=1.025;%ԭ�����ϵ��
Bw=1;%ˮ���ϵ��
yv=1/((1-nw)*B0+nw*Bw);%���������ϵ��
Spe=3.3734;%��Ч���
Ap=pi*(44^2)/4*10^(-6);%���
N=4%���
nuomix=((1-nw)*0.864+nw*1)
Q=1440*yv*Spe*Ap*N*nuomix
