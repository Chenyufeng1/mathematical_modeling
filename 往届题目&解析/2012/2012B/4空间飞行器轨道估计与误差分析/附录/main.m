
global Gm
Gm = 3.986005e14;
  
load data.mat

hmax = 5;

option_s = odeset('AbsTol',1e-18,'RelTol',1e-8,'MaxStep',hmax );%'OutputFcn','odephas3', %��
%options  =  odeset('AbsTol',1e-10,'RelTol',1e-3,'MaxStep',hmax );%'OutputFcn','odephas3',%��

%��ֵ ��� ���� t ʱ�̵� �۲�ֵ alpha �� beta �� ͨ������  ��� 51:169s�� alpha��beta, %ͨ������ ��� 50 �� 170 s����λ�ú��ٶȡ�
step1 = 0.2; 
hmax1 = 5;
n_itv = 15;%��ֵļ��

t1 =50 : step1 :170;%��Ҫ��ֵ�ĵ�

rs_in = Rs_cal( step1, hmax1);
n_pos = size(rs_in,1);

%% �������� ͨ���۲�ֵ ȷ����λ�õ� ����ͼ
%�ֿ���ͼ
% figure(1);
% for i = 1 : 3;
%     subplot(2,3,i);
%     plot(t1', rs_in(:,i));
% end
% title('�۲�λ��ͼ');


%% ���ò�� ������ ���ٶ� a, �����Ϸ�����֪9�ǵ� ���������Խ�С  % ����ȫ������ ��������ϵ�ڽ��м���
%δ֪������
% vr(t)��ȼ������ڻ��β����ڵ������ٶȵ���ʸ��
% mdot(t)�������仯��
% m0�� �������ĳ�ʼ����
 
%% �ϵ�˼·----��ֵ ��� ���� t ʱ�̵� �۲�ֵ alpha �� beta �� ͨ������  ��� 51:169s�� alpha��beta, ͨ������ ��� 50 �� 170 s����λ�ú��ٶȡ� 
% ���ò�� ������ ���ٶ� a, �����Ϸ�����֪9�ǵ� ���������Խ�С  % ����ȫ������ ��������ϵ�ڽ��м���
%δ֪������
% vr(t)��ȼ������ڻ��β����ڵ������ٶȵ���ʸ��
% mdot(t)�������仯��
% m0�� �������ĳ�ʼ����

% ��֪�� ��0.2s�����£� ��������λ��ʸ��
h =  n_itv*step;%��� 
n_dif = 1 : h : n_pos;
num = size(n_dif,1);

rs0_dif = rs_in(n_dif,:);

dr = rs0_dif(3: num,:) -  rs0_dif(1: num-2,:); %0.2s��λ��

  
v = dr/h/2;%  һ���� n_pos-1 ���ٶȵ�


v_dif = v(1:num-2,:);
vm_dif = sum(v_dif.^2,2).^(0.5);%�ٶ�ģֵ
%��ּ��ٶ�
a_dif  = (rs_in(3: num,:) - 2* rs_in(2: num-1,:) +  rs_in(1: num-2,:)) / h/h ;% ���ٶȵĴ�С������ nv-1�� ����

ax_dif = a_dif(:,1);
ay_dif = a_dif(:,2);
az_dif = a_dif(:,3);

%��ʾÿ�����ٶȶ�Ӧ�� �ٶ�ʸ�� v �� λ��ʸ�� r, ��ÿ�ε�ƽ��ֵ����ʾ
v_x = v_dif(:,1);
v_y = v_dif(:,2);
v_z = v_dif(:,3);
 
r_dif = rs_in(1:num-2,:);
  
r_x = r_dif(:,1);
r_y = r_dif(:,2);
r_z = r_dif(:,3);

pva_dif = [r_dif v_dif a_dif];


%% ��˼·-ֱ�� �� ����� ����ϵ�µ����꣬�����˲�����
% t_cal = t_pl - t_pl(1);
t_pl = (t1 - t1(1))';

r0_x = rs_in(:,1);
r0_y = rs_in(:,2);
r0_z = rs_in(:,3);
 
% % 3 �����  
% [ply_rx,S_rx]  = polyfit(t_pl, r0_x, 3);
% [ply_ry,S_ry]  = polyfit(t_pl, r0_y, 3);
% [ply_rz,S_rz]  = polyfit(t_pl, r0_z, 3);
% 
% % ��Ϻ�� ���� - λ��ʸ��
% rx = ply_rx(1).*t_pl.^3 + ply_rx(2).*t_pl.^2 + ply_rx(3).*t_pl + ply_rx(4);
% ry = ply_ry(1).*t_pl.^3 + ply_ry(2).*t_pl.^2 + ply_ry(3).*t_pl + ply_ry(4);
% rz = ply_rz(1).*t_pl.^3 + ply_rz(2).*t_pl.^2 + ply_rz(3).*t_pl + ply_rz(4);
% 
% 
% vx = 3.*ply_rx(1).*t_pl.^2 + 2.*ply_rx(2).*t_pl  + ply_rx(3) ;
% vy = 3.*ply_ry(1).*t_pl.^2 + 2.*ply_ry(2).*t_pl  + ply_ry(3) ;
% vz = 3.*ply_rz(1).*t_pl.^2 + 2.*ply_rz(2).*t_pl  + ply_rz(3) ;
% 
% ax = 6.*ply_rx(1).*t_pl + 2.*ply_rx(2) ;
% ay = 6.*ply_ry(1).*t_pl + 2.*ply_ry(2)  ;
% az = 6.*ply_rz(1).*t_pl + 2.*ply_rz(2) ;
% 
% r = [rx ry rz];
% v = [vx vy vz];
% a = [ax ay az];

 
%% ���� ��ϵ� λ��-�ٶ�-���ٶ� ͼ
% figure;
% for i = 1 : 9;
% subplot(3,3,i);%�������
% plot(t_pl, pva_pl( :,i),'r','LineWidth',3);
% 
% hold on;
% plot(t_pl(1:n_pos-2), pva_dif( :,i));%���
% 
% end
% title('��Ϲ��ͼ');

% % *************����ģֵ ���� vr ��mdotm������������������������������
t_cal = t_pl ;
am  = sum(a.^2,2).^(0.5);
rm  = sum(r.^2,2).^(0.5); % λ�� ģֵ
vm  = sum(v.^2,2).^(0.5); % �ٶ� ģֵ


%���������ܵ�����֮��
Fe_x = -Gm./(rm.^3).*rx;% x�᷽��
Fe_y = -Gm./(rm.^3).*ry;% y�᷽��  
Fe_z = -Gm./(rm.^3).*rz;% z�᷽��  

%Fr,��������ļ��ٶ�
% ����� ������
% A * x + B * y = b; ���� A= accl+Gm/r^3*r_vec, B = v_unit( ������ �� �ٶ� ����)�� x = m0/mdot, y = vr; 
A_m = ((ax - Fe_x).^2+( ay - Fe_y).^2+ (az - Fe_z).^2).^(0.5);

%vr,ȼ������ڻ��β����ڵ������ٶȵ�ʸ�������� ������������෴�����ٶȱ仯��ȡ ��ֵ

b_pl = t_cal.*A_m;
 
A_pl = [A_m -1*ones(num,1)];
A_pl_new = A_pl'*A_pl;
b_pl_new = A_pl'*b_pl; 
para_pl = A_pl_new\b_pl_new;
% % *************����ģֵ ���� vr ��mdotm������������������������������


% ****** ���� ������ �������� ���� vr ��mdotm������������������������������
 
A_vr = -[vx./vm; vy./vm; vz./vm];% vr(t)��
A_m = [ax - Fe_x; ay - Fe_y; az - Fe_z;];

b_x = -t_pl.* (ax - Fe_x) ;
b_y = -t_pl.* (ay - Fe_y);
b_z = -t_pl.* (az - Fe_z);
 
b_dif = [b_x;  b_y; b_z];


A_dif = [ A_m -A_vr];
A_dif_new = A_dif'*A_dif;
b_dif_new = A_dif'*b_dif;

para2 = A_dif_new\b_dif_new;
% ****** ���� ������ �������� ���� vr ��mdotm������������������������������

r_error  = r  -  rs_in ;

figure;
for i = 1 : 3;
subplot(1,3,i);
plot(t_pl , abs(r_error(:,i)));
end
title('��ϲв�ͼ');


 
%% �Ѿ������, a�ı��ʽ�����Կ���ֱ�ӻ���,���ƹ��
%��ʼ λ�� ���ٶ� ������ ���� �������, ���ò�ֵ�ĳ�ʼ�� �Ϳ����ˡ�
% �ֱ�Ϊ r_dif �� v_dif
% ������л��ּ��㣬������� Ϊ 10s;
 
%  t_gus = t1;

n_gus = size(t_gus,2);

x0_gus = [r(1,:) v(1,:)];%����ĳ�ֵ �� 50.3754448072 ���� ��ֵ

tspan_gus = t1;

hmax_gus = 2;

options1  =  odeset('AbsTol',1e-16,'RelTol',1e-0,'MaxStep',hmax_gus);%'OutputFcn','odephas3',

mdotm = para_pl(1);
vr    = para_pl(2);

[t_local_gus,pv_gus] = ode45('myode',tspan_gus, x0_gus,options1, Gm, vr, mdotm);
 


% %�������ƹ����λ�ú��ٶ�����ͼ
% %�ֿ���ͼ
% figure;
% for i = 1 : 6;
% subplot(2,3,i);
% plot(t_local_gus(1:n_gus)+ t_gus(1) , pv_gus(1:n_gus,i));
% end
% title('���ƹ��ͼ');
% % save gcf 

p_error = pv_gus  - [rs_in   v ];

figure;
for i = 1 : 3;
subplot(2,3,i);
plot(t_local_gus , abs(p_error(:,i)));
end
title('���Ʋв�ͼ');




% %ͬһ��ͼ��
% figure;
% plot(t_local_gus(2:n_gus-1), pv_gus(2:n_gus-1,:));
%���������λ�ú��ٶ�����ͼ


% ������ÿ�� 10s ��ȡ����
% ������� Ϊ�� 50.3754448072
t_out = t_local_gus(2:5*10: (169-51)*5);
pv_out = pv_gus(2:5*10: (169-51)*5,:);% ÿ�� 10s ��ȡ����

n_out = size(t_out,1);
% ����ÿ�� 10s ��λ�ã� Ϊ����� ת������
ts_out = [0; t_out-t_gus(1)];%Ϊ������� ������� ���
hmax = 5;%����λ�ü�����󲽳�

pv_s6 = state(6,ts_out, hmax, satinfo, 0,0);
pv_s9 = state(9,ts_out, hmax, satinfo, 0,0);

pv_out_s6 = pv_s6(2 : n_out+1,:); % �ų��� ��һ����ֵ����
pv_out_s9 = pv_s9(2 : n_out+1,:); % �ų��� ��һ����ֵ����

%������ÿ�� 10s �� �۲�ֵ��ͨ����ֵ���
ab6_real = interp1(t0_6,ab0_6, t_out,'spline');



% ���ǵ�λ��ʸ��
ab6_out = zeros(n_out,2);

for j = 1:1:n_out
rs6_out  = pv_out_s6(j,1:3);
rs9_out  = pv_out_s9(j,1:3);

R6_out = Rcal(rs6_out);
R9_out = Rcal(rs9_out);

% ת����� �۲�����ϵ �µ� x,y,z
yz_6 = R6_out(2:3,:)*(pv_out(j,1:3) - rs6_out)';
x_6 = R6_out(1,:)*(pv_out(j,1:3) - rs9_out)';

a6_out = yz_6(1)./x_6;
b6_out = yz_6(2)./x_6;

ab6_out(j,:) = [a6_out b6_out ];
end

ab6_error = ab6_out - ab6_real;
 


 