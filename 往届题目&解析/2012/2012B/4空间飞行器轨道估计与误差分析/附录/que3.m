%�ڶ��ʵ����
global Gm
Gm = 3.986005e14;

load satinfo.txt
load meadata_06_00.txt;
load meadata_09_00.txt;

dat_60 = meadata_06_00;
dat_90 = meadata_09_00;

save data.mat
load data.mat

hmax = 5;
option_s = odeset('AbsTol',1e-13,'RelTol',1e-8,'MaxStep',hmax );%'OutputFcn','odephas3', %��


step  = 0.2; 
hmax1 = 5;
n_itv = 17;%��ֵļ��

t1 = 50 : step: 170;%��Ҫ��ֵ���������λ�õĵ�

%% **********  ���ݴ���׶Σ��� �۲���ʱ�̽���ͳһ��50:0.2:170�� �����������Щ��ֵ���λ��
t0_s = [0 t1];% �������λ�õ� ʱ��ȡֵ��
%���� ״̬ʸ��������λ�� ���ٶ�
pv6 = state(6, t0_s, hmax, satinfo, 0,0);
pv9 = state(9, t0_s, hmax, satinfo, 0,0);

%���ǵ�λ�� ʸ��
n_t = size(t0_s,2);%ode ������ t ����
pos06 = pv6(2:n_t,1:3);% λ��,
pos09 = pv9(2:n_t,1:3);

% 6�����ǵĹ۲�ֵ 
t0_6 = dat_60(:,1);% �۲�����
ab0_6 = dat_60(:,2:3);% ԭʼ����
ab1_6 = interp1(t0_6,ab0_6, t1,'spline','extrap');

%9�����ǵĹ۲�ֵ 
t0_9 = dat_90(:,1);
ab0_9 = dat_90(:,2:3);% ԭʼ����
ab1_9 = interp1(t0_9,ab0_9, t1,'spline','extrap');

% *********************************************************************************************************************

n_pos = size(t1,2);

h3 =  n_itv*step;
% alpha ��beta ���в��ƽ����� ����������
ab6 = ab1_6(1:n_itv:n_pos,:);
ab9 = ab1_9(1:n_itv:n_pos,:);

pos6 = pos06(1:n_itv:n_pos,:);
pos9 = pos09(1:n_itv:n_pos,:);

n_q3 = size(pos6,1);
% 6���ǵ�ϵͳ�������***************
nx = 2*n_q3 + 8; %δ֪���ĸ������������ɳ�ֵ

x_gus = ones(nx,1)*1e6;%[0.8 0.01 0.01 0.01] ;
x_gus(1:8) = [0.95 0.001 0.01 0.01 0.95  0.001 0.01 0.01];

save fun_new.mat  pos6  ab6 pos9  ab9 ;
 tic
[d_ab  ssq  cnt ] =  LMFsolve('fun_new',x_gus);
 
toc
save data3.mat
 %******************************************

% trv_prt = [ t1(1:50:n_pos)' rv_gus(1:50:n_pos,:)];
% options =  odeset('AbsTol',1e-16,'RelTol',1e-6,'MaxStep',hmax);%'OutputFcn','odephas3',
% [t_local,y] = ode45('myode',tspan, x0,options, Gm, 0,0 ));

 


 