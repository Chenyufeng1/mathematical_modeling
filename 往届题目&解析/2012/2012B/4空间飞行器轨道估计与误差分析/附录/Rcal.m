% �� ������ ��λ�ô����۲�����ϵ���׼����ϵ��ת������
function R = Rcal( pos_v) %pos_v Ϊ������

xs_u = pos_v/norm(pos_v);

z_in = [0 0 1];
ys = cross(z_in, pos_v);
ys_u = ys/norm( ys);

zs_u = cross(xs_u, ys_u);

R = [xs_u' ys_u' zs_u'];%�ӹ۲�����ϵ�� ����ϵ��ת������
end




