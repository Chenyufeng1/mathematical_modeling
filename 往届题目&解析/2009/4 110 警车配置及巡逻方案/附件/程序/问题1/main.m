%p1=[1,0];
%p2=[3,0];
%W2=addtwopoints(W,Road,p1,p2);
%[S,D]=minRoute(308,309,W2,1);
clear;
load ����6����ĵ�·��Ϣ��W����.mat;
%����
%����������Ŀ
cnum=13;
%���ѡȡ���ģ�C�ĵ�һ��Ϊ�����ĵĵ�ţ��ڶ���Ϊÿһ���а������ٸ���
C=floor(314*rand(1,cnum));

%juleilist�ڶ������ڴ��ÿ�������ڵڼ���
juleilist=[1:313];
juleilist(2,1)=0;

for n=1:10000
    
%D���ڴ��ÿ�����ľ���ͼ�����е�ľ���
D=0;
D(cnum,313)=0;
for l=1:cnum
    [S,D0]=minRoute(C(1,l),313,W2,1);
    D(l,:)=D0;
end

%��ÿ����ֵ���������������Ǹ�����
for l=1:313
    [x,juleilist(2,l)]=min(D(:,l));
end

%ͳ�ƣ�C�ĵڶ���Ϊÿһ���а������ٸ��㣬juleilist2��ÿһ��Ϊ��������ĵ��б�
C(2,1)=0;
juleilist2=0;
for m=1:cnum
    for l=1:313
        if(juleilist(2,l)==m)
            C(2,m)=C(2,m)+1; 
            juleilist2(C(2,m),m)=juleilist(1,l);
        end
    end    
end

%���ÿһ�࣬����ȷ��������,D���ڴ�Ÿ����У�ÿһ�����������307��ľ��룬
%D1���ڴ�Ÿ����У�ÿһ�����������������ľ���
%D2���ڴ�Ÿ����У�ÿһ�����������������ľ�������ֵ
%C2���ڴ���µ����ĵ��

for m=1:cnum
    D=0;
    D(C(2,m),313)=0;
    D1=0;
    D1(C(2,m),C(2,m))=0;
    D2=0;
   for l=1:C(2,m)       
       [S,D0]=minRoute(juleilist2(l,m),313,W2,1);
       D(l,:)=D0;
   end
   for l=1:C(2,m)
       D1(:,l)=D(:,juleilist2(l,m));
   end
   for l=1:C(2,m)
       D2(l,1)=max(D1(l,:));
   end
   [x,y]=min(D2);
   C2(1,m)=juleilist2(y,m);   
end

if C2==C(1,:)
    break;
else
    C(1,:)=C2;
    C(2,:)=0;
end

end

D=0;
D(cnum,313)=0;
for l=1:cnum
    [S,D0]=minRoute(C2(1,l),313,W2,1);
    D(l,:)=D0;
end
for l=1:313
    D0(1,l)=min(D(:,l));
end

m=0;
for l=1:313
    if D0(1,l)>2000
        m=m+1;
    end
end
jiedianfugailv=(313-m)/313;

m=0;
for l=1:464
    if D0(1,Road2(l,2))<2000||D0(1,Road2(l,3))<2000
        m=m+Road2(l,8);
    end
end
daolufugailv=m/253685;