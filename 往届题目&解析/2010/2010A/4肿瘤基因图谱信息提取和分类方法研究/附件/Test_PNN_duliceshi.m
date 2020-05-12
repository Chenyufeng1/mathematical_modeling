clc;
clear all;


% P����������, T�Ǳ�ʾ���������±����
fid1=fopen('pre_pro.txt','r');
data1=fscanf(fid1,'%g',[62,1909]);
data=data1';

biaohao=[1696 643 1560 457 27 1855 1094 1798 67 691 18 608 1108 1858 976];%����+���ɷ�0.5

L=length(biaohao);
for i=1:(2^L-1)
    for j=1:L
        two_bit(i,L+1-j)=bitget(i,j);
    end
end

for kk=1:2^L-1
    biaohao_hou=[];
    for j=1:L
        if two_bit(kk,j)==1
            biaohao_hou=[biaohao_hou biaohao(j)];
        
        end
    end
            
            
        
    
for i=1:length(biaohao_hou)
    for j=1:1909
        if (j==biaohao(i))  
            P1=data(j,1:14);
            P2=data(j,23:48);
            P(i,1:40)=[P1 P2];
            break;
        end
    end
end


 T1=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
% ���±�����Ϊ��ֵʸ������Ϊ�����Ŀ�����
T=ind2vec(T1);

%  ��Ƹ���������
sp=0.1; %��չ���� 
net=newpnn(P,T,sp);

%  ��������з��棬�����������
Y=sim(net,P);
Y1=vec2ind(Y);

%  ��һ���µ����ݽ��з���
for i=1:length(biaohao_hou)
    for j=1:1909
        if (j==biaohao(i))  
            P3=data(j,15:22);
            P4=data(j,49:62);
            PP(i,1:22)=[P3 P4];
            break;
        end
    end
end

 Y=sim(net,PP);
 Y1=vec2ind(Y);
 correct(kk)=0;
 for i=1:22
     if (Y1(i)==1)&(i<=8)
         correct(kk)=correct(kk)+1;
     elseif (Y1(i)==2)&(i>8)
         correct(kk)=correct(kk)+1;
     end
 end
end
correct=correct';

         
