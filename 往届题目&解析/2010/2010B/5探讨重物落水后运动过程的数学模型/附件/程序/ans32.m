%��������Ͷ�Ÿ߶Ⱥ�ˮ���ٶ���ͬ����ͬ��Ͷ�ŷ�ʽ
cd=1;
cL=1;

%�ۺϱ��ʽ
m=0.5888;
uu1=0.34;
uu2=0.40;
uu3=0.47;
uu4=0.55;

A11=80*40*10^(-6);%ƽ��ʱ��ˮ�ٴ�ֱ����
A21=80*80*10^(-6);%ƽ��ʱ��ˮ��ƽ�е���
cc1=2*m/(cd*1000*A11);

A12=80*40*10^(-6);%����ʱ��ˮ�ٴ�ֱ����
A22=80*40*10^(-6);%����ʱ��ˮ��ƽ�е���
cc2=2*m/(cd*1000*A12);

A13=80*80*10^(-6);%����ʱ��ˮ�ٴ�ֱ����
A23=80*40*10^(-6);%����ʱ��ˮ��ƽ�е���
cc3=2*m/(cd*1000*A13);

h=0;
H=0;

t=0:0.04:0.6;
vv=80*80*40*10^(-9);

sigma11=3;%uu1ʱx���������ֵ
sigma12=1;%uu1ʱy���������ֵ

sigma21=2.8;%uu2ʱx���������ֵ
sigma22=1;%uu2ʱy���������ֵ

sigma31=4;%uu3ʱx���������ֵ
sigma32=1;%uu3y���������ֵ


%ƽ��ʱ�ļ��㹫ʽ
px1=sigma11*(uu1*t-cc1*log(1/cc1*t+1/uu1)+cc1*log(1/uu1));%uu1ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A21));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A21*vv);
A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
py1=sigma12*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

%����ʱ�ļ��㹫ʽ
sx1=sigma21*(uu1*t-cc2*log(1/cc2*t+1/uu1)+cc2*log(1/uu1));%uu1ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A22));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A22*vv);
A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
sy1=sigma22*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ

%����ʱ�ļ��㹫ʽ
lx1=sigma31*(uu1*t-cc3*log(1/cc3*t+1/uu1)+cc3*log(1/uu1));%uu1ʱxֵ
aa1=sqrt(2*1300*9.8*vv/(cL*1000*A23));
bb1=-1/m*sqrt(2*cL*1300*1000*9.8*A23*vv);
A1=(abs((sqrt(2*9.8*(h-H))-aa1)/(sqrt(2*9.8*(h-H))+aa1)));
ly1=sigma32*(0.275-(aa1*t-2*aa1/bb1*log(A1*exp(bb1*t)+1)+2*aa1/bb1*log(A1+1)));%ȡ��ʱ
  
%�����ھ�ˮƽ��
x34 = xlsread('34(1).xls');  % ���ļ�data.xls�ж�ȡ����
m_data34=x34(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������


% %ƽ��,������ˮƽ���
py=m_data34(37,1:11);
px=m_data34(38,1:11);

% ����,������ˮƽ�洦

sy=m_data34(39,1:9);
sx=m_data34(40,1:9);

% ����,������ˮƽ��
ly=m_data34(41,1:9);
lx=m_data34(42,1:9);

%������ȡֵ��ƫ����
alpha1=2.765-px(1);%�����������ֵ
alpha2=2.765-lx(1);
alpha3=2.765-sx(1);

delta_avg1=alpha1/atan(25/120);%ÿ���ȵ�ƽ�����
delta_avg2=alpha2/atan(25/120);
delta_avg3=alpha3/atan(25/120);
for ii=1:20;
    if ii<(length(px)+1);
        px(ii)=px(ii)+alpha1;
        alpha1=delta_avg1*atan((25-px(ii))/120);
    end
    if ii<(length(lx)+1);
        lx(ii)=lx(ii)+alpha2;
        alpha2=delta_avg2*atan((25-lx(ii))/120);
    end
    if ii<(length(sx)+1);
        sx(ii)=sx(ii)+alpha3;
        alpha3=delta_avg3*atan((25-sx(ii))/120);
    end
end

%����У��,ƽ��
i_x1=atan((25-px)/120);
r_x1=asin(sin(i_x1)/1.33);
delta_x1=20*tan(r_x1);
px11=abs(px-delta_x1);%������ĺ�����
 
i_y1=atan((py-20)/120);
r_y1=asin(sin(i_y1)/1.33);
delta_y1=20*tan(r_y1);
py11=py+delta_y1;
 
%�ڶ�������У��,����
i_x2=atan((25-sx)/120);
r_x2=asin(sin(i_x2)/1.33);
delta_x2=20*tan(r_x2);
sx11=abs(sx-delta_x2);%������ĺ�����
 
i_y2=atan((sy-20)/120);
r_y2=asin(sin(i_y2)/1.33);
delta_y2=20*tan(r_y2);
sy11=sy+delta_y2;
 
%����������У��,����
i_x3=atan((25-lx)/120);
r_x3=asin(sin(i_x3)/1.33);
delta_x3=20*tan(r_x3);
lx11=abs(lx-delta_x3);%������ĺ�����
 
i_y3=atan((ly-20)/120);
r_y3=asin(sin(i_y3)/1.33);
delta_y3=20*tan(r_y3);
ly11=ly+delta_y3;
 
    
%�������
sum1=0;
sum2=0;
sum3=0;
sum4=0;
for i=1:13
    if i<(length(px)+1)
      sum1=sum1+(px(i)-100*px1(i))^2+(py(i)-100*py1(i))^2;
    end
    if i<(length(sx)+1)
       sum2=sum2+(sx(i)-100*sx1(i))^2+(sy(i)-100*sy1(i))^2;
    end
    if i<(length(lx)+1)
       sum3=sum3+(lx(i)-100*lx1(i))^2+(ly(i)-100*ly1(i))^2;
    end
end
sum1=sqrt(sum1/length(px));
sum2=sqrt(sum2/length(sx));
sum3=sqrt(sum3/length(lx));

%����С���˷�����������
p1=polyfit(px11,py11,2);
p2=polyfit(sx11,sy11,2);
p3=polyfit(lx11,ly11,2);
for jj=1:13
    if jj<=length(px11)
       z1(jj)=polyval(p1,px11(jj));
    end
    if jj<=length(sx11)
        z2(jj)=polyval(p2,sx11(jj));
    end
    if jj<=length(lx11)
        z3(jj)=polyval(p3,lx11(jj));
    end
    
end

%plot(x11,z(1:length(x11)),'o',x11,z(1:length(x11)),xi,z,':');
 
%subplot(2,2,1);
%plot(px1*100,py1*100,'r',sx1*100,sy1*100,'b',lx1*100,ly1*100,'m','LineWidth',1.5);
%legend('ƽ��','����','����');
subplot(1,2,1);
plot(px1*100,py1*100,'r',px11(1:length(px)),py11(1:length(py)),'gd:',px11,z1(1:length(px11)),'b','LineWidth',1.5);
title('ƽ�ŷ�y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ����������','��С���˷�����');
%sx11(1:length(sx)),sy11(1:length(sy)),'bh:',lx11(1:length(lx)),ly11(1:length(ly)),'m*:','LineWidth',1.5);
axis([0 10 0 30]);

subplot(1,2,2);
plot(sx1*100,sy1*100,'r',sx11(1:length(sx)),py11(1:length(sy)),'gd:',sx11,z1(1:length(sx11)),'b','LineWidth',1.5);
title('����y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ����������','��С���˷�����');
%sx11(1:length(sx)),sy11(1:length(sy)),'bh:',lx11(1:length(lx)),ly11(1:length(ly)),'m*:','LineWidth',1.5);
axis([0 6 0 30]);
figure;
plot(lx1*100,ly1*100,'r',lx11(1:length(lx)),py11(1:length(ly)),'gd:',lx11,z1(1:length(lx11)),'b','LineWidth',1.5);
title('���ŷ�y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
legend('���۽��','ʵ����������','��С���˷�����');
%sx11(1:length(sx)),sy11(1:length(sy)),'bh:',lx11(1:length(lx)),ly11(1:length(ly)),'m*:','LineWidth',1.5);
axis([0 12 0 30]);

% title('����y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
% xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
% ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
% legend('���۽��','u=0.34m/sʵ����','��С���˷�����');
% axis([0 1.2 0 30]);
% % hold on;
% % plot(x11,y11,'r*',x11,z(1:length(x11)),'b');
%  
% subplot(2,2,2);
% plot(xxx2*100,yyy2*100,'r',x22(1:length(x22)),y22(1:length(y22)),'gd:',x22,z2(1:length(x22)),'b','LineWidth',1.5);
% title('����y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
% xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
% ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
% legend('���۽��','u=0.40m/sʵ����','��С���˷�����');
% axis([0 3 0 30]);
% 
% subplot(2,2,3)
% plot(xxx3*100,yyy3*100,'r',x33(1:length(x33)),y33(1:length(x33)),'gd:',x33,z3(1:length(x33)),'b','LineWidth',1.5);
% title('����y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
% xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
% ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
% legend('���۽��','u=0.47m/sʵ����','��С���˷�����');
% axis([0 3.5 0 30]);
% 
% subplot(2,2,4);
% plot(xxx4*100,yyy4*100,'r',x44(1:length(x44)),y44(1:length(x44)),'gd:',x44,z4(1:length(x44)),'b','LineWidth',1.5);
% title('����y��x�ֲ�����ͼ��h-H=0��','Fontsize',10);
% xlabel('ˮƽƫ����x(��λcm)','Fontsize',10);
% ylabel('��ֱƫ����y(��λcm)','Fontsize',10);
% legend('���۽��','u=0.55m/sʵ����','��С���˷�����');
% axis([0 3 0 30]);

% plot(t,100*(0.4-yy1),'r',t(1:11),y11(1:11),'b',t(1:8),y22(1:8),'g',t(1:12),y33(1:12),'k',t(1:12),y44(1:12),'c','LineWidth',1.5);
% title('��ֱƫ������ʱ��ķֲ�����ͼ','Fontsize',10);
% xlabel('ʱ��t(��λs)','Fontsize',10);
% ylabel('��ֱƫ����y(��λm)','Fontsize',10);
% legend('���۽��','u=0.34m/s','u=0.40m/s','u=0.47m/s','u=0.55m/s');

wucha=[sum1 sum2 sum3 sum4];
