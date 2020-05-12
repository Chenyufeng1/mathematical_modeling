clc;
clear all;


% P����������, T�Ǳ�ʾ���������±����
fid1=fopen('pre_pro.txt','r');
data1=fscanf(fid1,'%g',[62,1909]);
data=data1';

biaohao=[1696 643 1560 457 1855 1094 1798 67 691];%����+���ɷ�0.5�������



for i=1:length(biaohao)
    for j=1:1909
        if (j==biaohao(i))  
            P1=data(j,1:14);
            P2=data(j,23:48);
            P(i,1:40)=[P1 P2];
            break;
        end
    end
end

 %T1=[1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
 T1=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 ];
% ���±�����Ϊ��ֵʸ������Ϊ�����Ŀ�����
T=ind2vec(T1);


%  ��Ƹ���������
sp=0.1; %��չ���� 
net=newpnn(P,T,sp);

%  ��������з��棬�����������
Y=sim(net,P);
Y1=vec2ind(Y);
%[net,tr] = train(net,P,T);
%  ��һ���µ����ݽ��з���
for i=1:length(biaohao)
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
 correct=0;
 for i=1:22
     if (Y1(i)==1)&(i<=8)
         correct=correct+1;
     elseif (Y1(i)==2)&(i>8)
         correct=correct+1;
     end
 end
 correct_ratio=correct/22;
fprintf('��ȷ������%g\n\n',correct);
fprintf('��ȷ�ʣ� %g\n\n',correct_ratio);
