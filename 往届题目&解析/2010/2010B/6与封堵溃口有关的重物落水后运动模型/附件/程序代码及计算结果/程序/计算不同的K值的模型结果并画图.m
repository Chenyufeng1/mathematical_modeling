%�����ķ����X,Y
%type: Ͷ�ŷ�ʽ��1��ʾƽ�ţ�2��ʾ���ţ�3��ʾ����
%v0:   ˮ���ĳ�ʼ�ٶ�
%h0��  Ͷ�Ÿ߶�
%k
function calAllXY(type,v0,h0,N)
if(N==1) %��ʵ�ķ���
    V=2.56*10^-4; %���
    if(type==1)%ƽ��
        Sx=0.0032; %x������������
        Sy=0.0064; %y������������
    elseif(type==2)%����
        Sx=0.0064;
        Sy=0.0032;
    elseif(type==3)%����
        Sx=0.0032;
        Sy=0.0032;
    end;
elseif(N==2) %Сʵ�ķ���
     V=3.2*10^-5; %���
    if(type==1)%ƽ��
        Sx=0.0008; %x������������
        Sy=0.0016; %y������������
    elseif(type==2)%����
        Sx=0.0016;
        Sy=0.0008;
    elseif(type==3)%����
        Sx=0.0008;
        Sy=0.0008;
    end;
elseif(N==3) %����ķ���
    V=1.92*10^-4; %���
    if(type==1)%ƽ��
        Sx=0.0032; %x������������
        Sy=0.0048; %y������������
    elseif(type==2)%����
        Sx=0.0048;
        Sy=0.0032;
    elseif(type==3)%����
        Sx=0.0032;
        Sy=0.0032;
    end;
elseif(N==4) %С���ķ���
    V=2.4*10^-5; %���
    if(type==1)%ƽ��
        Sx=0.0008; %x������������
        Sy=0.0012; %y������������
    elseif(type==2)%����
        Sx=0.0012;
        Sy=0.0008;
    elseif(type==3)%����
        Sx=0.0008;
        Sy=0.0008;
    end;
elseif(N==5) %��ʵ�ķ䳲
    V=1.6238*10^-4; %���
    if(type==1)%ƽ��
        Sx=0.0021651; %x������������
        Sy=0.0064952; %y������������
    elseif(type==2)%����
        Sx=0.0064952;
        Sy=0.0021651;
    elseif(type==3)%����
        Sx=0.0021651;
        Sy=0.0021651;
    end;
 elseif(N==6) %Сʵ�ķ䳲
     V=1.9476*10^-5; %���
    if(type==1)%ƽ��
        Sx=0.0005196; %x������������
        Sy=0.0016238; %y������������
    elseif(type==2)%����
        Sx=0.0016238;
        Sy=0.0005196;
    elseif(type==3)%����
        Sx=0.0005196;
        Sy=0.0005196;
    end;
 elseif(N==7) %����ķ䳲
     V=1.13293*10^-4; %���
    if(type==1)%ƽ��
        Sx=0.0021651; %x������������
        Sy=0.0044957; %y������������
    elseif(type==2)%����
        Sx=0.0044957;
        Sy=0.0021651;
    elseif(type==3)%����
        Sx=0.0021651;
        Sy=0.0021651;
    end;
elseif(N==8) %С���ķ䳲
     V=1.3586*10^-5; %���
    if(type==1)%ƽ��
        Sx=0.0005196; %x������������
        Sy=0.000828; %y������������
    elseif(type==2)%����
        Sx=0.000828;
        Sy=0.0005196;
    elseif(type==3)%����
        Sx=0.0005196;
        Sy=0.0005196;
    end;
elseif(N==9) %������׶
    V=2.54558*10^-5; %���
 %   if(type==1)%ƽ��
 %       Sx=0.0032; %x������������
 %       Sy=0.0048; %y������������
 %   elseif(type==2)%����
 %      Sx=0.0048;
 %       Sy=0.0032;
 %   elseif(type==3)%����
 %       Sx=0.0032;
 %       Sy=0.0032;
 %   end;
        Sx=0.001559;
        Sy=0.001559;
elseif(N==10) %С����׶
    V=3.181981*10^-6; %���
        Sx=0.0003097;
        Sy=0.0003097;
 %   if(type==1)%ƽ��
 %       Sx=0.0032; %x������������
 %       Sy=0.0048; %y������������
 %   elseif(type==2)%����
 %       Sx=0.0048;
 %       Sy=0.0032;
 %   elseif(type==3)%����
 %       Sx=0.0032;
 %      Sy=0.0032;
 %   end;
end;

m=V*2300;
mf=V*1000;
t=linspace(0,1.0,100);

k=950;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'y');
hold on;

k=1000;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'r');
hold on;

k=1050;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'g');
hold on;

k=1100;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'b');
hold on;

k=1150;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'c');
hold on;

k=1200;
x=v0*t-(m+mf)/(k*Sx)*(log(k*Sx*v0*t+(m+mf)))+(m+mf)/(k*Sx)*log(m+mf);
A=(m-mf)/(k/v0*Sy);
B=sqrt((m*9.8-1000*V*9.8)/(k/v0*Sy));
V2=m*sqrt(2*9.8*h0)/(m+mf);
C4=(-V2-B)/(B-V2);
y=0.275+B*t-A*log(1-C4*exp(2*B*t/A))+A*log(1-C4);
plot(x,y,'m');
hold on;

x1=[1.5	2.1	3	4.1	5.8	9	11.5	13	15	16	20	22	24.5	26.3	28.2	31.6	33.2	35.4]/100;
y1=[27.5	26.1	25.2	24.6	23.2	21	19.4	17.5	16	15	12.5	11	10	8	6.6	5	3.9	2.5]/100;
x1=x1-0.015;

if(N==1) %
    if(type==1)%ƽ��
        viewTitle=sprintf('��ʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('��ʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('��ʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==2)
    if(type==1)%ƽ��
        viewTitle=sprintf('Сʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('Сʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('Сʵ�ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==3)
    if(type==1)%ƽ��
        viewTitle=sprintf('����ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('����ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('����ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==4)
     if(type==1)%ƽ��
         viewTitle=sprintf('С���ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('С���ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('С���ķ���ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==5)
    if(type==1)%ƽ��
        viewTitle=sprintf('��ʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('��ʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('��ʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==6)
    if(type==1)%ƽ��
        viewTitle=sprintf('Сʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('Сʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('Сʵ�ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==7)
    if(type==1)%ƽ��
        viewTitle=sprintf('����ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('����ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('����ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==8)
    if(type==1)%ƽ��
        viewTitle=sprintf('С���ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('С���ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('С���ķ䳲ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==9)
    if(type==1)%ƽ��
        viewTitle=sprintf('������׶ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('������׶ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('������׶ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
elseif(N==10)
    if(type==1)%ƽ��
        viewTitle=sprintf('С����׶ģ�����ݺ���ʵ���ݶԱ�ͼ--ƽ���ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==2)%����
        viewTitle=sprintf('С����׶ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    elseif(type==3)%����
        viewTitle=sprintf('С����׶ģ�����ݺ���ʵ���ݶԱ�ͼ--�����ٶ�%d�߶�%d',v0*100,h0*100);
    end;
end;

%plot(x,y);
hold on;
plot(x1,y1,'r+');

xlabel('ˮƽλ��x');
ylabel('��ֱλ��y');
legend('Cd=1.9','Cd=2.0','Cd=2.1','Cd=2.2','Cd=2.3','Cd=2.4','ʵ������');
format long g;
title(viewTitle);