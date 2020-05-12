function [NewX,NewY] = routeByZ(x,y,DeltaCita)
% ��Z����ת�������꣬��ת�Ƕ�ΪDeltaCita
% ��Z����ת�������꣬����Ӱ����۵�x�����y����
% ���룺
%     x�� ��תǰ��x����
%     y�� ��תǰ��y����
%     DeltaCita ��ת�Ƕȣ���λ���ȡ��涨��ʱ��Ϊ����˳ʱ��Ϊ����
% �����
%     NewX����ת���x����
%     NewY����ת���y����

% By Liu Yu
% 2009-09-20


L = sqrt(x.^2+y.^2);
cita = atan(x./y);

ind = find(x==0);
cita(ind) = 0;

Cita = cita+DeltaCita;

NewX = L .* sin(Cita);
NewY = L .* cos(Cita);
