function main
%���������������һ��ִ��
%  Author : LIU Chao  
%  e-mail : liuchao-will@163.com
%  School of Computer Science and Technology,Southeast
%  University,China,Sept.2010  
clear all;%��չ����ռ���������
[M,h]=data_pros;%ȡ�����ݺͻ���ID ,����������Դ��project_data.xls
M_init=M;%ԭʼ����
M=stdTrans(M);%��׼���任
[M_sorted,h_sorted]=relief_new(M,h);%�Ծ���FSC��������
a=zhucheng(M_sorted);%���ɷַ���
% �ҵ�61�о������FSC�Ļ���
data61 = M_sorted(:,(1:61));%ȡ����61������
data61h=h_sorted(1:61);%ȡ����61�����ݵĻ���ID
[h_min,err_min]=RFE_Relief(data61,data61h);%�ҵ������������С�����Ļ�����
h_min
err_min