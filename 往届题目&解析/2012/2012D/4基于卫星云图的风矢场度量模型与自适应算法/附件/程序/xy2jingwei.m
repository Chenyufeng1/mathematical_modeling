% �Ҷ�ƽ�����굽���������µ�ת��
% 2012-09-22
function [jingdu,weidu]=xy2jingwei(i,j)

Rse=42164000; % ���ǵ����ĵľ���
Q=140*10^(-6);% �����ǣ�΢��
P=140*10^(-6);% �����ǣ�΢��
a=6378136.5; % ���򳤰���
b=6356751.8; % ����̰���
i0=1145; % ���±���S-VISSR֡ƽ���ϵ�����
j0=1145; % ���±���S-VISSR֡ƽ���ϵ�����
lo=86.5; % ���µ����ھ��ȣ�����Ϊ��
la=0; % ���µ�����γ�ȣ���γΪ��
h=Rse;   % ���ǵ����µ�ľ���

alfa=-(i0-i)*Q;
beita=-(j0-j)*P;


A=((tan(beita))^2+1)/a^2+((tan(alfa))^2)/b^2;

B=-2*h*(tan(beita))^2/a^2-2*h*(tan(alfa))^2/b^2;

C=h^2*(tan(beita))^2/a^2+h^2*(tan(alfa))^2/b^2-1;

y_zong=(-B+sqrt(B^2-4*A*C))/(2*A);


x_heng=-(y_zong-h)*tan(beita);

z_shu=(y_zong-h)*tan(alfa);

jingdu=atan(x_heng/y_zong)*180/pi+lo;
weidu=atan(z_shu/sqrt(x_heng^2+y_zong^2))*180/pi;























