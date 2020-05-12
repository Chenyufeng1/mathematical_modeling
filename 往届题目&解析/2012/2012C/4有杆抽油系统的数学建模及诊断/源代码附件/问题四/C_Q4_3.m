%-----------------------------------------------------------
%������ 2012�о�����ѧ��ģ����C�⡪�и˳���ϵͳ����ѧ��ģ�����
%���:  ��������ù�ͼ����֮������ĳ�;��ıù�ͼ����
%�ο����ݣ� ����2  1#��
%����:  102686020  ��ԴԴ���μ�����������
%ʱ�䣺 2012.09.21-2012.09.24 
%Email: jvyou@seu.edu.cn
%----------------------------------------------------------

%%
clear all;
clc;

%%
%-----�����ⲿ���ݣ��߽�������-------
data1=load('2.txt');
u_1=data1(1,:);   %���㴦λ��ʱ�亯����
F_1=data1(2,:)*1e3;   %���㴦����ʱ�亯����
rod_Num=3;
rod_L(1)=523.61;      rod_L(2)=664.32;     rod_L(3)=618.35;
rod_Dia(1)=25*1e-3;   rod_Dia(2)=22*1e-3;  rod_Dia(3)=19*1e-3;
rod_A=zeros(3);
L_total=0;
for ir=1:rod_Num
    rod_A(ir)=pi*(rod_Dia(ir)/2)^2;
    L_total=L_total+rod_L(ir);
end  
data_length=length(u_1);

%%
%---------�򵥲����ĳ�ʼ��------------
E=2.1*1e11;
density=8456;
a_velocity=sqrt(E/density);

n_ba_u=10;
n_x=2;      n_t=data_length;
T=(1/4)*60; 
delta_t=T/(n_t-1); omega=2*pi/T;

u=zeros(n_x,n_t);F=zeros(n_x,n_t);
u(1,:)=u_1;  F(1,:)=F_1;

%%
sigma_n=zeros(1,n_ba_u+1);  tao_n=zeros(1,n_ba_u);
v_n=zeros(1,n_ba_u+1);      delta_n=zeros(1,n_ba_u);

alpha_n=zeros(1,n_ba_u);    belta_n=zeros(1,n_ba_u);

Kai_n=zeros(1,n_ba_u);      Mur_n=zeros(1,n_ba_u);

On=zeros(1,n_ba_u);    Pn=zeros(1,n_ba_u);
On_1=zeros(1,n_ba_u);  Pn_1=zeros(1,n_ba_u);

for rod_iN=1:rod_Num
L=rod_L(rod_iN);
A=rod_A(rod_iN);

if rod_iN==1
%%
%--------[1]ϵ���ļ���--------
%--------sigma_n,tao_n,v_n,delta_n�ļ���--------
for iN=1:n_ba_u+1  
    %%
    sigma_n_iNsum=0; v_n_iNsum=0;
    %-----sigma_n,v_n�ļ���----
    for jP=1:data_length
        sigma_n_iNsum=sigma_n_iNsum+F_1(jP)*cos(2*(iN-1)*pi*jP/data_length);
        v_n_iNsum=v_n_iNsum+u_1(jP)*cos(2*(iN-1)*pi*jP/data_length);
    end
    sigma_n(1,1)=sigma_n(1,1)/data_length;
    sigma_u_0=sigma_n(1,1);      sigma_F_0=sigma_n(1,1);
    sigma_n(1,iN)=(2/data_length)*sigma_n_iNsum;
    v_n(1,iN)=(2/data_length)*v_n_iNsum;
    
    %%
    if iN<=n_ba_u
       tao_n_iNsum=0; delta_n_iNsum=0;
       %-----tao_n,delta_n�ļ���----   
       for jP=1:data_length
          tao_n_iNsum=tao_n_iNsum+F_1(jP)*sin(2*(iN)*pi*jP/data_length);
          delta_n_iNsum=delta_n_iNsum+u_1(jP)*sin(2*(iN)*pi*jP/data_length);
       end
       tao_n(1,iN)=(2/data_length)*tao_n_iNsum;
       delta_n(1,iN)=(2/data_length)*delta_n_iNsum;
    end        
end 
else
    sigma_n(1,2:n_ba_u+1)=E*rod_A(rod_iN-1)*On_1(1,:);
    tao_n=E*rod_A(rod_iN-1)*Pn_1;    
    
    v_n(1,1)=sigma_n(1,1)*rod_L(rod_iN-1)/(E*rod_A(rod_iN-1))+v_n(1,1);      
    v_n(1,2:n_ba_u+1)=On;      delta_n=Pn;
end
    sigma_u_0=sigma_n(1,1);      sigma_F_0=sigma_n(1,1)+(6-rod_iN*2)*2e4;
%%
% %----[2]��a������Gibbsģ�͵�����ϵ��c����---
% S=3.2;
% N=7.6;
% V=S*N/30;
% % gama=exp(0.18-0.39094*V*30);
% gama=0.19746-0.06974*V+0.00075*V^2;
% c=(pi*a_velocity*gama)/(2*L);

% % %----[2]��b������Ħ����������ϵ��c����---
Mur_fluid=30*1e-3;  %Һ�嶯��ճ��
Dt=44*1e-3;         %�͹��ھ�
Dr=rod_Dia(1);      %���͸�ֱ��
m_Dia=Dt/Dr;        %ֱ��ϵ��
Hp=1819.56;         %����
B1=(m_Dia^2-1)/(2*log(m_Dia))-1;
B2=m_Dia^4-1-(m_Dia^2-1)^2/log(m_Dia);
c=(2*pi*Mur_fluid/(density*A))*(1/log(m_Dia)+(4*(B1+1)/B2)*...
    (B1+(2*tan(omega*Hp/a_velocity))/((omega*Hp/a_velocity)/...
    sin((omega*Hp/a_velocity))+cos((omega*Hp/a_velocity)))));

%----alpha_n,belta_n�ļ���----
for iN=1:n_ba_u+1
    alpha_n(1,iN)=(iN*omega/(a_velocity*sqrt(2)))*sqrt(1+sqrt(1+(c/(iN*omega))^2));
    belta_n(1,iN)=(iN*omega/(a_velocity*sqrt(2)))*sqrt(-1+sqrt(1+(c/(iN*omega))^2)); 
end

%%
%-----[3]Kai_n,Mur_n�ļ���----
for iN=1:n_ba_u
    Kai_n(1,iN)=(sigma_n(1,iN+1)*alpha_n(1,iN)+tao_n(1,iN)*belta_n(1,iN))/(E*A*(alpha_n(1,iN)^2+belta_n(1,iN)^2));
    Mur_n(1,iN)=(sigma_n(1,iN+1)*belta_n(1,iN)-tao_n(1,iN)*alpha_n(1,iN))/(E*A*(alpha_n(1,iN)^2+belta_n(1,iN)^2));    
end

%%
%---------[4]���ļ���---------------
%%
%-----[4.1]----�ô�--On,Pn,On_1,Pn_1�ļ���------
for iN=1:n_ba_u
    %%
    alpha_n_iN=alpha_n(1,iN);    belta_n_iN=belta_n(1,iN);
	sigma_n_iN=sigma_n(1,iN+1);  tao_n_iN=tao_n(1,iN);      v_n_iN=v_n(1,iN+1);     delta_n_iN=delta_n(1,iN);
	Kai_n_iN=Kai_n(1,iN);        Mur_n_iN=Mur_n(1,iN);
    %%
    On(1,iN)=(Kai_n_iN*cosh(belta_n_iN*L)+delta_n_iN*sinh(belta_n_iN*L))*sin(alpha_n_iN*L)...
                +(Mur_n_iN*sinh(belta_n_iN*L)+v_n_iN*cosh(belta_n_iN*L))*cos(alpha_n_iN*L);
    Pn(1,iN)=(Kai_n_iN*sinh(belta_n_iN*L)+delta_n_iN*cosh(belta_n_iN*L))*cos(alpha_n_iN*L)...
                -(Mur_n_iN*cosh(belta_n_iN*L)+v_n_iN*sinh(belta_n_iN*L))*sin(alpha_n_iN*L);  
    On_1(1,iN)=((delta_n_iN*belta_n_iN-v_n_iN*alpha_n_iN)*cosh(belta_n_iN*L)+tao_n_iN*sinh(belta_n_iN*L)/(E*A))*sin(alpha_n_iN*L)...
            +((v_n_iN*belta_n_iN+delta_n_iN*alpha_n_iN)*sinh(belta_n_iN*L)+sigma_n_iN*cosh(belta_n_iN*L)/(E*A))*cos(alpha_n_iN*L);
    Pn_1(1,iN)=((delta_n_iN*belta_n_iN-v_n_iN*alpha_n_iN)*sinh(belta_n_iN*L)+tao_n_iN*cosh(belta_n_iN*L)/(E*A))*cos(alpha_n_iN*L)...
            -((v_n_iN*belta_n_iN+delta_n_iN*alpha_n_iN)*cosh(belta_n_iN*L)+sigma_n_iN*sinh(belta_n_iN*L)/(E*A))*sin(alpha_n_iN*L);   
end

%%
%-----[4.2]----�ô�--u(L,t),F(L,t)�ļ���------
for nt=1:n_t
    %%
    sum_u=0;    sum_F=0;
    for iN=1:n_ba_u
        sum_u=sum_u+On(1,iN)*cos(iN*omega*(nt-1)*delta_t)+Pn(1,iN)*sin(iN*omega*(nt-1)*delta_t);
        sum_F=sum_F+On_1(1,iN)*cos(iN*omega*(nt-1)*delta_t)+Pn_1(1,iN)*sin(iN*omega*(nt-1)*delta_t);
    end        
     %%
    %--λ��ʱ�亯���ͺ���ʱ�亯���ļ���----
    %λ��ʱ�亯���ļ���u(x,t)
    u(2,nt)=sigma_u_0*L/(2*E*A)+v_n(1,1)/2+sum_u;
    %����ʱ�亯���ļ���F(x,t)
    F(2,nt)=sigma_F_0/2+E*A*sum_F;        
end

%%
%---------ʾ��ͼ����ʾ------------
% figure(rod_iN)
plot(u(2,:),F(2,:),'r-.');
hold on;
% 
% plot(u(2,:),F(2,:),'g*-');
% grid on;
% xlabel('λ�� (m)');ylabel('���� (n)');title('һ���˵�����ʾ��ͼ');
% legend('����ʾ��ͼ','�ù�ͼ');
% hold off
end

%%
%----------ͼע----------
plot(u(1,:),F(1,:),'k*-');
hold on;
plot(u(2,:),F(2,:),'r-.');
grid on;
xlabel('λ�� (m)');ylabel('���� (n)');title('�����˵�ʾ��ͼ');
% text(4.21,5.819e+4,'\leftarrow ����ʾ��ͼ');
% text(4.158,3.792e+4,'\leftarrow һ����ĩ��ʾ��ͼ');
% text(4.313,1.783e+4,'\leftarrow ������ĩ��ʾ��ͼ');
% text(4.062,-0.8022e+4,'\leftarrow �ù�ͼ');
text(3.21,5.819e+4,'\leftarrow ����ʾ��ͼ');
text(3.158,3.792e+4,'\leftarrow ��ģ��һ����ĩ��ʾ��ͼ');
text(3.313,1.783e+4,'\leftarrow ��ģ�Ͷ�����ĩ��ʾ��ͼ');
text(3.062,-0.8022e+4,'\leftarrow ��ģ�ͱù�ͼ');
% hold off
