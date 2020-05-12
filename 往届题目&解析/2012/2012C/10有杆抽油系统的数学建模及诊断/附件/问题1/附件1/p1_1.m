clc
clear all
close all
syms a b x
x1= 0.950; %��������
x2= 3.675; %���˳���
x3= 2.495; %��۳���
x4= 4.315; %ǰ�۳���
perfai = 7.6*2*pi/60; %ÿ����ٶ�
Lxuandian=[2.518,2.512,2.504,2.495,2.484,2.472,2.459,2.444,2.427,2.41,2.391,2.372,2.351,2.329,2.305,2.281,2.256,2.229,2.201,2.172,2.142,2.111,2.079,2.046,2.011,1.975,1.938,1.9,1.86,1.82,1.778,1.735,1.69,1.645,1.598,1.55,1.501,1.451,1.399,1.347,1.294,1.239,1.184,1.129,1.072,1.015,0.958,0.901,0.844,0.786,0.729,0.673,0.618,0.563,0.51,0.459,0.409,0.361,0.315,0.272,0.231,0.193,0.158,0.127,0.098,0.074,0.052,0.034,0.02,0.01,0.003,0,0,0.004,0.012,0.023,0.037,0.054,0.074,0.097,0.123,0.152,0.183,0.216,0.251,0.289,0.328,0.369,0.412,0.456,0.501,0.548,0.596,0.645,0.694,0.745,0.797,0.849,0.901,0.954,1.008,1.062,1.116,1.17,1.225,1.279,1.334,1.388,1.442,1.496,1.55,1.603,1.655,1.707,1.758,1.808,1.858,1.906,1.953,1.999,2.043,2.086,2.127,2.167,2.205,2.241,2.275,2.307,2.337,2.365,2.391,2.414,2.435,2.454,2.471,2.485,2.497,2.507,2.515,2.52,2.524,2.525,2.524,2.522];
A=Lxuandian(1:72);Lxuandian(1:72)=[];Lxuandian=[Lxuandian,A];
%���㹦ͼλ��
 Tchongcheng= 60/7.6; %һ�γ�̶���ʱ��
 t=linspace(0,Tchongcheng,length(Lxuandian));
 fai= perfai.*t;
 LxuandianLilun1=x4.*x1/x3*(1-cos(fai));%�򻯷���

J=sqrt((x3+x1*sin(fai)).^2+(x1+x2-x1*cos(fai)).^2);
gama=abs(acos((x3^2+J.^2-x2^2)./J/2/x3));
peta=atan((x3+x1*sin(fai))./(x1+x2-x1*cos(fai)));
theta=pi-gama-peta;
fai0=atan(x3/(x1+x2));
K=sqrt((x1+x2)^2+x3^2);
thetamin=pi-acos((x3^2+K^2-(x1+x2)^2)/2/x3/K)-fai0;
%λ��
L=x4*(theta-thetamin);
Lsimple=x4.*x1/x3*(1-cos(fai));%�򻯷���;%�򻯷���
%�ٶ�
v=x4/x3*x1*perfai*(K*sin(fai+fai0)+x3*sin(fai-theta))./J;
v=v./sin(theta+peta);
weiyi2=Lxuandian;
weiyi3=[weiyi2,weiyi2(144)];
weiyi3(1)=[];
t2=t;
t3=[t2,t2(144)];
t3(1)=[];
v2=(weiyi2-weiyi3)./(t2-t3);
v2(144)=0;
vsimple=x4.*x1/x3*perfai*sin(fai);%�򻯷���

%���ٶ�
dtheta=v/x4;
a1=x4/x3*x1*perfai^2*(K*cos(fai+fai0)+x3*cos(fai-theta))./J;
a2=(-x4/x3*x1*perfai^2*2*x3*perfai*x1*dtheta.*cos(fai-theta))./J;
a3=(x4/x3*x1*perfai^2*(-dtheta.^2.*cos(theta+peta)))./J;
a=(a1+a2+a3)./sin(theta+peta);
asimple=x4.*x1/x3*perfai^2*cos(fai);%�򻯷���

p1 =0.03943; p2 =-0.4673;p3 =1.213 ;p4 =0.0718  ;%����ٶȣ�ʹ���ٶȲ�������
 f= p1*x^3 + p2*x^2 + p3*x + p4;
v4=subs(f,t);
v5=[v4,v4(1)];
v5(1)=[];
aa=-(v4-v5)./0.0552;

%%%%%%ͼ1%%%%%%%%%%%�����������%%%%%%%%%%%
fig1=figure;
xSize = 3;%3; 
ySize = 2.25;%2.25;                            %  ͼƬ�ĳ��͸ߣ�3Ӣ�� x 2.25Ӣ��
xLeft = (6-xSize)/2;  yTop = (10-ySize)/2;  
set(fig1,'Units','inches');                                %  ��λΪӢ��
set(fig1,'position',[xLeft yTop xSize ySize]);  % ͼƬ����Ļ����ʾ��λ��
set(fig1,'PaperUnits','inches');                       %  ��λΪӢ��
set(fig1,'PaperPosition',[xLeft yTop xSize ySize]);  % ͼƬ�ڡ�ֽ�ϡ���ʾ��λ��
%%%%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%%%%
i=1:7:length(L);
plot(t(i),Lxuandian(i),'-ko')
hold on
plot(t(i),L(i),'-kv')
plot(t(i),Lsimple(i),'-k*')
h=legend('ʵ������','ģ��һ','ģ�Ͷ�',1);
set(h,'box','off');%ȥ���߿�
axis([0 8 0 5.5])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'fontsize',9);           % �������ϵ������ֺ�Ϊ9 pt
set(h,'fontsize',8);     
h1 = xlabel('ʱ��(s)'); h2 = ylabel('λ��(m)');   % ����������
set(h1,'fontsize',9);             %  X����ֺ�Ϊ9 pt
set(h2,'fontsize',9);             %  Y����ֺ�Ϊ9 pt
print('-djpeg','-r600','�����������')          % ��600 dpi�ķֱ������һ�� JPG ͼƬ
print('-dtiff','-r300','�����������')  % ��300 dpi�ķֱ������һ��tiff �� EPS ͼƬ
 saveas(gcf,'�����������.fig')% ���fig

 
 
%%%%%%ͼ2%%%%%%%%%%%�����ٶ�%%%%%%%%%%%
fig2=figure;
xSize = 3;%3; 
ySize = 2.25%2.25;                            %  ͼƬ�ĳ��͸ߣ�3Ӣ�� x 2.25Ӣ��
xLeft = (6-xSize)/2;  yTop = (10-ySize)/2;  
set(fig2,'Units','inches');                                %  ��λΪӢ��
set(fig2,'position',[xLeft yTop xSize ySize]);  % ͼƬ����Ļ����ʾ��λ��
set(fig2,'PaperUnits','inches');                       %  ��λΪӢ��
set(fig2,'PaperPosition',[xLeft yTop xSize ySize]);  % ͼƬ�ڡ�ֽ�ϡ���ʾ��λ��
%%%%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%%%%
i=1:7:length(L);
plot(t(i),v2(i),'-ko')
hold on
plot(t(i),v(i),'-kv')
plot(t(i),vsimple(i),'-k*')
axis([0 8 -2 2.5])
h=legend('ʵ������','ģ��һ','ģ�Ͷ�',1);
set(h,'box','off');%ȥ���߿�
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'fontsize',9);           % �������ϵ������ֺ�Ϊ9 pt
set(h,'fontsize',8);     
h1 = xlabel('ʱ��(s)'); h2 = ylabel('�ٶ�(m/s)');   % ����������
set(h1,'fontsize',9);             %  X����ֺ�Ϊ9 pt
set(h2,'fontsize',9);             %  Y����ֺ�Ϊ9 pt
print('-djpeg','-r600','�����ٶ�')          % ��600 dpi�ķֱ������һ�� JPG ͼƬ
print('-dtiff','-r300','�����ٶ�')  % ��300 dpi�ķֱ������һ��tiff �� EPS ͼƬ
saveas(gcf,'�����ٶ�.fig')% ���fig

%%%%%%ͼ3%%%%%%%%%%%���ۼ��ٶ�%%%%%%%%%%%
fig3=figure;
xSize = 3;%3; 
ySize = 2.25;%2.25;                            %  ͼƬ�ĳ��͸ߣ�3Ӣ�� x 2.25Ӣ��
xLeft = (6-xSize)/2;  yTop = (10-ySize)/2;  
set(fig3,'Units','inches');                                %  ��λΪӢ��
set(fig3,'position',[xLeft yTop xSize ySize]);  % ͼƬ����Ļ����ʾ��λ��
set(fig3,'PaperUnits','inches');                       %  ��λΪӢ��
set(fig3,'PaperPosition',[xLeft yTop xSize ySize]);  % ͼƬ�ڡ�ֽ�ϡ���ʾ��λ��
%%%%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%%%%
i=1:7:length(L);
plot(t(i),aa(i),'-ko')
hold on
plot(t(i),a(i),'-kV')
plot(t(i),asimple(i),'-k*')
axis([0 8 -1.5 2.4])
h=legend('ʵ������','ģ��һ','ģ�Ͷ�',2);
set(h,'box','off');%ȥ���߿�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gca,'fontsize',9);           % �������ϵ������ֺ�Ϊ9 pt
set(h,'fontsize',8);      
h1 = xlabel('ʱ��(s)'); h2 = ylabel('���ٶ�(m/s^2)');   % ����������
set(h1,'fontsize',9);             %  X����ֺ�Ϊ9 pt
set(h2,'fontsize',9);             %  Y����ֺ�Ϊ9 pt
print('-djpeg','-r600','���ۼ��ٶ�')          % ��600 dpi�ķֱ������һ��JPG ͼƬ
print('-dtiff','-r300','���ۼ��ٶ�')  % ��300 dpi�ķֱ������һ����Ϊtiff �� EPS ͼƬ
saveas(gcf,'���ۼ��ٶ�.fig')% ���fig
