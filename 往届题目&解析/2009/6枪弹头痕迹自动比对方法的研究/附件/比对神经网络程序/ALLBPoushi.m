clc
clear
%%%����ȡ���ݡ�
t=xlsread('c.xls','sheet1','A1:A564');%��ȡ��������
c1=xlsread('c1.xls','sheet1','A1:A564');%��ȡ��������
c2=xlsread('c2.xls','sheet1','A1:A564');%��ȡ��������
c3=xlsread('c3.xls','sheet1','A1:A564');%��ȡ��������
c4=xlsread('c4.xls','sheet1','A1:A564');%��ȡ��������
t=t';
c1=c1';
c2=c2';
c3=c3';
c4=c4';
y=t;
p=1:564;


error1=c1-y;
error2=c2-y;
error3=c3-y;
error4=c4-y;

res(1)=norm(error1);
res(2)=norm(error2);
res(3)=norm(error3);
res(4)=norm(error4);
res

figure (2);
subplot(2,2,1);
plot(p,y);
hold on;
plot(p,c1,'r','LineWidth',2);
legend('�������','C1�����')
xlabel('���������C1�����Ա���');
subplot(2,2,2);
plot(p,y);
hold on;
plot(p,c2,'r','LineWidth',2);
legend('�������','C2�����')
xlabel('���������C2�����Ա���');
subplot(2,2,3);
plot(p,y);
hold on;
plot(p,c3,'r','LineWidth',2);
legend('�������','C3�����')
xlabel('���������C3�����Ա���');
subplot(2,2,4);
plot(p,y);
hold on;
plot(p,c4,'r','LineWidth',2);
legend('�������','C4�����')
xlabel('���������C4�����Ա���');

