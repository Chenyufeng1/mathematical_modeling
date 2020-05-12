function resl = slove_vrm(r, v, a0 ,t )
% ��֪ r �� v, �󷽳̵� ��   vr ��mdotm, �������н���� ��һ��Ϊ ������õĽ�����ڶ���Ϊģֵ��õ�����
% tΪ������

% function  F = Fe_cal( r )
% %��֪λ��ʸ�� ����������ܵ������� Fe
Fe = Fe_cal( r );
a  =  a0 - Fe;
dt = t - t(1);

ax = a(:,1);
ay = a(:,2);
az = a(:,3);

vm  = sum(v.^2,2).^(0.5); % �ٶ� ģֵ
vx = v(:,1);
vy = v(:,2);
vz = v(:,3);

A_vr = -[vx./vm; vy./vm; vz./vm];% vr(t)��
A_m = [ax; ay; az;];

bx = -dt'.*  ax  ;
by = -dt'.*  ay  ;
bz = -dt'.*  az ;

b = [bx;  by; bz];


A = [ A_m -A_vr];
A_new = A'*A;
b_new = A'*b;

para_prj = A_new\b_new;


%Fr,��������ļ��ٶ�
% ����� ������
% A * x + B * y = b; ���� A= accl+Gm/r^3*r_vec, B = v_unit( ������ �� �ٶ� ����)�� x = m0/mdot, y = vr; 
A_m2 = sum(a.^2,2).^(0.5);  %((ax - Fe_x).^2+( ay - Fe_y).^2+ (az - Fe_z).^2).^(0.5);
b_mod = dt'.*A_m2;
num = size( a, 1);
A_mod = [A_m2 -1*ones(num,1)];
A_mod_new = A_mod'*A_mod;
b_mod_new = A_mod'*b_mod; 
para_mod = A_mod_new\b_mod_new;

resl = [para_prj para_mod];

end