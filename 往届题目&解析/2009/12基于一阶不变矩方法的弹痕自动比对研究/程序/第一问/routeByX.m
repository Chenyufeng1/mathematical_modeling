function [NewY,NewZ] = routeByX(y,z,DeltaCita)
% ��X����ת�������꣬��ת�Ƕ�ΪDeltaCita
% ��X����ת�������꣬����Ӱ����۵�y�����z����
% ���룺
%     y�� ��תǰ��y����
%     z�� ��תǰ��z����
%     DeltaCita ��ת�Ƕȣ���λ���ȡ��涨��ʱ��Ϊ����˳ʱ��Ϊ����
% �����
%     NewY����ת���y����
%     NewZ����ת���z����

% By Liu Yu
% 2009-09-20


L = sqrt(y.^2+z.^2);
cita = atan(z./y);


ind = find(z==0);
cita(ind) = 0;
Cita = cita+DeltaCita;

NewY = L .* cos(Cita);
NewZ = L .* sin(Cita);