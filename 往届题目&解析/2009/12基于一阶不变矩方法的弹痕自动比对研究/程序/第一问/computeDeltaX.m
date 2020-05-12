% ȷ����ͷ��ˮƽλ��
clear,clc
close all

% result.mat ����ZiTaiTiaoZheng.m������������ļ�
load result.mat % data, data_result, ANS

data = data_result;


x = data(1:564,1);
z = correctZround(data(:,3));
    
zz = zeros(756,564);
for I = 1:756
    zz(I,:) = z((I-1)*564+1:I*564);
end
    
Mean_Z = mean(zz,1);

% ��ʾƽ���������    
plot(x,Mean_Z,'k','LineWidth',2)
  
% ��ƽ��ֵ���ж���ʽ���
P = polyfit(x',Mean_Z,2); %  Z = P(1)*x.^2 + P(2)*x + P(3)    
Z_new = P(1)*x.^2 + P(2)*x + P(3);
% Ѱ�ҶԳ����x����
ind = find(Z_new == max(Z_new));
% ��ʾ��Ϻ�����ߺͶԳ�����������ߵĽ���
hold on
plot(x(ind),max(Z_new),'ks','LineWidth',2)
plot(x,Z_new,'k:','LineWidth',2)
xlabel('X(mm)')
ylabel('Z(mm)');
    
% �Գ����X���꣬����ͷ��x�᷽��λ��� 
Position = x(ind); 

