
clc,clear all
BB=load('project data2.txt');
[nnn,mmm]=size(BB);
B=sum(BB);
A = zeros(nnn,mmm);
for i=1:mmm
    A(:,i)=nnn*BB(:,i)/B(i);
end
for i=1:1:nnn
    xmean=sum(A(i,1:22))/22;
    ymean=sum(A(i,23:62))/40;
    xvar=var(A(i,1:22));
    yvar=var(A(i,23:62));
    H(i,1)=xmean;
    H(i,2)=ymean;
    H(i,3)=xvar;
    H(i,4)=yvar;
    H(i,5)=0.5*abs(xmean-ymean)/(xvar^0.5+yvar^0.5)+0.5*log((xvar+yvar)/2/xvar^0.5/yvar^0.5);%������Ϣָ��
    H(i,6)=i;
end

%-----------23��32��ѡȡ������Ϣָ������0.2�Ļ������DD.txt�У�����DD(:,1)Ϊ���еı�ţ�DD(:,2)Ϊ��Ӧ�Ļ�����
pork=1;
for j=1:nnn
    if H(j,5)>0.2
        D(pork,:)=A(j,:);
        DD(pork,:)=[pork,j];%DD(:,1)���еĻ����ţ�DD(:,2)��Ӧ������
        pork=pork+1;
    end
end
save('DD.txt','DD','-ascii');


%--------------------ɸѡ������ϵ������ R
RNN=abs(corrcoef(D(:,1:22)'));  %����������ɸѡ������ϵ������314*314�ķ���
RDD=abs(corrcoef(D(:,23:62)'));  %����������ɸѡ������ϵ������314*314�ķ���
%----------------------------------------
RN = 1 - RNN;%����������ɸѡ��ľ������
RD = 1 - RDD;%����������ɸѡ��ľ������

%------------------��С������43��63
W=triu(RN);
[i,j,v]=find(W);
WEI=[i j v];
demensionMat = length(RN);
[TRNN,d]=mst_kru(WEI,demensionMat);

W=triu(RD);
[i,j,v]=find(W);
WEI=[i j v];
demensionMat = length(RD);
[TRDD,d]=mst_kru(WEI,demensionMat);

fp1 =fopen('MST_RN.txt','wt');
fp2 =fopen('MST_RD.txt','wt');
for i=1:1:length(TRNN)
    fprintf(fp1,'%d %d\n',TRNN(i,1),TRNN(i,2));%������������С������
    fprintf(fp2,'%d %d\n',TRDD(i,1),TRDD(i,2));%������������С������
end
fclose(fp1);
fclose(fp2);
%------------------------------
TRN=zeros(length(TRNN));
TRD=zeros(length(TRDD));
for i = 1 : length(TRNN)
    TRN(TRNN(i,1),TRNN(i,2))=1;TRN(TRNN(i,2),TRNN(i,1))=1;%������������С���������ڽӾ���
    TRD(TRDD(i,1),TRDD(i,2))=1;TRD(TRDD(i,2),TRDD(i,1))=1;%������������С���������ڽӾ���
end

%---------------------------Ѱ����ֵ����1-----------------------------------
%------------------------------normal����ֵ-------------------------------
indexN = [2 38 39 58 66 68 83 90 114 122 130 155 163 180 198 205 207 213 219 220 222 237 248 256 257 269 270 279 288 290 294 296 297 306];%�������׵õ���34���²�����ڵ������еı��

POKE=[];
nap=0;
for i=2:length(indexN)
    for j=1:i-1
        if TRN(indexN(i),indexN(j))==1|TRN(indexN(j),indexN(i))==1
            nap=nap+1;
            POKE(nap,1)=RNN(indexN(i),indexN(j));
        end
    end
end
thresholdNI=min(POKE) %����һ�ҵ���������������ֵ

fp = fopen('NetNorI.txt','wt');
linkId = 0;
for i = 1 : length(RNN)-1
    for j = i+1 : length(RNN)
        if RNN(i,j) > thresholdNI
            linkId = linkId+1;
            linksN(linkId,1) = i;
            linksN(linkId,2) = j;
            fprintf(fp,'%d %d\n',i,j);
        end
    end
end
fclose(fp);

POKE=[];
nap=0;
for i=2:length(indexN)
    for j=1:i-1
        if TRD(indexN(i),indexN(j))==1|TRD(indexN(j),indexN(i))==1
            nap=nap+1;
            POKE(nap,1)=RDD(indexN(i),indexN(j));
        end
    end
end
thresholdDI=min(POKE)%����һ�ҵ���������������ֵ

fp = fopen('NetDisI.txt','wt');
linkId = 0;
for i = 1 : length(RDD)-1
    for j = i+1 : length(RDD)
        if RDD(i,j) > thresholdDI
            linkId = linkId+1;
            linksD(linkId,1) = i;
            linksD(linkId,2) = j;
            fprintf(fp,'%d %d\n',i,j);
        end
    end
end
fclose(fp);
%--------------------------------------------------------------------------


%---------------------------Ѱ����ֵ����2-----------------------------------
%--------------------------ȡǰ50���㵽MST��--------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
[HHH,IX] = sort(H(:,5),'descend');
setNum = 50;
NodeId = zeros(setNum,2);
NodeId(:,2) = IX(1:setNum);

for i=1:setNum
    for j=1:length(DD(:,2))
        if IX(i)==DD(j,2)
            NodeId(i,1)=DD(j,1);
        end
    end
end

indexN = NodeId(:,1);

POKE=[];
nap=0;
for i=2:length(indexN)
    for j=1:i-1
        if TRN(indexN(i),indexN(j))==1|TRN(indexN(j),indexN(i))==1
            nap=nap+1;
            POKE(nap,1)=RNN(indexN(i),indexN(j));
        end
    end
end
thresholdNII=min(POKE)%�������ҵ���������������ֵ
                               %-------------------------���ɸ�������normal-----
fp = fopen('NetNorII.txt','wt');
linkId = 0;
for i = 1 : length(RNN)-1
    for j = i+1 : length(RNN)
        if RNN(i,j) > thresholdNII
            linkId = linkId+1;
            linksN(linkId,1) = i;
            linksN(linkId,2) = j;
            fprintf(fp,'%d %d\n',i,j);
        end
    end
end
fclose(fp);


POKE=[];
nap=0;
for i=2:length(indexN)
    for j=1:i-1
        if TRD(indexN(i),indexN(j))==1|TRD(indexN(j),indexN(i))==1
            nap=nap+1;
            POKE(nap,1)=RDD(indexN(i),indexN(j));
        end
    end
end
thresholdDII=min(POKE) %�������ҵ���������������ֵ
%-------------------------���ɸ�������diserse-------------------------------
fp = fopen('NetDisII.txt','wt');
linkId = 0;
for i = 1 : length(RDD)-1
    for j = i+1 : length(RDD)
        if RDD(i,j) > thresholdDII
            linkId = linkId+1;
            linksD(linkId,1) = i;
            linksD(linkId,2) = j;
            fprintf(fp,'%d %d\n',i,j);
        end
    end
end
fclose(fp);
%--------------------------------------------------------------------------

X=[];
X=load('NetNorI.txt');
leng=max(max(X));
NetNor1T=zeros(leng,leng);
for i=1:length(X)
    NetNor1T(X(i,1),X(i,2))=1;
    NetNor1T(X(i,2),X(i,1))=1;
end
poke=0;
GNor=(sum(NetNor1T))';%����һ������������������Ķ�����
% A=zeros(1,max(GNor));
% for i=1:1:length(GNor)
%     A(GNor(i))=A(GNor(i))+1;
% end
% DEGE(:,:)=[1:max(GNor),A/length(GNor)];%�ȷֲ�

Y=[];
Y=load('NetDisI.txt');
leng=max(max(Y));
NetDis1T=zeros(leng,leng);
for i=1:length(Y)
    NetDis1T(Y(i,1),Y(i,2))=1;
    NetDis1T(Y(i,2),Y(i,1))=1;
end
poke=0;
GDis=(sum(NetDis1T))';%����һ������������������Ķ�����






















