function flag=my_ifinregion(x)
%��֤x�Ƿ��ڶ�������
lb=[-255 -255 -115 -510 -510 -370]';
ub=[ 255  255  395  510  510  650]';
y=[(x>=lb) (x<=ub)];
if nnz(y)==12
    flag=1;
else
    flag=0;
end