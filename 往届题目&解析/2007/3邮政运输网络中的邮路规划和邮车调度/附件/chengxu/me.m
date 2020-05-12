%function [MinD,BestPath]=MainAneal(CityPosition,pn) 
%�������й�31ʡ����е��������·��Ϊ��������TSP�����ģ���˻����
%CityPosition_31=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;...
%                 3238 1229;4196 1044;4312  790;4386  570;3007 1970;2562 1756;...
%                 2788 1491;2381 1676;1332  695;3715 1678;3918 2179;4061 2370;...
%                 3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2376;...
%                 3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;2370 2975];

%T0=clock
clear
global path p2 D DD TracePath  Distance %path Ϊ·����pnΪ���з���
load data
load data_you
[m,pn]=size(D);
Distance=inf*ones(10000,1);
TracePath=inf*ones(1000,m);
%global path p2 D TracePath  Distance
%[m,n]=size(CityPosition);
%���ɳ�ʼ��ռ䣬�������Ա��𲽷���ռ����п�һЩ
%TracePath=zeros(1e3,m);
%Distance=inf*zeros(1,1e3);
%D = sqrt((CityPosition( :,  ones(1,m)) - CityPosition( :,  ones(1,m))').^2 +...
%    (CityPosition( : ,2*ones(1,m)) - CityPosition( :,2*ones(1,m))').^2 );
%�����е��������ת��Ϊ�ڽӾ��󣨳��м�������
path=zeros(pn,m);
for i=1:pn
    path(i,:)=[1,randperm(m-1)+1];%����һ����ʼ���н�
end
t=zeros(1,pn);    %��С��ֵ
R=rand(1,pn);     %���ʷ�ֵ
%p2=zeros(1,m);

iter_max=100;%input('������̶��¶�������������iter_max=' );
m_max=5;%input('������̶��¶���Ŀ�꺯��ֵ������������δ�Ľ�����m_nax=' ) ;
%������ǵ����³����½ⱻ���ո��ʽϴ���������ֲ�����
%�����Ž��µĽ����½ⱻ���յĸ����𽥼��٣���������������
%��Ϊ��ʹ���� iter_max,m_max ��С��Ȼ��ʹ֮���¶Ƚ��Ͷ�������,����
%���յ����ȽϺõ�Ч��

tuo=0.9;                %�¶��½��ݶ�
T=1e6%sum(max(D));          %��ʼ�¶�
tau=0.1;%input('����������¶�tau=' );
N=1;
while  T>=tau %&m_num<m_max          
       iter_num=1;%ĳ�̶��¶��µ���������
       m_num=1;%ĳ�̶��¶���Ŀ�꺯��ֵ����δ�Ľ�����������
       %iter_max=100;
       %m_max=10;%ceil(10+0.5*nn-0.3*N);       
            for i=1:pn
                 temp_m=find(path(i,:)==m);
                 temp_m1=find(path(i,:)==m-1 );
                 if temp_m<temp_m1
                    temp=temp_m;
                    temp_m=temp_m1;
                    temp_m1=temp;
                 end
                 if temp_m1==2 | temp_m==m
                    Len1(i)=99999;
                 else
                   if fun(path(i,2:temp_m1-1)-1) & fun(path(i,temp_m1+1:temp_m-1)-1) & fun(path(i,temp_m+1:m)-1)
                      Len1(i)=sum([D(path(i,1:m-1)+m*(path(i,2:m)-1)) D(path(i,m)+m*(path(i,1)-1))]);
                   else
                      Len1(i)=99999;%sum([D(path(i,1:m-1)+m*(path(i,2:m)-1)) D(path(i,m)+m*(path(i,1)-1))])+99999;
                   end
                 end
                  %����һ���б����г��е���·�� 
           end
       while m_num<m_max & iter_num<iter_max
        %MRRTT(Metropolis, Rosenbluth, Rosenbluth, Teller, Teller)����:
             %����������ʽ�㷨��path������N(path)���ҳ��µĸ��Ž�
             for i=1:pn
                 [path2(i,: )]=[1,ChangePath2(path(i,2:m ),m-1)];%����·��
                 temp_m=find(path2(i,:)==m);
                 temp_m1=find(path2(i,:)==m-1);
                 if temp_m<temp_m1
                    temp=temp_m;
                    temp_m=temp_m1;
                    temp_m1=temp;
                 end
                 if temp_m1==2 | temp_m==m
                    Len2(i)=99999;
                 else
                   if fun(path2(i,2:temp_m1-1)-1) & fun(path2(i,temp_m1+1:temp_m-1)-1) & fun(path2(i,temp_m+1:m)-1)
                      Len2(i)=sum([D(path2(i,1:m-1)+m*(path2(i,2:m)-1)) D(path2(i,m)+m*(path2(i,1)-1))]);
                   else
                      Len2(i)=99999;%sum([D(path2(i,1:m-1)+m*(path2(i,2:m)-1)) D(path2(i,m)+m*(path2(i,1)-1))]);+999999;
                   end
                 end
                  %����һ���б����г��е���·�� 
             end
            % R=rand(1,pn);
            temp=find((Len2-Len1<t|exp((Len1-Len2)/T)>R)~=0);
            %temp=find((Len2-Len1<t|exp((Len1-Len2)/(T))>R|(Len1-Len2)/(T)<88)~=0);
             if temp
                 path(temp, : )=path2(temp, : );
                 Len1(temp)=Len2(temp);
                 [TempMinD,TempIndex]=min(Len1);
                 TracePath(N,: )=path(TempIndex,: );%��¼·��
                 Distance(N,: )=TempMinD;           %��¼��С·��ֵ
                 N=N+1;
                 m_num=0;
             else
                 m_num=m_num+1;
             end
             iter_num=iter_num+1;
         end
       T=T*tuo
end 
save data D TracePath  Distance
clear
%[MinD,Index]=min(Distance)
%BestPath=TracePath(Index,: )
%disp(MinD)
%T1=clock