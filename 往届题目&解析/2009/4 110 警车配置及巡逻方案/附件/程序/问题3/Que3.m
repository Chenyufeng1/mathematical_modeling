clear;
load ����6����ĵ�·��Ϣ��W����.mat;
load ѡ��Ļ�·�����ĵ�.mat;

bcnnum=length(BigRoadCircleNode);
msnnum=length(MiddleSquareRoadNode);
scnnum=length(SmallRoadCircleNode);
othernum=length(OtherNode);


%����󻷵�·������
length=0;
for l=1:(bcnnum-1)
   for m=1:464
       if (BigRoadCircleNode(l,1)==Road2(m,2) && BigRoadCircleNode(l+1,1)==Road2(m,3))||(BigRoadCircleNode(l,1)==Road2(m,3) && BigRoadCircleNode(l+1,1)==Road2(m,2))
           length=length+Road2(m,8);
       end
   end
end
for m=1:464
       if (BigRoadCircleNode(bcnnum,1)==Road2(m,2) && BigRoadCircleNode(1,1)==Road2(m,3))||(BigRoadCircleNode(bcnnum,1)==Road2(m,3) && BigRoadCircleNode(1,1)==Road2(m,2))
           length=length+Road2(m,8);
       end
end


%������ܸ��ǵ��Ľ��
D=0;
D(bcnnum,313)=0;

for l=1:bcnnum
   [S,D0]=minRoute(BigRoadCircleNode(l,1),313,W2,1);
   D(l,:)=D0;
end

m=0;
for l=1:313
   D1(1,l)=min(D(:,l)); 
   if D1(1,l)<2000
       m=m+1;
       dahuanfugaijiedian(1,m)=l;
   end
end
dahuanfugaijiedianshu=m;

%�����м䷽���ܸ��ǵ��Ľ��
D=0;
D(msnnum,313)=0;

for l=1:msnnum
   [S,D0]=minRoute(MiddleSquareRoadNode(l,1),313,W2,1);
   D(l,:)=D0;
end

m=0;
for l=1:313
   D2(1,l)=min(D(:,l)); 
   if D2(1,l)<2000
       m=m+1;
       zhonghuanfugaijiedian(1,m)=l;
   end
end
zhonghuanfugaijiedianshu=m;

%����С���ܸ��ǵ��Ľ��
D=0;
D(scnnum,313)=0;

for l=1:scnnum
   [S,D0]=minRoute(SmallRoadCircleNode(l,1),313,W2,1);
   D(l,:)=D0;
end

m=0;
for l=1:313
   D3(1,l)=min(D(:,l)); 
   if D3(1,l)<2000
       m=m+1;
       xiaohuanfugaijiedian(1,m)=l;
   end
end
xiaohuanfugaijiedianshu=m;

%��������4�����ĵ��ܸ��ǵ��Ľ��
D=0;
D(othernum,313)=0;

for l=1:othernum
   [S,D0]=minRoute(OtherNode(l,1),313,W2,1);
   D(l,:)=D0;
end

m=0;
for l=1:313
   D4(1,l)=min(D(:,l));
   if D4(1,l)<2000
       m=m+1;
       qitafugaijiedian(1,m)=l;
   end
end
qitafugaijiedianshu=m;

%�������л�·�����ĵ��ܸ��ǵ��Ľ��
D=0;
D=[D1;D2;D3;D4];
m=0;
for l=1:313
   D0(1,l)=min(D(:,l)); 
   if D0(1,l)<2000
       m=m+1;
       quanbufugaijiedian(1,m)=l;
   end
end
quanbufugaijiedianshu=m;
