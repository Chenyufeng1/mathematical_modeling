%��������Ͷ�ŷ�ʽ��������ͬ���߶Ȳ�ͬ
cd=2.1;%��ҷ��ϵ��
cL=1;%�Ͼ���ϵ��

%�ۺϱ��ʽ
m=0.5888;%����

%ˮ���ٶȣ���λm/s
uu1=0.34;
uu2=0.40;
uu3=0.47;
uu4=0.55;

%ͶӰ���
A11=80*40*10^(-6);%ƽ��ʱ��ˮ�ٴ�ֱ����
A21=80*80*10^(-6);%ƽ��ʱ��ˮ��ƽ�е���
cc1=2*m/(cd*1000*A11);

A12=80*40*10^(-6);%����ʱ��ˮ�ٴ�ֱ����
A22=80*40*10^(-6);%����ʱ��ˮ��ƽ�е���
cc2=2*m/(cd*1000*A12);

A13=80*80*10^(-6);%����ʱ��ˮ�ٴ�ֱ����
A23=80*40*10^(-6);%����ʱ��ˮ��ƽ�е���
cc3=2*m/(cd*1000*A13);

%���ĸ߶�
h1=0;%
h2=0.05;
h3=0.12;
H=0;

t=0:0.04:0.6;
vv=80*80*40*10^(-9);%��������

sigma11=2.5;%uu1ʱx���������ֵ
sigma21=1;%uu1ʱy���������ֵ

sigma12=3.5;%uu2ʱx���������ֵ
sigma22=1;%uu2ʱy���������ֵ

sigma13=1.5;%uu3ʱx���������ֵ
sigma23=1;%uu3y���������ֵ

sigma14=2;%uu4ʱx���������ֵ
sigma24=1;%uu4y���������ֵ

%ƽ��ʱ�ļ��㹫ʽ
%�߶�h=0
px1=sigma11*(uu1*t-cc1*log(1/cc1*t+1/uu1)+cc1*log(1/uu1));%uu1ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A21));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A21*vv);
A1=(abs((sqrt(2*9.8*(h1-H))-aa1)/(sqrt(2*9.8*(h1-H))+aa1)));
py1=sigma21*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

%�߶�h=0.05
px2=sigma12*(uu2*t-cc1*log(1/cc1*t+1/uu2)+cc1*log(1/uu2));%uu2ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A21));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A21*vv);
A1=(abs((sqrt(2*9.8*(h2-H))-aa1)/(sqrt(2*9.8*(h2-H))+aa1)));
py2=sigma22*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

%�߶�h=0.12
px3=sigma13*(uu3*t-cc1*log(1/cc1*t+1/uu3)+cc1*log(1/uu3));%uu3ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A21));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A21*vv);
A1=(abs((sqrt(2*9.8*(h3-H))-aa1)/(sqrt(2*9.8*(h3-H))+aa1)));
py3=sigma23*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ



% %����ʱ�ļ��㹫ʽ
% xxx1=sigma11*(uu1*t-cc2*log(1/cc2*t+1/uu1)+cc2*log(1/uu1));%uu1ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy1=sigma21*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% %yyy1=sigma2*(0.275-(aa*t-2*aa/bb*log(abs(A*exp(bb*t)-1))+2*aa/bb*log(abs(A
% %-1))));%ȡ��ֵʱ
% 
% xxx2=sigma12*(uu2*t-cc2*log(1/cc2*t+1/uu2)+cc2*log(1/uu2));%uu2ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy2=sigma22*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx3=sigma13*(uu3*t-cc2*log(1/cc2*t+1/uu3)+cc2*log(1/uu3));%uu3ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy3=sigma23*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx4=sigma14*(uu4*t-cc2*log(1/cc2*t+1/uu4)+cc2*log(1/uu4));%uu4ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy4=sigma24*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% %����ʱ�ļ��㹫ʽ
% xxx1=sigma11*(uu1*t-cc2*log(1/cc2*t+1/uu1)+cc2*log(1/uu1));%uu1ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy1=sigma21*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% %yyy1=sigma2*(0.275-(aa*t-2*aa/bb*log(abs(A*exp(bb*t)-1))+2*aa/bb*log(abs(A
% %-1))));%ȡ��ֵʱ
% 
% xxx2=sigma12*(uu2*t-cc2*log(1/cc2*t+1/uu2)+cc2*log(1/uu2));%uu2ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy2=sigma22*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx3=sigma13*(uu3*t-cc2*log(1/cc2*t+1/uu3)+cc2*log(1/uu3));%uu3ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy3=sigma23*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx4=sigma14*(uu4*t-cc2*log(1/cc2*t+1/uu4)+cc2*log(1/uu4));%uu4ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy4=sigma24*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

% %����ʱ�ļ��㹫ʽ
% xxx1=sigma11*(uu1*t-cc3*log(1/cc3*t+1/uu1)+cc3*log(1/uu1));%uu1ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A23));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy1=sigma21*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% %yyy1=sigma2*(0.275-(aa*t-2*aa/bb*log(abs(A*exp(bb*t)-1))+2*aa/bb*log(abs(A
% %-1))));%ȡ��ֵʱ
% 
% xxx2=sigma12*(uu2*t-cc3*log(1/cc3*t+1/uu2)+cc3*log(1/uu2));%uu2ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A23));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy2=sigma22*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx3=sigma13*(uu3*t-cc3*log(1/cc3*t+1/uu3)+cc3*log(1/uu3));%uu3ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A23));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy3=sigma23*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
% 
% xxx4=sigma14*(uu4*t-cc3*log(1/cc3*t+1/uu4)+cc3*log(1/uu4));%uu4ʱxֵ
% aa1=sqrt(2*1300*9.8*vv/(cL*1000*A23));
% bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
% A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
% yyy4=sigma24*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

% xxx2=sigma12*(uu*t-cc2*log(1/cc2*t+1/uu)+cc2*log(1/uu));%����ʱxֵ
% aa2=sqrt(2*1300*9.8*vv/(cL*1000*A22));
% bb2=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
% A2=(abs((sqrt(2*9.8*(h-H))-aa2)/(sqrt(2*9.8*(h-H))+aa2)));
% yyy2=sigma2*(0.275-(aa2*t-2*aa2/bb2*log(A2*exp(bb2*t)+1)+2*aa2/bb2*log(A2+1)));%ȡ��ʱ
% 
% xxx3=sigma13*(uu*t-cc3*log(1/cc3*t+1/uu)+cc3*log(1/uu));%����ʱxֵ
% aa3=sqrt(2*1300*9.8*vv/(cL*1000*A23));
% bb3=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
% A3=(abs((sqrt(2*9.8*(h-H))-aa3)/(sqrt(2*9.8*(h-H))+aa3)));
% yyy3=sigma2*(0.275-(aa3*t-2*aa3/bb3*log(A3*exp(bb3*t)+1)+2*aa3/bb3*log(A3+1)));%ȡ��ʱ


% cd=1;
% s=80*40*10^(-6);
% c=0.5*cd*s*1000;
% m=0.5888;%����
% u=0.34;
% c1=-1/u;
% c2=-(-m/c*log(-c1))*2;
% %xx=0.34*t-0.184*log(5.4348*t+2.9412)-0.1985+0.3970;
% sigma=4.5;%4.5;%����ϵ��
% xx=sigma*(u*t-m/c*log(c/m*t-c1)-m/c*log(-c1)+c2);
%   figure;
%  plot(t,xx*100,'r');
  
%   %������ֱ�����ϵ��˶�
%   f=2.5088;%����
%   d1=9.8-f/m;
%   cL=1;
%   sy=80*80*10^(-6);%�����
%   d2=0.5*cL*sy*1000;
%   d3=0;
%   y0=0;%��ʼ������
%   d4=y0;
%   d5=y0;
%   a=sqrt(m*d1/d2);
%   b=-2*sqrt(d1*d2/m);
%   yy1=a*t-2*a/b*log(1+exp(b*t))+d5;%ȡ����ʱ�����ǵ���������ʽ
%   yy2=a*t-2*a/b*log(1-exp(b*t))+d4;%ȡ����ʱ�����ǵ���������ʽ
%   plot(t,100*(0.4-yy1),'r');%ȡ����ʱ
%   hold on;
%plot(t,100*(y0-yy2),'k');%ȡ����ʱ
  
%   %������12cm
px33 = xlsread('34(3).xls');  % ���ļ�data.xls�ж�ȡ����
m_data343=px33(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������

% %�����ھ�ˮƽ��5cm��
px22 = xlsread('34(2).xls');  % ���ļ�data.xls�ж�ȡ����
m_data342=px22(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������

%�����ھ�ˮƽ��
px11 = xlsread('34(1).xls');  % ���ļ�data.xls�ж�ȡ����
m_data341=px11(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
 

% %ƽ��,������ˮƽ���
y1=m_data341(37,1:11);
x1=m_data341(38,1:11);

% %ƽ�ţ������ھ�5cm��
y2=m_data342(37,1:9);
x2=m_data342(38,1:9);

%ƽ��,������12cm
y3=m_data343(37,1:9);
x3=m_data343(38,1:9);


%������ȡֵ��ƫ����
alpha1=2.765-x1(1);%�����������ֵ
alpha2=2.765-x2(1);
alpha3=2.765-x3(1);
delta_avg1=alpha1/atan(25/120);%ÿ���ȵ�ƽ�����
delta_avg2=alpha2/atan(25/120);
delta_avg3=alpha3/atan(25/120);
for ii=1:20;
    if ii<(length(x1)+1);
        x1(ii)=x1(ii)+alpha1;
        alpha1=delta_avg1*atan((25-x1(ii))/120);
    end
    if ii<(length(x2)+1);
        x2(ii)=x2(ii)+alpha2;
        disp(length(x2));
        alpha2=delta_avg2*atan((25-x2(ii))/120);
    end
    if ii<(length(x3)+1);
        x3(ii)=x3(ii)+alpha3;
        alpha3=delta_avg3*atan((25-x3(ii))/120);
    end
end

%����У��
i_x1=atan((25-x1)/120);
r_x1=asin(sin(i_x1)/1.33);
delta_x1=20*tan(r_x1);
x11=abs(x1-delta_x1);%������ĺ�����
 
i_y1=atan((y1-20)/120);
r_y1=asin(sin(i_y1)/1.33);
delta_y1=20*tan(r_y1);
y11=y1+delta_y1;
 
%�ڶ�������У��
i_x2=atan((25-x2)/120);
r_x2=asin(sin(i_x2)/1.33);
delta_x2=20*tan(r_x2);
x22=abs(x2-delta_x2);%������ĺ�����
 
i_y2=atan((y2-20)/120);
r_y2=asin(sin(i_y2)/1.33);
delta_y2=20*tan(r_y2);
y22=y2+delta_y2;
 
%����������У��
i_x3=atan((25-x3)/120);
r_x3=asin(sin(i_x3)/1.33);
delta_x3=20*tan(r_x3);
x33=abs(x3-delta_x3);%������ĺ�����
 
i_y3=atan((y3-20)/120);
r_y3=asin(sin(i_y3)/1.33);
delta_y3=20*tan(r_y3);
y33=y3+delta_y3;
    
% %�������
% sum1=0;
% sum2=0;
% sum3=0;
% for i=1:13
%     if i<(length(x11)+1)
%       sum1=sum1+(x11(i)-100*xxx1(i))^2+(y11(i)-100*yyy1(i))^2;
%     end
%     if i<(length(x22)+1)
%        sum2=sum2+(x22(i)-100*xxx2(i))^2+(y22(i)-100*yyy2(i))^2;
%     end
%     if i<(length(x33)+1)
%        sum3=sum3+(x33(i)-100*xxx3(i))^2+(y33(i)-100*yyy3(i))^2;
%     end
%     if i<(length(x44)+1)
%        sum4=sum4+(x44(i)-100*xxx3(i))^2+(y44(i)-100*yyy4(i))^2;
%     end
% end
% sum1=sqrt(sum1/length(x11));
% sum2=sqrt(sum2/length(x22));
% sum3=sqrt(sum3/length(x33));
% sum4=sqrt(sum4/length(x44));

%����С���˷�����������
p1=polyfit(x11,y11,2);
p2=polyfit(x22(1:length(y22)),y22,2);
p3=polyfit(x33,y33,2);


for jj=1:13
    if jj<=length(x11)
       z1(jj)=polyval(p1,x11(jj));
    end
    if jj<=length(x22)
        z2(jj)=polyval(p2,x22(jj));
    end
    if jj<=length(x33)
        z3(jj)=polyval(p3,x33(jj));
    end
    
end
 
subplot(1,2,1);
plot(px1*100,py1*100,'r',x11(1:length(x11)),y11(1:length(y11)),'gd:',x11,z1(1:length(x11)),'b','LineWidth',1.5);
title('���ľ�ˮ��߶�Ϊ��ʱ��y��x�ֲ�����ͼ','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ������','��С���˷�����');
axis([0 10 0 30]);
% hold on;
% plot(x11,y11,'r*',x11,z(1:length(x11)),'b');
 
subplot(1,2,2);
plot(px2*100,py2*100,'r',x22(1:length(x22)),y22(1:length(y22)),'gd:',x22,z2(1:length(x22)),'b','LineWidth',1.5);
title('���ľ�ˮ��߶�Ϊ5cmʱ��y��x�ֲ�����ͼ','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ������','��С���˷�����');
axis([0 6 0 30]);

figure;
plot(px3*100,py3*100,'r',x33(1:length(x33)),y33(1:length(x33)),'gd:',x33,z3(1:length(x33)),'b','LineWidth',1.5);
title('���ľ�ˮ��߶�Ϊ12cmʱ��y��x�ֲ�����ͼ','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ������','��С���˷�����');
axis([0 6 0 30]);


wucha=[sum1 sum2 sum3 sum4];
