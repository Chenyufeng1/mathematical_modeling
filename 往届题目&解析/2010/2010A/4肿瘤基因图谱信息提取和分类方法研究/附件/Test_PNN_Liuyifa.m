clc;
clear all;


% P����������, T�Ǳ�ʾ���������±����
fid1=fopen('pre_pro.txt','r');
data1=fscanf(fid1,'%g',[62,1909]);
data=data1';

biaohao=[1696 643 1560 457 1855 1094 1798 67 691];%����+���ɷ�0.5�����������

for i=1:40
    k(i)=i
end
for m=1:40
    if k(m)==1
        for i=1:length(biaohao)
            for j=1:1909
               if (j==biaohao(i))  
                  P1=data(j,2:14);
                  P2=data(j,23:48);
            
                  P(i,1:39)=[P1 P2];
                  
                break;
               end
            end
        end
    elseif (k(m)>1)&(k(m)<14)
for i=1:length(biaohao)
    for j=1:1909
        if (j==biaohao(i))  
            P1=data(j,1:(k(m)-1));
            P2=data(j,(k(m)+1):14);
            P3=data(j,23:48);
            P(i,1:39)=[P1 P2 P3];
            break;
        end
    end
end
    elseif k(m)==14
        for i=1:length(biaohao)
            for j=1:1909
               if (j==biaohao(i))  
                  P2=data(j,1:13);
                  P3=data(j,23:48);
            
                  P(i,1:39)=[P2 P3];
                break;
               end
            end
        end
    elseif k(m)==15
        for i=1:length(biaohao)
            for j=1:1909
               if (j==biaohao(i)) 
                  P1=data(j,1:14);
                  P2=data(j,24:48);
                 % P2=data(j,(k(m)+1):14);
            
                  P(i,1:39)=[P1 P2];
                break;
               end
            end
        end
    elseif (k(m)>15)&(k(m)<40)
        for i=1:length(biaohao)
            for j=1:1909
               if (j==biaohao(i)) 
                  P1=data(j,1:14);
                  P2=data(j,23:(k(m)+8-1));
                  P3=data(j,(k(m)+8+1):48);
            
                  P(i,1:39)=[P1 P2 P3];
                break;
               end
            end
        end
    elseif k(m)==40
        for i=1:length(biaohao)
            for j=1:1909
               if (j==biaohao(i)) 
                  P1=data(j,1:14);
                  P2=data(j,23:47);
                 
                  P(i,1:39)=[P1 P2];
                break;
               end
            end
        end
        

    end


 %T1=[1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
 if (k(m)>=1)&(k(m)<=14)
 T1=[ 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
 end
 if (k(m)>=15)&(k(m)<=40)
 T1=[ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
 end
% ���±�����Ϊ��ֵʸ������Ϊ�����Ŀ�����
T=ind2vec(T1);

%  ��Ƹ���������
sp=0.1; %��չ���� 
net=newpnn(P,T,sp);

%  ��������з��棬�����������
Y=sim(net,P);
Y1=vec2ind(Y);

%  ��һ���µ����ݽ��з���
if (k(m)>=1)&(k(m)<=14)
for i=1:length(biaohao)
    for j=1:1909
        if (j==biaohao(i))  
            P3=data(j,k(m));
            
            PP(i,1)=[P3];
            break;
        end
    end
end
elseif (k(m)>=15)&(k(m)<=40)
    for i=1:length(biaohao)
    for j=1:1909
        if (j==biaohao(i))  
            P3=data(j,k(m)+8);
            
            PP(i,1)=[P3];
            break;
        end
    end
    end
end
    

 Y=sim(net,PP);
 Y1(i)=vec2ind(Y);
end
correct=0;
for i=1:39
    if (i<=14)&(Y1(i)==1)
        correct=correct+1;
    elseif (i>=15)&(Y1(i)==2)
        correct=correct+1;
    end
end

correct_ratio=(correct+1)/40;
fprintf('��ȷ������%g\n\n',correct+1);
fprintf('��ȷ�ʣ� %g\n\n',correct_ratio);
