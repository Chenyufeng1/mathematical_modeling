function  h_des=RFE_Relief1(M,h)
%��M�������ţ�ʹ��ÿ�е�RFSC����������
%  Author : LIU Chao  
%  e-mail : liuchao-will@163.com
%  School of Computer Science and Technology,Southeast
%  University,China,Sept.2010  
% M=stdTrans(M);%��׼���任

h_gab={};
M_gab=[];
i=1;
while ~isempty(h)
    [M,h]=relief(M,h);    
    h_gab(i)=h(length(h));
    [r,c]=size(M);    
%     M_gab(:,i)=M(:,c);
    i=i+1;
    h(length(h))=[];
    M(:,c)=[];        
end
% ��ʱM�ǿվ��� 62 by 1
% [r1,c1]=size(M_gab); 
% for j=1:1:c1
%     M_des(:,j)= M_gab(:,c1+1-j);
% end
l=length(h_gab);
for k=1:1:l
    h_des(k)=h_gab(l+1-k);
end
h_des=h_des';