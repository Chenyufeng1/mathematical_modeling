function err=svm_process(D)
%SVMѵ����������ע��D���з�Ϊ���࣬�����������ݵ�ά��
%  Author : LIU Chao  
%  e-mail : liuchao-will@163.com
%  School of Computer Science and Technology,Southeast
%  University,China,Sept.2010  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% D(:,3:end)=[];
X1=D(1:10,:);
X2=D(45:62,:);
trnX = [X1;X2];
Y1 = ones(10,1);
Y2 = -ones(18,1);
trnY = [Y1;Y2];
C=20000;
ker='rfb';%erfb��֮���н��һ��
[nsv alpha bias] = svc(trnX,trnY,ker,C);%ѵ��
% svcplot(trnX,trnY,ker,alpha,bias);

X3=D(11:22,:);
X4=D(23:44,:);
tstX = [X3;X4];
Y3 = ones(12,1);
Y4 = -ones(22,1);
tstY = [Y3;Y4];
predictedY = svcoutput(trnX,trnY,tstX,ker,alpha,bias);%����
% predictedY = knnclassify(tstX, trnX,trnY);
% svcplot(tstX,predictedY,ker,alpha,bias);
err = svcerror(trnX,trnY,tstX,tstY,ker,alpha,bias);




