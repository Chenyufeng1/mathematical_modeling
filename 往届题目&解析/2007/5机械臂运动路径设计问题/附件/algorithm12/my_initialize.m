function M=my_initialize(popsize)
%����Ⱥ���ģΪpopsize�ĳ�ʼȺ��
% popsize=20;
M=zeros(6,popsize);
lb=[-255 -255 -115 -510 -510 -370];
ub=[255   255  395  510  510  650];
for i=1:6
    M(i,:)=rand(1,popsize).*(ub(i)-lb(i))+lb(i);
end


