clc;
% clear;
tic
% 2012 D�⣨2��
%% ԭʼ������
global K_temp
ir1_2030=load('IR1_2030.mat');
ir1_2100=load('IR1_2100.mat');
ir1_2130=load('IR1_2130.mat');
%temp=load('temp3.mat');
%Temp3=temp.t;

AA=ir1_2030.aa;
BB=ir1_2100.bb;
CC=ir1_2130.cc; % ����ʱ�̵ĻҶȾ���
k_temp=load('k_temp.txt');
k_temp=k_temp(1:128,:); % 128*8
% K_temp=reshape(k_temp,1,1024); ***
[II JJ]=size(k_temp);
kk=1;
for i=1:II
    for j=1:JJ
        K_temp(kk)=k_temp(i,j);
        kk=kk+1;
    end
end
%% ����������
% Rse=42164000; % ���ǵ����ĵľ���
% a=6378136.5; % ���򳤰���
% b=6356751.8; % ����̰���
% P=140;% �����ǣ�΢��
% Q=140;% �����ǣ�΢��
% I0=1145; % ���±���S-VISSR֡ƽ���ϵ�����
% J0=1145; % ���±���S-VISSR֡ƽ���ϵ�����
% Long0=86.5; % ���µ����ھ��ȣ�����Ϊ��
% La0=0; % ���µ�����γ�ȣ���γΪ��
%% �ƿ��ȷ��
% Ҫ�ж���һ�����ǲ��Ǵ����ڵر�
%T=583; % �¶���ֵ��273.16k,��K_temp�ļ��лҶ�ֵӦ���� 582
%f=0.85; % �����ƿ�󵽳���������Χ��f������Ϊ�ǵ��� !!!!
M=64; % ������Χ 64*64
N=32; % �ƿ��С 16*16
step=32;
% x1=64; % ��Ч��������
% y1=61;
% x2=2225;
% y2=2229;
% step=N/2;% ÿ��ƽ�ƴ�С,����
%cloud_sample=ones(N,N);% �Ʊ�׼����
% ��������AA
cloud_AA_id=zeros(1000,4);% ����Ƶ����Ͻǣ����½�����
g=1; % �Ʊ��
[x1 y1]=jingwei2xy(46,40);% ���㷶Χȷ��
[x2 y2]=jingwei2xy(126,-40);
x1=floor(x1);
y1=floor(y1);
x2=floor(x2)-N+1;
y2=floor(y2)-N+1;
g=1;


% ��������BB
cloud_BB_id=zeros(1000,4);% ����Ƶ����Ͻǣ����½�����
g=1; % �Ʊ��
for i=x1:step:x2
    for j=y1:step:y2
            cloud_BB_id(g,:)=[i,j,i+N-1,j+N-1]; % Ҫ����ʵ�ʵ�S_vissr ����
            g=g+1;
        % �黮��
    end
end

%% ����ƥ��
B_size=size(cloud_BB_id,1);%%
AB_move=zeros(B_size,2);
BC_move=zeros(B_size,2);
for i=1:B_size
    x1=cloud_BB_id(i,1);
    y1=cloud_BB_id(i,2);
    x2=cloud_BB_id(i,3);
    y2=cloud_BB_id(i,4);% ʾ��������
    % Ŀ������
    aa=(M-N)/2+1;% ʾ������Զ���
    bb=aa;
    xx1=x1-(M-N)/2;
    yy1=y1-(M-N)/2;
    xx2=x2+(M-N)/2;
    yy2=y2+(M-N)/2;
    b_sample=BB(x1:x2,y1:y2);
    t_sum=sum(sum(b_sample));% ʾ���ƻҶȺ�
    t_ave=t_sum/(N*N);
    % t_ave=mean(b_sample);
    % t_var=var(b_sample(:));%;����
    % ���ֵ��ƫ��֮��
    % t_subs=0;
    t_vary=0;
    for u=1:N
        for v=1:N
            % t_subs=t_subs+(b_sample(u,v)-t_ave);
            t_vary=t_vary+(b_sample(u,v)-t_ave)^2;
        end
    end
    %%%%%%% �� AA����ƥ�� %%%%%%%
    % �������ϵ��
    for ii=xx1:(xx2-N+1)
        for jj=yy1:(yy2-N+1)
            a_sample=AA(ii:ii+N-1,jj:jj+N-1);
            %k_ave=mean(a_sample);
            k_sum=sum(sum(a_sample));% ƥ�����ҶȺ�
            k_ave=k_sum/(N*N);
            % k_var=var(a_sample(:));%;����
            % ���ֵ��ƫ��֮��
            k_subs=0;
            k_vary=0;
            for u=1:N
                for v=1:N
                    k_subs=k_subs+(b_sample(u,v)-t_ave)*(a_sample(u,v)-k_ave);
                    k_vary=k_vary+(a_sample(u,v)-k_ave)^2;
                end
            end
            R(ii-xx1+1,jj-yy1+1)=k_subs/sqrt(k_vary*t_vary); %���ϵ��
        end
    end
    [maxr,I]=max(R);
    [max_R,kk]=max(maxr);
    jj=I(kk);
    AB_move(i,:)=[aa-jj,bb-kk];%% B - A �Ĳ�
    %%%%%% �� CC ����ƥ��  %%%%%
    % �������ϵ��
    for ii=xx1:(xx2-N+1)
        for jj=yy1:(yy2-N+1)
            a_sample=CC(ii:ii+N-1,jj:jj+N-1);
            %k_ave=mean(a_sample);
            k_sum=sum(sum(a_sample));% ƥ�����ҶȺ�
            k_ave=k_sum/(N*N);
            % k_var=var(a_sample(:));%;����
            % ���ֵ��ƫ��֮��
            k_subs=0;
            k_vary=0;
            for u=1:N
                for v=1:N
                    k_subs=k_subs+(b_sample(u,v)-t_ave)*(a_sample(u,v)-k_ave);
                    k_vary=k_vary+(a_sample(u,v)-k_ave)^2;
                end
            end
            R(ii-xx1+1,jj-yy1+1)=k_subs/sqrt(k_vary*t_vary); %���ϵ��
        end
    end
    [maxr,I]=max(R);
    [max_R,kk]=max(maxr);
    jj=I(kk);
    BC_move(i,:)=[jj-aa,kk-bb]; % C-B �Ĳ�
end
%% ��ʸ����
% ���� ����
[AB_speed,AB_dirt,speed_id]=cloud_speed_AB(cloud_BB_id,AB_move);
[BC_speed,BC_dirt,speed_id]=cloud_speed_BC(cloud_BB_id,BC_move,speed_id);
B_speed=(AB_speed+BC_speed)/2;
% ѹǿ
P_36=[0.1, 0.2,  0.5,  1,  1.5,  2,  3,   4,  5,   7, 10,  20, 30,  50,  70,...
    100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, ...
    800, 850, 900, 925, 950, 975, 1000];
% 641*1280*36
% ���㲽�裬�ɻҶȡ����¶ȣ��ɾ�γ�����¶ȡ���ȷ�����ڲ㣬�ɲ�ó�ѹǿ
% par=tem2par_0923(BB);
disp('��0��ʸ�ĸ���');
speed_id=speed_id>0;
sum_wind=sum(sum(speed_id))
%
save AB_speed AB_speed
save BC_speed BC_speed
save B_speed B_speed
save AB_dirt AB_dirt
save BC_dirt BC_dirt
save cloud_BB_id cloud_BB_id
save BC_move BC_move
save AB_move AB_move
save speed_id speed_id
% save par par
%
toc
