function b=symmetrix(a)
%this function is used for symmetrize the matrix of a and return a value
%fit for pose estimation.
%������ܺ�����ʹa�ľ���ԳƲ����ҵ����ʵķ�λ����

[x,y]=size(a);
v=zeros(2*x,y);
flag=0;
for m=1:x
    for n=1:y
        v(m,n)=a(x-flag,n);
        v(m+x,n)=a(m,n);
    end
    flag=flag+1;
end
b=v;