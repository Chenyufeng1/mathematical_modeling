function main
%����һ����������һ��ִ��
%  Author : LIU Chao  
%  e-mail : liuchao-will@163.com
%  School of Computer Science and Technology,Southeast
%  University,China,Sept.2010  
clear all;%��չ����ռ���������
[M,h]=data_pros;%ȡ�����ݺͻ���ID ,����������Դ��project_data.xls
M=stdTrans(M);%��׼���任
% err1911=svm_process(Y)
% h_des=RFE_Relief1(M,h)

[M_sorted,h_sorted]=relief(M,h);%�Ծ���FSC��������
%ʵ��֤����BFSC׼�����
a=zhucheng(M_sorted);%���ɷַ���
% �ҵ�61�о������FSC�Ļ���
data61 = M_sorted(:,(1:61));%ȡ����61������
% savefile = 'data62X61.mat';
% save(savefile, 'data61');
data61h=h_sorted(1:61);%ȡ����61�����ݵĻ���ID
% err61=svm_process(data61)

% h_des=RFE_Relief1(data61,data61h);
%��ʵM_des��data61һ����h_des��data61hһ��
% M_des==data61
% strcmp(h_des,data61h)

