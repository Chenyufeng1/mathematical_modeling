%clear
global  n distance
 % load D:\chengxu\m2\D2 D2
   distance=D2;  
for n=4:6
 if n>0
    cities = max(size(distance));
    temp=zeros(cities+n);
    temp(1:cities,1:cities)=distance;
  for i=1:n
     temp(cities+i,:)=[distance(1,:),ones(1,n)*9999];
     temp(cities+i,1)=9999;
     temp(:,cities+i)=temp(cities+i,:)';
  end
    distance=temp;
 end
   [m,pn]=size(distance);
   Distance=inf*ones(10000,1);
   TracePath=inf*ones(10000,m);
   path=zeros(pn,m);
 for i=1:pn
     path(i,:)=[1,randperm(m-1)+1];%����һ����ʼ���н�
 end
  %path(1,:)=[1	6	18	19	7	10	23	11	9	8 20	12	14	13	...
  %    24	16	17	21	15	25	4	3	22	2	5	1];
  %    24	16	17	21	15	25	4	3	22	2	5];

  %  path(1,:)=[1	6	18	5	23	11	12	13	14	15	21	17	16	24 ...
  %       3	2	22	4	25	10	8	19	20	9	7];%n=4ʱ������ֵ
  %load path  %n=4ʱ
% path=path(1:pn,:);  %����
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
   T=9999;%(1/0.9)^150;%sum(max(D));          %��ʼ�¶�
   tau=0.1;%input('����������¶�tau=' );
   N=1;
   Len1=zeros(1,pn);
      for i=1:pn
         %Len1(i)= sum([distance(path(i,1:m-1)+m*(path(i,2:m)-1)) distance(path(i,m)+m*(path(i,1)-1))]);
         Len1(i)=D2_fitness_2(path(i,: ));                       
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
                 %Len2(i)= sum([distance(path2(i,1:m-1)+m*(path2(i,2:m)-1)) distance(path2(i,m)+m*(path2(i,1)-1))]);
                  Len2(i)=D2_fitness_2(path2(i,: ));                       
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
       min(Distance);
       T=T*tuo;
 end
 n
 [m1 m2]=min(Distance);
   if m1<9999
    TracePath(m2,:)
     m1
   end
end
