function correlation
% �����������㷽�����ĸ�ָ��֮������ȷ���
data=load('index_4_data.txt');
x0=data(:,1);
x1=data(:,2);
x2=data(:,3);
x3=data(:,4);

%�޳�0Ԫ��,���Ҿ�ֵ������
L=x0>0;
x0=x0(L);
x0=x0./mean(x0);
x1=x1(L);
x1=x1./mean(x1);
x2=x2(L);
x2=x2./mean(x2);
x3=x3(L);
x3=x3./mean(x3);

data=[x0,x1,x2,x3];
%�ڶ������������
delta=[abs(x0-x1),abs(x0-x2),abs(x0-x3)];

%����������������������С��
deltamax=max(max(delta));
deltamin=min(min(delta));

%���Ĳ����������ϵ��
yi=(deltamin+0.5*deltamax)./(delta+0.5*deltamax);

%���岽�����������
l=length(yi);
r=sum(yi)./l