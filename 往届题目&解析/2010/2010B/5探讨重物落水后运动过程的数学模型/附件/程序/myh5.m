
%��������,���ľ�ˮƽ��5cm��
cd=1;
cL=1.3;
% uu1=4;%4;
% H=0.275;
% nad=4/0.275;
% h=H+2/nad;%ʵ��߶�
% uu=uu1/sqrt(nad);%ʵ���ٶ�
% m=1500/(nad^3);
% A1=(15/23)^(2/3)*(1/(nad^2));
% A2=A1;
m=0.5888;
uu=0.34;
A1=80*40*10^(-6);
A2=80*80*10^(-6);
cc=2*m/(cd*1000*A1);
% vv=15/23*(1/(nad^3));
h=0.05;
H=0;
t=0:0.04:0.4;
vv=80*80*40*10^(-9);

sigma=1;

xxx=sigma*(uu*t-cc*log(1/cc*t+1/uu)+cc*log(1/uu));
aa=sqrt(2*1300*9.8*vv/(cL*1000*A2));
bb=-1/m*sqrt(2*cL*1300*1000*9.8*A2*vv);
A=abs((sqrt(2*9.8*(h-H))-aa)/(sqrt(2*9.8*(h-H))+aa));
yyy=sigma*(0.275-(aa*t-2*aa/bb*log(A*exp(bb*t)+1)+2*aa/bb*log(A+1)));

sigma_y=1;
yyy1=sigma_y*(0.275-(aa*t-2*aa/bb*log(abs(A*exp(bb*t)-1))+2*aa/bb*log(abs(A-1))));

%plot(t,xxx*100);
plot(t,yyy*100,'r');
% hold on;
% plot(t,yyy1*100,'k');

x34 = xlsread('34(2).xls');  % ���ļ�data.xls�ж�ȡ����
 m_data34=x34(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
 
x40 = xlsread('40(2).xls');  % ���ļ�data.xls�ж�ȡ����
m_data40=x40(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
 
x47 = xlsread('47(2).xls');  % ���ļ�data.xls�ж�ȡ����
m_data47=x47(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
 
x55 = xlsread('55(2).xls');  % ���ļ�data.xls�ж�ȡ����
m_data55=x55(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������

%ƽ��
y1=m_data34(37,1:9);
x1=m_data34(38,1:9);
 
y2=m_data40(37,1:9);
x2=m_data40(38,1:9);
 
y3=m_data47(37,1:9);
x3=m_data47(38,1:9);
 
y4=m_data55(37,1:8);
x4=m_data55(38,1:8);    

%����У��
i_x1=atan((25-x1)/120);
r_x1=asin(sin(i_x1)/1.33);
delta_x1=20*tan(r_x1);
x11=x1-delta_x1;%������ĺ�����
 
i_y1=atan((y1-20)/120);
r_y1=asin(sin(i_y1)/1.33);
delta_y1=20*tan(r_y1);
y11=y1+delta_y1;
 
%�ڶ�������У��
i_x2=atan((25-x2)/120);
r_x2=asin(sin(i_x2)/1.33);
delta_x2=20*tan(r_x2);
x22=(x2-delta_x2);%������ĺ�����
 
i_y2=atan((y2-20)/120);
r_y2=asin(sin(i_y2)/1.33);
delta_y2=20*tan(r_y2);
y22=y2+delta_y2;
 
%����������У��
i_x3=atan((25-x3)/120);
r_x3=asin(sin(i_x3)/1.33);
delta_x3=20*tan(r_x3);
x33=(x3-delta_x3);%������ĺ�����
 
i_y3=atan((y3-20)/120);
r_y3=asin(sin(i_y3)/1.33);
delta_y3=20*tan(r_y3);
y33=y3+delta_y3;
 
%������
i_x4=atan((25-x4)/120);
r_x4=asin(sin(i_x4)/1.33);
delta_x4=20*tan(r_x4);
x44=abs(x4-delta_x4);%������ĺ�����
 
i_y4=atan((y4-20)/120);
r_y4=asin(sin(i_y4)/1.33);
delta_y4=20*tan(r_y4);
y44=y4+delta_y4;

hold on;
plot(t(1:9),y11(1:9),'b');
hold on;
plot(t(1:9),y22(1:9),'k');
hold on;
plot(t(1:9),y33(1:9),'m');
hold on;
plot(t(1:8),y44(1:8),'g');


% 
% subplot(2,2,3)
% plot(t(1:8),xx3(1:8)*100,'r',t(1:8),x33(1:8)-0.8,'b','LineWidth',2);
% title('����ʱx��t�ķֲ�����ͼ','Fontsize',10);
% xlabel('ʱ��t(��λs)','Fontsize',10);
% ylabel('����ƫ����x(��λcm)','Fontsize',10);
% legend('����ֵ(u=0.47m/s)','ʵ��ֵ','Location','NorthWest');
% axis([0 0.35 0 7]);
% 
% subplot(2,2,4)
% plot(t(1:9),xx4(1:9)*100,'r',t(1:9),x44(1:9),'b','LineWidth',2);
% title('����ʱx��t�ķֲ�����ͼ','Fontsize',10);
% xlabel('ʱ��t(��λs)','Fontsize',10);
% ylabel('����ƫ����x(��λcm)','Fontsize',10);
% legend('����ֵ(u=0.55m/s)','ʵ��ֵ','Location','NorthWest');
% axis([0 0.4 0 8]);

