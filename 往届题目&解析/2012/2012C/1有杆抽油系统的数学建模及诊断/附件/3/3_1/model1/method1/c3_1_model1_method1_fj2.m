clc
clear

%�������
FW=0.912;    %��ˮ��
B0=1.025;  %ԭ�����ϵ��
BW=1.3;   %ˮ�����ϵ��
n_cs=4;  %��Σ���/�֣�
D=0.044;  %�þ����ף�
rou_oil=864;  %ԭ���ܶȣ�kg/m3)
rou_water=1000;   %ˮ�ܶȣ�kg/m3)

%����ʾ������
[x,y]=textread('result2.txt','%f %f');

%ȷ�����ݵĸ���
[r,c]=size(x);
NUM=r*c;

%�����ƽ������ÿһ�������ƽ��ֵ
for i=3:(NUM-2)
    xp(i)=(x(i-2)+x(i-1)+x(i)+x(i+1)+x(i+2))/5;
    yp(i)=(y(i-2)+y(i-1)+y(i)+y(i+1)+y(i+2))/5;
end
xp(1)=(x(NUM-1)+x(NUM)+x(1)+x(2)+x(3))/5;
xp(2)=(x(NUM)+x(1)+x(2)+x(3)+x(4))/5;
xp(NUM-1)=(x(NUM-3)+x(NUM-2)+x(NUM-1)+x(NUM)+x(1))/5;
xp(NUM)=(x(NUM-2)+x(NUM-1)+x(NUM)+x(1)+x(2))/5;
yp(1)=(y(NUM-1)+y(NUM)+y(1)+y(2)+y(3))/5;
yp(2)=(y(NUM)+y(1)+y(2)+y(3)+y(4))/5;
yp(NUM-1)=(y(NUM-3)+y(NUM-2)+y(NUM-1)+y(NUM)+y(1))/5;
yp(NUM)=(y(NUM-2)+y(NUM-1)+y(NUM)+y(1)+y(2))/5;

%��������������Сֵ
xp_max=max(xp);
xp_min=min(xp);
yp_max=max(yp);
yp_min=min(yp);

%��ɢ���һ��
for i=1:NUM
    xpg(i)=(xp(i)-xp_min)/(xp_max-xp_min);
    ypg(i)=(yp(i)-yp_min)/(yp_max-yp_min);
end

%���������չ��
for i=2:NUM
    if (xpg(i)-xpg(i-1))<0
        j=i;
        break;
    end
end

for i=1:j-1;
    xpgz(i)=xpg(i);
end

for i=j:NUM;
    xpgz(i)=2.0-xpg(i);
end

for i=1:NUM;
    ypgz(i)=ypg(i);
end

%������
for i=2:(NUM-1)
    L0(i)=sqrt((ypgz(i)-ypgz(i-1))^2+(xpgz(i)-xpgz(i-1))^2);
    L1(i)=sqrt((ypgz(i+1)-ypgz(i))^2+(xpgz(i+1)-xpgz(i))^2);
    L2(i)=sqrt((ypgz(i-1)-ypgz(i+1))^2+(xpgz(i-1)-xpgz(i+1))^2);    
end

L0(1)=sqrt((ypgz(1)-ypgz(NUM))^2+(xpgz(1)-(2-xpgz(NUM)))^2);
L1(1)=sqrt((ypgz(2)-ypgz(1))^2+(xpgz(2)-xpgz(1))^2);
L2(1)=sqrt((ypgz(NUM)-ypgz(2))^2+((2-xpgz(NUM))-xpgz(2))^2);

L0(NUM)=sqrt((ypgz(NUM)-ypgz(NUM-1))^2+(xpgz(NUM)-xpgz(NUM-1))^2);
L1(NUM)=sqrt((ypgz(1)-ypgz(NUM))^2+(xpgz(1)-(2-xpgz(NUM)))^2);
L2(NUM)=sqrt((ypgz(NUM-1)-ypgz(1))^2+((2-xpgz(NUM-1))-xpgz(1))^2);

for i=1:NUM
    P(i)=(L0(i)+L1(i)+L2(i))/2;
    S_dlt(i)=sqrt(P(i)*(P(i)-L0(i))*(P(i)-L1(i))*(P(i)-L2(i)));
    K(i)=4*S_dlt(i)/(L0(i)*L1(i)*L2(i));
end

%�����ʱ仯��
for i=1:(NUM-1)
    dlt(i)=abs(K(i+1)-K(i));
end

dlt(NUM)=abs(K(NUM)-K(1));

%������㷨�����ʱ仯����ƽ��ֵ
for i=3:(NUM-2)
    dlt2(i)=(dlt(i-2)+dlt(i-1)+dlt(i)+dlt(i+1)+dlt(i+2))/5;
end

dlt2(1)=(dlt(NUM-1)+dlt(NUM)+dlt(1)+dlt(2)+dlt(3))/5;
dlt2(2)=(dlt(NUM)+dlt(1)+dlt(2)+dlt(3)+dlt(4))/5;    
dlt2(NUM-1)=(dlt(NUM-3)+dlt(NUM-2)+dlt(NUM-1)+dlt(NUM)+dlt(1))/5;    
dlt2(NUM)=(dlt(NUM-2)+dlt(NUM-1)+dlt(NUM)+dlt(1)+dlt(2))/5;


x_ma=0;
y_ma=0;
x_mb=0;
y_mb=0;
x_mc=0;
y_mc=0;
x_md=0;
y_md=0;
%�ϳ�̣��̶������յ�
%��B��
dlt2_max=0;
for i=1:NUM
    if(ypgz(i)>0.6)
        if(xpgz(i)<0.5 && xpgz(i)>0)
            if(dlt2(i)>dlt2_max)
                    x_mb=xpgz(i);
                    y_mb=ypgz(i);
                    dlt2_max=dlt2(i);
            end
        end
    end
end



%��C��
dlt2_max=0;
for i=1:NUM
    if(ypgz(i)>0.6)
        if(xpgz(i)>(x_mb+0.1) && xpgz(i)<1)
            if(dlt2(i)>dlt2_max)
                    x_mc=xpgz(i);
                    y_mc=ypgz(i);
                    dlt2_max=dlt2(i);
            end
        end
    end
end



%�³�̣��ζ������յ�
%��A��
dlt2_max=0;
for i=1:NUM
    if(ypgz(i)<0.4)
        if(xpgz(i)<2 && xpgz(i)>1.5)
            if(dlt2(i)>dlt2_max)
                    x_ma=xpgz(i);
                    y_ma=ypgz(i);
                    dlt2_max=dlt2(i);
            end
        end
    end
end



%��D��
dlt2_max=0;
for i=1:NUM
    if(ypgz(i)<0.4)
        if(xpgz(i)<(x_ma-0.1) && xpgz(i)>1)
            if(dlt2(i)>dlt2_max)
                    x_md=xpgz(i);
                    y_md=ypgz(i);
                    dlt2_max=dlt2(i);
            end
        end
    end
end


if(x_ma>1)
    x_ma=2-x_ma;
end
x_ma=x_ma*(xp_max-xp_min)+xp_min;
y_ma=y_ma*(yp_max-yp_min)+yp_min;

if(x_mb>1)
    x_mb=2-x_mb;
end
x_mb=x_mb*(xp_max-xp_min)+xp_min;
y_mb=y_mb*(yp_max-yp_min)+yp_min;

if(x_mc>1)
    x_mc=2-x_mc;
end
x_mc=x_mc*(xp_max-xp_min)+xp_min;
y_mc=y_mc*(yp_max-yp_min)+yp_min;

if(x_md>1)
    x_md=2-x_md;
end
x_md=x_md*(xp_max-xp_min)+xp_min;
y_md=y_md*(yp_max-yp_min)+yp_min;

%�ϳ�̶̹�������֮��ľ���
SRg=abs(x_mb-x_mc);   

%�³���ζ����ر�֮��ľ���
SRy=abs(x_ma-x_md); 

%����Ч���
Spe=min(SRg,SRy);

%���;�һ��Ĳ�Һ��
yita_v=1/((1-FW)*B0+FW*BW);
rou_hunhe=rou_oil*(1-FW)+rou_water*FW;   %��ˮ�����ܶ�
Qd=1440*yita_v*Spe*n_cs*pi*(D/2)^2*rou_hunhe;   %(ǧ��/��)
 
plot(x,y,'k');
hold on;
xlabel('λ��/m');
ylabel('�غ�/N');
plot(x_ma,y_ma,'k*',x_mb,y_mb,'k*',x_mc,y_mc,'k*',x_md,y_md,'k*');
hold on;


