function Y=stdTrans(X)
%�Ծ���X���б�׼���任��
%����X�д����������д������
%  Author : LIU Chao  
%  e-mail : liuchao-will@163.com
%  School of Computer Science and Technology,Southeast
%  University,China,Sept.2010  
[r,c]=size(X);
average=mean(X);
stdd=std(X);
for j=1:1:c
    for i=1:1:r
        Y(i,j)=(double(X(i,j)-average(j)))/stdd(j);
    end
end


