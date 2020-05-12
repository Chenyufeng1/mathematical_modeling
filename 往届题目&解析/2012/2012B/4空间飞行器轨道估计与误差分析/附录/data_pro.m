function data = data_pro(t1)%data = [pos6 pos9 ab1_6 ab1_9];
%% **********  ���ݴ���׶Σ��� �۲���ʱ�̽���ͳһ��50:0.2:170�� �����������Щ��ֵ���λ��
load data.mat
t0_s = [0 t1];% �������λ�õ� ʱ��ȡֵ��
%���� ״̬ʸ��������λ�� ���ٶ�
pv6 = state(6, t0_s, hmax, satinfo, 0,0);
pv9 = state(9, t0_s, hmax, satinfo, 0,0);

%���ǵ�λ�� ʸ��
n_t = size(t0_s,2);%ode ������ t ����
pos6 = pv6(2:n_t,1:3);% λ��,
pos9 = pv9(2:n_t,1:3);

% 6�����ǵĹ۲�ֵ 
t0_6 = dat_60(:,1);% �۲�����
ab0_6 = dat_60(:,2:3);% ԭʼ����
ab1_6 = interp1(t0_6,ab0_6, t1,'spline','extrap');

%9�����ǵĹ۲�ֵ 
t0_9 = dat_90(:,1);
ab0_9 = dat_90(:,2:3);% ԭʼ����
ab1_9 = interp1(t0_9,ab0_9, t1,'spline','extrap');
data = [pos6 pos9 ab1_6 ab1_9];
end
