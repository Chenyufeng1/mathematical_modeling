function Q=overtop()
%���س�ʼ������
Nr=760;%�����߳�
Nc=753;%�Ӷ��߶�
B=300;
lc= 803;
g=9.8;
c=1/3+1.32*(Nr-Nc)/B;
Q= c*lc*sqrt(2*g)*(Nr-Nc)^(3/2);
