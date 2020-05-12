clc
clear

%�������
FW=0.98;    %��ˮ��
B0=1.025;  %ԭ�����ϵ��
BW=1.3;   %ˮ�����ϵ��
n_cs=7.6;  %��Σ���/�֣�
D=0.07;  %�þ����ף�
S=3.2;   %�����̣��ף�
rou_oil=864;  %ԭ���ܶȣ�kg/m3)
rou_water=1000;   %ˮ�ܶȣ�kg/m3)
g=9.8;    %�������ٶ�
L=792.5;  %���͸��ܳ���
DL=0.022;   %���͸�ֱ��
E=2.1*10^11;   %�ֵĵ���ģ��


%������ʾ��ͼ���
fp=pi*(D/2)^2;   %����������
rou_hunhe=rou_oil*(1-FW)+rou_water*FW;   %��ˮ�����ܶ�
WL=fp*L*rou_hunhe*g;  %���ͻ��ϡ��³���и����͹���֮��ת�Ƶ��غ�
fr=pi*(DL/2)^2;  %���͸˺�����
lamda=WL/E*(L/fr); %���س����ʧ
Sp=S-lamda;    %������̳���   
Area_LL=0.5*WL*Sp;

%���۲���
yita_v=1/((1-FW)*B0+FW*BW);    %���������ϵ�� (m3/m3)
Q_LL=1440*fp*Sp*n_cs*yita_v*rou_hunhe;

%����ʾ������
[s,f]=textread('result1.txt','%f %f');

%ȷ�����ݵĸ���
[r,c]=size(s);
NUM=r*c;

%�����ƽ������ÿһ�������ƽ��ֵ
for i=3:(NUM-2)
    sp(i)=(s(i-2)+s(i-1)+s(i)+s(i+1)+s(i+2))/5;
    fp(i)=(f(i-2)+f(i-1)+f(i)+f(i+1)+f(i+2))/5;
end
sp(1)=(s(NUM-1)+s(NUM)+s(1)+s(2)+s(3))/5;
sp(2)=(s(NUM)+s(1)+s(2)+s(3)+s(4))/5;
sp(NUM-1)=(s(NUM-3)+s(NUM-2)+s(NUM-1)+s(NUM)+s(1))/5;
sp(NUM)=(s(NUM-2)+s(NUM-1)+s(NUM)+s(1)+s(2))/5;
fp(1)=(f(NUM-1)+f(NUM)+f(1)+f(2)+f(3))/5;
fp(2)=(f(NUM)+f(1)+f(2)+f(3)+f(4))/5;
fp(NUM-1)=(f(NUM-3)+f(NUM-2)+f(NUM-1)+f(NUM)+f(1))/5;
fp(NUM)=(f(NUM-2)+f(NUM-1)+f(NUM)+f(1)+f(2))/5;

%���������չ��
for i=2:NUM
    if (sp(i)-sp(i-1))<0
        j=i;
        break;
    end
end

%�ϳ��
for i=1:j-1;
    s_s(i)=sp(i);
    f_s(i)=fp(i)*1000;
end

%�³��
for i=j:NUM;
    s_x(NUM-i+1)=sp(i);
    f_x(NUM-i+1)=fp(i)*1000;
end

n_s=j-1;
n_x=NUM-j+1;
%��֤�³�����ϳ�̶˵���ͬ
for i=n_x:-1:1
    s_x(i+1)=s_x(i);
    f_x(i+1)=f_x(i);
end
s_x(1)=s_s(1);
f_x(1)=f_s(1);
s_x(n_x+2)=s_s(n_s);
f_x(n_x+2)=f_s(n_s);
n_x=n_x+2;


%���ʾ��ͼ�����
s_b=s_s(1);
s_e=s_s(n_s);
n_ds=200;       %��ͼ�λ�Ϊ200��������
ds=(s_e-s_b)/n_ds;    %dsΪÿ�ݵĳ���
Area_bgt=0;
for i=1:n_ds
    s_ds=s_b+(i-0.5)*ds;
    
    %���ϳ��λ��
    for j=1:n_s
        if s_ds<s_s(j)
            k=j;
            break;
        end
    end
    fa_s=(s_ds-s_s(k-1))/(s_s(k)-s_s(k-1))*(f_s(k)-f_s(k-1))+f_s(k-1);
    
    %���³��λ��
    for j=1:n_x
        if s_ds<s_x(j)
            k=j;
            break;
        end
    end
    fa_x=(s_ds-s_x(k-1))/(s_x(k)-s_x(k-1))*(f_x(k)-f_x(k-1))+f_x(k-1);
    
    Area_bgt=(fa_s-fa_x)*ds;
end

%ʵ�ʲ���
Q_SJ=Area_bgt/Area_LL*Q_LL;
