function resl = slove_vrm(r, v, a0 )
% ��֪ r �� v, �󷽳̵� ��   vr ��mdotm

% function  F = Fe_cal( r )
% %��֪λ��ʸ�� ����������ܵ������� Fe
Fe = Fe_cal( r );
a  =  a0 - Fe;

ax = a(:,1);
ay = a(:,2);
az = a(:,3);

vm  = sum(v.^2,2).^(0.5); % �ٶ� ģֵ
vx = v(:,1);
vy = v(:,2);
vz = v(:,3);

A_vr = -[vx./vm; vy./vm; vz./vm];% vr(t)��
A_m = [ax; ay ; az;];

b_x = -t_pl.*  ax  ;
b_y = -t_pl.*  ay  ;
b_z = -t_pl.*  az ;

b = [b_x;  b_y; b_z];


A = [ A_m -A_vr];
A_new = A'*A;
b_new = A'*b;

resl = A_new\b_new;

end