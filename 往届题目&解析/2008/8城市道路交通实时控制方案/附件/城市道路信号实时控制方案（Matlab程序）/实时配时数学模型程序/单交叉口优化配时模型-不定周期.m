 
function out=myfun_siglechang1(t)
r=21;%rΪ��λʱ���ڳ�����ƽ�������ʣ�
m=1;
n=12;
y21=poissrnd(r,m,n)  % ��m*n�׾���



i=1:12;
s(i)=1.5;%����������Ϊ1.5

j=1:4;

na=y21/30;
A=reshape(na,4,3)
V=max(A');
z=sum(V);
T=(t(j)*z)/(V(j)/1.5)





%T(j)=sum(t); %T=70;             %�������ڳ���
zhiliu(1:12)=5;   %���ø�������ʼ��������
na(1:12)=0.2;  %���ø�����ƽ��������
p(1:12)=1;     %���ø�����ͨ��ʱ��ƽ���뿪��


t1=t(1);t2=t(2);t3=t(3);t4=t(4); %t4=T-sum(t);
zhiliu=zhiliu+na*T;   %����ﵽ�ĳ���

te=[T t2 t1 T t4 t3 T t2 t1 T t4 t3]; zhiliu=zhiliu-te.*p; %��ȥ�뿪�ĳ�
zhiliu=max(zhiliu,zeros(size(zhiliu)));   %��������0

out=sum(zhiliu);    %������������    %��x0=[10 10 10 40]; [x fval]=fmincon(@myfun_single,x0,[],[],[1 1 1 1],[70],[6 6 6 6],[52 52 52 52]) �������Ż�������[1 1 1 1]��[70]��ʾ��ʽԼ����t1+t2+t3+t4=70��
