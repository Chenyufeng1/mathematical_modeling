clc,clear;
num=xlsread('F:\�ڶ���1\лСƽ\��һ��\�½��ļ���\hao','sheet1');
num=num(:,2:14);
x=[ones(10,1),num(:,1),num(:,2),num(:,5),num(:,6),num(:,10)];
y=num(:,13);
[b,bint,r,rint,stats]=regress(y,x);
b,bint,stats
