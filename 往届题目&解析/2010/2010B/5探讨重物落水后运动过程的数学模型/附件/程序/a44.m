%   %�����ǵ����ʵ����
% t=0:0.04:0.4;
% cd=1;
% s=80*40*10^(-6);
% c=0.5*cd*s*1000;
% m=0.5888;
% u=0.40;%0.34;
% c1=-1/u;
% c2=-(-m/c*log(-c1))*2;
% %xx=0.34*t-0.184*log(5.4348*t+2.9412)-0.1985+0.3970;
% sigma=1;%����ϵ��
% xx=sigma*(u*t-m/c*log(c/m*t-c1)-m/c*log(-c1)+c2);

%��������
cd=1;
cL=1;
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

sigma_y=0.3;
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

alpha1=2.765-x1(1);%�����������ֵ
alpha2=2.765-x2(1);
alpha3=2.765-x3(1);
alpha4=2.765-x4(1);
delta_avg1=alpha1/atan(25/120);%ÿ���ȵ�ƽ�����
delta_avg2=alpha2/atan(25/120);
delta_avg3=alpha3/atan(25/120);
delta_avg4=alpha4/atan(25/120);
for ii=1:20;
    if ii<(length(x1)+1);
        x1(ii)=x1(ii)+alpha1;
        alpha1=delta_avg1*atan((25-x1(ii))/120);
    end
    if ii<(length(x2)+1);
        x2(ii)=x2(ii)+alpha2;
        alpha2=delta_avg2*atan((25-x2(ii))/120);
    end
    if ii<(length(x3)+1);
        x3(ii)=x3(ii)+alpha3;
        alpha3=delta_avg3*atan((25-x3(ii))/120);
    end
    if ii<(length(x4)+1);
        x4(ii)=x4(ii)+alpha4;     
       alpha4=delta_avg4*atan((25-x4(ii))/120);
    end
end
    

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
% delta=10^(-3);
% t=0;
% for i=1:20000
%     if (0.275-(aa*t-2*aa/bb*log(A*exp(bb*t)+1)+2*aa/bb*log(A+1)))<delta
%         break;
%     else
%         t=t+0.001;
%     end
% end
% if i==20000
%     disp('����ʧ��');
% end
% xxx=uu*t-cc*log(1/cc*t+1/uu)+cc*log(1/uu);
  %
% u1=0.34;%0.34;
% u2=0.40;%0.40
% u3=0.47;%0.47;
% u4=0.55;%0.55;
% c11=-1/u1;
% c12=-1/u2;
% c13=-1/u3;
% c14=-1/u4;
% c21=-(-m/c*log(-c11))*2;%����ʱ������
% c22=-(-m/c*log(-c12))*2;%����ʱ������
% c23=-(-m/c*log(-c13))*2;%����ʱ������
% c24=-(-m/c*log(-c14))*2;%����ʱ������
% 
% %c2=0;//�Ӻ�ʱ������
% %xx=0.34*t-0.184*log(5.4348*t+2.9412)-0.1985+0.3970;
% sigma1=2;%����ϵ��
% sigma2=4.8;%3.7;%����ϵ��
% sigma3=2.7;%1.5;%����ϵ��
% sigma4=1.8;%1.2;%����ϵ��
% xx1=sigma1*(u1*t-m/c*log(c/m*t-c11)-m/c*log(-c11)+c21);%����ʱ�ı��ʽf��x��t��
% xx2=sigma2*(u2*t-m/c*log(c/m*t-c12)-m/c*log(-c12)+c22);%����ʱ�ı��ʽf��x��t��
% xx3=sigma3*(u3*t-m/c*log(c/m*t-c13)-m/c*log(-c13)+c23);%����ʱ�ı��ʽf��x��t��
% xx4=sigma4*(u4*t-m/c*log(c/m*t-c14)-m/c*log(-c14)+c24);%����ʱ�ı��ʽf��x��t��
% 
%   %
%   %plot(t(1:12),xx(1:12)*100,'r','LineWidth',2);
%   
%   
%  x34 = xlsread('34(1).xls');  % ���ļ�data.xls�ж�ȡ����
%  m_data34=x34(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
%  
% x40 = xlsread('40(1).xls');  % ���ļ�data.xls�ж�ȡ����
% m_data40=x40(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
%  
% x47 = xlsread('47(1).xls');  % ���ļ�data.xls�ж�ȡ����
% m_data47=x47(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
%  
% x55 = xlsread('55(1).xls');  % ���ļ�data.xls�ж�ȡ����
% m_data55=x55(:,:);%ȡ�ñ��г�ȥ��0�е�0��֮�����������
% 
% %ע�⣺����ʱ�����ŵ�����
% y1=m_data34(39,1:9);
% x1=m_data34(40,1:9);
%  
% y2=m_data40(39,1:6);
% x2=m_data40(40,1:6);
%  
% y3=m_data47(39,1:8);
% x3=m_data47(40,1:8);
%  
% y4=m_data55(39,1:9);
% x4=m_data55(40,1:9);
% 
% alpha1=2.765-x1(1);%�����������ֵ
% alpha2=2.765-x1(2);
% alpha3=2.765-x1(3);
% alpha4=2.765-x1(4);
% delta_avg1=alpha1/atan(25/120);%ÿ���ȵ�ƽ�����
% delta_avg2=alpha2/atan(25/120);
% delta_avg3=alpha3/atan(25/120);
% delta_avg4=alpha4/atan(25/120);
% for ii=1:20;
%     if ii<(length(x1)+1);
%         x1(ii)=x1(ii)+alpha1;
%         alpha1=delta_avg1*atan((25-x1(ii))/120);
%     end
%     if ii<(length(x2)+1);
%         x2(ii)=x2(ii)+alpha2;
%         alpha2=delta_avg2*atan((25-x2(ii))/120);
%     end
%     if ii<(length(x3)+1);
%         x3(ii)=x3(ii)+alpha3;
%         alpha3=delta_avg3*atan((25-x3(ii))/120);
%     end
%     if ii<(length(x4)+1);
%         x4(ii)=x4(ii)+alpha4;     
%        alpha4=delta_avg4*atan((25-x4(ii))/120);
%     end
% end
%     
% 
% %����У��
% i_x1=atan((25-x1)/120);
% r_x1=asin(sin(i_x1)/1.33);
% delta_x1=20*tan(r_x1);
% x11=x1-delta_x1;%������ĺ�����
%  
% i_y1=atan((y1-20)/120);
% r_y1=asin(sin(i_y1)/1.33);
% delta_y1=20*tan(r_y1);
% y11=y1+delta_y1;
%  
% %�ڶ�������У��
% i_x2=atan((25-x2)/120);
% r_x2=asin(sin(i_x2)/1.33);
% delta_x2=20*tan(r_x2);
% x22=(x2-delta_x2);%������ĺ�����
%  
% i_y2=atan((y2-20)/120);
% r_y2=asin(sin(i_y2)/1.33);
% delta_y2=20*tan(r_y2);
% y22=y2+delta_y2;
%  
% %����������У��
% i_x3=atan((25-x3)/120);
% r_x3=asin(sin(i_x3)/1.33);
% delta_x3=20*tan(r_x3);
% x33=(x3-delta_x3);%������ĺ�����
%  
% i_y3=atan((y3-20)/120);
% r_y3=asin(sin(i_y3)/1.33);
% delta_y3=20*tan(r_y3);
% y33=y3+delta_y3;
%  
% %������
% i_x4=atan((25-x4)/120);
% r_x4=asin(sin(i_x4)/1.33);
% delta_x4=20*tan(r_x4);
% x44=abs(x4-delta_x4);%������ĺ�����
%  
% i_y4=atan((y4-20)/120);
% r_y4=asin(sin(i_y4)/1.33);
% delta_y4=20*tan(r_y4);
% y44=y4+delta_y4;
% 
% %hold on;
%  
% sum_delta=0;
% for i=1:9
%     sum_delta=(xx(i)*100-x44(i))^2;
% end
% % plot(t(1:9),xx(1:9)*100,'r',t(1:9),x11(1:9),'b','LineWidth',2);
% % title('����ʱˮƽƫ������ʱ��ķֲ�����ͼ','Fontsize',10);
% % xlabel('ʱ��t(��λs)','Fontsize',10);
% % ylabel('����ƫ����x(��λcm)','Fontsize',10);
% % legend('����ֵ(u=0.40m/s)','ʵ��ֵ','Location','NorthWest');
% % axis([0 0.3 0 5]);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 



































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

