%que1
% ��һ�ʣ�ͨ�����ּ�����������һʱ�̵�λ��
global Gm
Gm = 3.986005e14;

load satinfo.txt
% load meadata_06_00.txt;
% load meadata_09_00.txt;
% 
% dat_60 = meadata_06_00;
% dat_90 = meadata_09_00;
% save data.mat


% load data.mat

% ** ��һ��
 
t_samp = 0:50:250;
hmax_s = 5;%����λ�ü�����󲽳�
pv = state(9,t_samp, hmax_s, satinfo,0,0);
% 
% 
% x0 = satinfo(9,:);
% tspan = [0  50:10:170];
%  tspan = 50:10:170;
% 
% options =  odeset('AbsTol',1e-16,'RelTol',1e-6,'MaxStep',hmax);%'OutputFcn','odephas3',
% [t_local,y] = ode45('myode',tspan, x0,options, Gm,0,0);
% ��һ��**** 
 