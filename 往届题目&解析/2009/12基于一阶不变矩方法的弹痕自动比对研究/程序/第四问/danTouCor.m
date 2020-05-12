%danTouCor
% ����4������ĵ�2С�ʣ��������ڱ���ans4_2�кʹ���ans4_2.mat��
% ���ʱ��Ҫ�õ���4�������1С�ʵĽ������eigenVal.mat��������ͷ�������۵����ƶȣ�
%
clc
clear all
%th = (0.001733041616609 + 6.250128440027647e-004) / 2; %10
th = 0.0009; %12
%th = 0.0007; %11
load eigenVal.mat
data4_2 = ones(22,22) * realmax; % һ����22����ͷ

%% ��������2����ͷ֮������ƶ�
for gunNumi = 1:21
    for gunNumj = gunNumi+1:22
        indexi = [1:4] + (gunNumi-1)*4;
        indexj = [1:4] + (gunNumj-1)*4;
        p = 10000;
        for ii=1:4 % ÿ������ͷ�Ĳ�����4��ƥ�䷽ʽ
            corArr = zeros(4,1);
            indexjRot = circshift(indexj,ii-1);
            for aa=1:4  %����ÿ��ƥ�䣬����4�����
              eigenId = map2pos(indexi(aa),indexj(aa),88);
              corArr(aa) = abs(eigenVal(eigenId,7));
            end
            corArr = sort(corArr);
            
            pTemp = mean(corArr(find(corArr<th)));
            %pTemp = sum(corArr(1:3));  % ѡȡ�����ӵ������Ƶ���������������ӵ���������
            if pTemp < p
                p = pTemp;
            end
        end
        data4_2(gunNumi,gunNumj) = p;    
    end
end
save data4_2.mat data4_2

%% �ҳ���i����ͷ�����Ƶ�ǰn����ͷ
n = 5;
[row col] = size(data4_2);
for ii=2:row
    for jj=1:ii-1
        data4_2(ii,jj) = data4_2(jj,ii);
    end
end
ans4_2 = zeros(row,n);
for ii=1:row
    [Y I] = sort(data4_2(ii,:));
    ans4_2(ii,:) = I(1:n);
end

%save ans4_2.mat ans4_2