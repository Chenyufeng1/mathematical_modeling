
function y=flowdown(l,t,dt,q,qm)
%flowdown
%l ��ʾ���룬��������ɢ����ʾ��ÿ��΢Ԫ5��
%t ��ʾʱ��

Wt=q*dt;%����ĳt->t+dt���������
%qm��¼�������
VK=vl(l);
y=qm/(1+qm/(VK*Wt));

    
    