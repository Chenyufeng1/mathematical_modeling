%����1�����
close all;
syms k1;
syms k2;
%k1=651.3;
%k2=651.3;
 m=2300*80*80*40*10^(-9);
  c1=0.34;
  c2=m/k1*c1;
  f=80*80*40*10^(-9)*1000*9.8;
  g=-1*m*9.8;
  c3=(f-g)/k2;
  c4=0.275+m/k2*c3;
  
  syms t;
  x=0.34*t-m/k1*c1*exp(-k1/m*t)+c2;
  y=(g-f)/k2*t-m/k2*c3*exp(-k2/m*t)+c4;

  rr= xlsread('34(1).xls');  % ���ļ�data.xls�ж�ȡ����
  m_data=rr(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
  x1=m_data(38,1:11);
  y1=m_data(37,1:11);
  
 % figure;
%  plot(t,x);
 % figure;
%  plot(t,y);
  %figure;
%  plot(x1,y1,'o');
  hold on;
  plot(x1,y1);
  
 