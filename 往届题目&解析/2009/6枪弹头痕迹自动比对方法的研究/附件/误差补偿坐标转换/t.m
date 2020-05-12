clear;
load E:\x\77T2-1812492\77T2-1812492\c4.dat;      %��ԭʼ����
x0=[c4]';
n=1;
while n<=425821
x=x0(1,n:n+563);                                 %�����Ŀռ���������
y=x0(2,n:n+563);
z=x0(3,n:n+563);
z0=z(1)-3.95;                                    %�ο�Բ�ĵľ��Կռ�����
r1=sqrt(x.^2+(-z0+z).^2);                        %���������ڲο�Բ�ĵİ뾶
subplot(1,2,1);
plot(z,x);
axis([min(z),max(z),min(x),max(x)]);
title('ʵ�ⵯͷ����C1�ۼ�����');
xlabel('z��/����');
ylabel('x��/����');
subplot(1,2,2);
sin=x./r1;                                     %���������ڲο�Բ�ĵ�����
cos=(-z0+z)./r1;                               %���������ڲο�Բ�ĵ�����
rl1=sum(r1)/length(x);                         %��С����Բ�İ뾶
u=sum(r1.*sin)*(2)/length(x);                  %��С����Բ�Ŀռ�����   
w=sum(r1.*cos)*(2)/length(x)+z0;
x1=(r1.*sin+u);                                %������������С����ԲԲ�ĵĿռ�����
z1=(r1.*cos+w);
x00=[x1;y;z1];
fid=fopen('c4.txt','at');
fprintf(fid,'%f\t%f\t%f\n',x00);
fclose(fid);
n=n+564;
end
disp('���н���');
plot(z1,x1);
axis([min(z1),max(z1),min(x1),max(x1)]);
title('���������C1�ۼ�����');
xlabel('z��/����');
ylabel('x��/����');