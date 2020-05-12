clc,clear;
shuju=xlsread('D:\My Documents\MATLAB\data','sheet2');
shuju(3:12,4)=diff(shuju(2:12,4));
shuju(14:20,4)=diff(shuju(13:20,4));
x=shuju(:,1:13);
y=shuju(:,14); %�ֱ�����Ա���x�������y��ֵ
x=zscore(x); %���ݱ�׼��
r=cov(x);  %���׼�����ݵ�Э�����󣬼������ϵ������
[vec,val,con]=pcacov(r);  %�������ɷַ�������ؼ���
num=2;  %ѡ�������ӵĸ���
f1=repmat(sign(sum(vec)),size(vec,1),1);
vec=vec.*f1;     %��������������ת��
f2=repmat(sqrt(val)',size(vec,1),1); 
a=vec.*f2;   %������غɾ���
am=a(:,1:num);  %���num�������ӵ��غɾ���
[b,t]=rotatefactors(am,'method', 'varimax') %��ת�任,bΪ��ת����غ���
bt=[b,a(:,num+1:end)];   %��ת��ȫ�����ӵ��غɾ���
contr=sum(bt.^2);       %�������ӹ���
rate=contr(1:num)/sum(contr); %�������ӹ�����
coef=inv(r)*b;         %����÷ֺ�����ϵ��
weight=rate/sum(rate);  %����÷ֵ�Ȩ��
%���õ÷�ϵ����������ָ��ƽ���Ĵ�С������������
index=mean(x(:,1:13));
index=[weight(1).*index;weight(2).*index];
score=coef*index;
score=diag(score);
[score,order]=sort(score);
m=1:13;
plot(m,score(order).*10^15,'o');
hold on;
line=linspace(-0.01,-0.01,13);
plot(m,line,'r--');
xlabel('ָ�����');
ylabel('ָ��÷�');





