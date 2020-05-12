%function [MinD,BestPath]=MainAneal(CityPosition,pn) 
%�������й�31ʡ����е��������·��Ϊ��������TSP�����ģ���˻����
%CityPosition_31=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;...
%                 3238 1229;4196 1044;4312  790;4386  570;3007 1970;2562 1756;...
%                 2788 1491;2381 1676;1332  695;3715 1678;3918 2179;4061 2370;...
%                 3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2376;...
%                 3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;2370 2975];

%T0=clock
clear
global DD %path Ϊ·����pnΪ���з���
load data
load data_you
m=max(size(D));
  temp=zeros(m+2);
  temp(1:m,1:m)=D;
 for i=1:2
   temp(m+i,:)=[D(1,:),ones(1,2)*9999];
   temp(m+i,1)=9999;
   temp(:,m+i)=temp(m+i,:)';
 end
 D=temp;
 temp=0;
[m,pn]=size(D);   %m.pn���ܸ���
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
	path(1,:)=[1	10	17	4	3	6	18	13	14	2	16	15	19	5	7	8	12	9	11	 ];
%path(1,:)=[1	6	7	8	9	12	16	19	13	17	10	5	11	18	14	2	3	4	15];
%path(1,:)=[1 6 5 4 3 2 14 18 7 8 9 10 17 19 15 16 11 12 13];
% path(2,:)=[  1    13     7     3    14     2    12    18    16     9    ...
 %    17     6    11    19     5    10     4     8  15 ];
t=zeros(1,pn);    %��С��ֵ
R=rand(1,pn);     %���ʷ�ֵ
%p2=zeros(1,m);

iter_max=256;%input('������̶��¶�������������iter_max=' );
m_max=16;%input('������̶��¶���Ŀ�꺯��ֵ������������δ�Ľ�����m_nax=' ) ;
%������ǵ����³����½ⱻ���ո��ʽϴ���������ֲ�����
%�����Ž��µĽ����½ⱻ���յĸ����𽥼��٣���������������
%��Ϊ��ʹ���� iter_max,m_max ��С��Ȼ��ʹ֮���¶Ƚ��Ͷ�������,����
%���յ����ȽϺõ�Ч��

tuo=0.9;                %�¶��½��ݶ�
T=9999%sum(max(D));          %��ʼ�¶�
tau=0.1;%input('����������¶�tau=' );
N=1;
         
        for i=1:pn
               temp_m=0;j=0;k=0;temp=0;p=0;
                 temp_m=find(path(i,:)>m-2);
                 temp_m=[1 temp_m m+1];p=[path(i,:) 1];
           if all((temp_m(2:4)-temp_m(1:3))>1) & ...
                (dis(p(temp_m(1):temp_m(2))) & dis(p(temp_m(2):temp_m(3))) & ...
                    dis(p(temp_m(3):temp_m(4))))
                 temp=zeros(m,1);
               for j=1:3
                  if(fun(p(temp_m(j)+1:temp_m(j+1)-1)-1))
                     temp(temp_m(j))=sum(DD(p(temp_m(j)+1:temp_m(j+1)-1)-1,1));  
                    for k=1 :(temp_m(j+1)-temp_m(j)-1)
                     temp(temp_m(j)+k)=temp(temp_m(j)+k-1)...
                          -DD(p(temp_m(j)+k)-1,1)+DD(p(temp_m(j)+k)-1,2);
                    end
                  else
                     temp=zeros(m,1);;%sum([D(path(i,1:m-1)+m*(path(i,2:m)-1)) D(path(i,m)+m*(path(i,1)-1))])+99999;
                      break 
                  end
                end
                if abs(sum(temp))>0.00001
                  Len1(i)=[D(path(i,1:m-1)+m*(path(i,2:m)-1)) D(path(i,m)+m*(path(i,1)-1))]*((65-temp)/65*2);
                else
                  Len1(i)=9999;
                end
             else
               Len1(i)=9999;
             end
                  %����һ���б����г��е���·�� 
        end
           path2=path;Len2=Len1;
while  T>=tau %&m_num<m_max          
       iter_num=1;%ĳ�̶��¶��µ���������
       m_num=1;%ĳ�̶��¶���Ŀ�꺯��ֵ����δ�Ľ�����������
       %iter_max=100;
       %m_max=10;%ceil(10+0.5*nn-0.3*N);       
       while m_num<m_max & iter_num<iter_max
        %MRRTT(Metropolis, Rosenbluth, Rosenbluth, Teller, Teller)����:
             %����������ʽ�㷨��path������N(path)���ҳ��µĸ��Ž�
          for i=1:pn
             [path2(i,: )]=[1,ChangePath2(path(i,2:m ),m-1)];%����·��
              temp_m=0;p=0;temp=0;j=0;k=0;
              temp_m=find(path2(i,:)>m-2);
                 temp_m=[1 temp_m m+1];p=[path2(i,:) 1];
             if all((temp_m(2:4)-temp_m(1:3))>1) & ...
                (dis(p(temp_m(1):temp_m(2))) & dis(p(temp_m(2):temp_m(3))) & ...
                     dis(p(temp_m(3):temp_m(4))))
                 temp=zeros(m,1);
               for j=1:3
                  if(fun(p(temp_m(j)+1:temp_m(j+1)-1)-1))
                     temp(temp_m(j))=sum(DD(p(temp_m(j)+1:temp_m(j+1)-1)-1,1));  
                    for k=1 :(temp_m(j+1)-temp_m(j)-1)
                     temp(temp_m(j)+k)=temp(temp_m(j)+k-1)...
                          -DD(p(temp_m(j)+k)-1,1)+DD(p(temp_m(j)+k)-1,2);
                    end
                  else
                     temp=0;;%sum([D(path(i,1:m-1)+m*(path(i,2:m)-1)) D(path(i,m)+m*(path(i,1)-1))])+99999;
                      break 
                  end
               end
                if abs(sum(temp))>0.00001
                  Len2(i)=[D(path2(i,1:m-1)+m*(path2(i,2:m)-1)) D(path2(i,m)+m*(path2(i,1)-1))]*((65-temp)/65*2);
                  %һ��Ҫע��
                else
                  Len2(i)=9999;
                end
             else
               Len2(i)=9999;
             end
                  %����һ���б����г��е���·�� 
             end
             
            %temp=find((Len2-Len1<t|(exp((Len1-Len2)/T)>R & (Len1-Len2)>t) | (rand(1,m)>0.372))~=0);
             temp=find((Len2-Len1<t|(exp((Len1-Len2)/T)>R ))~=0);
                    %Ŀ��ֵ����ʱ�������
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
         min(Distance)
       T=T*tuo
end 
save data_1 TracePath  Distance
clear
%[MinD,Index]=min(Distance)
%BestPath=TracePath(Index,: )
%disp(MinD)
%T1=clock