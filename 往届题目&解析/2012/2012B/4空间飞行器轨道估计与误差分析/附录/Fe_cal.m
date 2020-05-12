function  F = Fe_cal( r )
%��֪λ��ʸ�� ����������ܵ������� Fe
global Gm

rx = r(:,1);
ry = r(:,2);
rz = r(:,3);
rm  = sum(r.^2,2).^(0.5); % λ�� ģֵ

Fe_x = -Gm./(rm.^3).*rx;% x�᷽��
Fe_y = -Gm./(rm.^3).*ry;% y�᷽��
Fe_z = -Gm./(rm.^3).*rz;% z�᷽��

F = [Fe_x Fe_y Fe_z];

end