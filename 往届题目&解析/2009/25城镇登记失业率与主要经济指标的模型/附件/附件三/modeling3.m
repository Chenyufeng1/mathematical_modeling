clc,clear;
shuju=xlsread('F:\�ڶ���1\лСƽ\��һ��\�½��ļ���\������','sheet1');
data=[shuju(:,6),shuju(:,4),shuju(:,5),shuju(:,3),shuju(:,2)];
unemploy=shuju(:,7);
x=data\unemploy;
