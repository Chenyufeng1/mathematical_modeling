function y = DeNoise_v2(data)
% ���룺��ά������3�У��ֱ��ʾx��y��z�᣻��������
% �������ά����ά���ʹ�Сͬ����һ����
% ���ܣ��������Ԫ���Ⱥ�����������ȥ��������ȥ������������4��ͼ��
%      ԭʼ���ݵ�ͼ��ȥ���������������ͼ��ȥ����������������
%      ������ͼ��ȥ����������������֮�͵�ͼ��

%% ͼ������ϵ
x = 1:564;
y = 1:756;
[xx,yy] = meshgrid(x,y);


%%
dataDeNoise = data;
%% ȥ�����ͼ�����ɵ����
for gunNum = 1%1:6
    for zdSeq = 1 %1:2
        for lineSeq = 1 %1:4
            data1 = squeeze(data(gunNum,zdSeq,lineSeq,:,:));
            z = CorrectZround(data1(:,3));         
           %% �õ�Z��ƽ�����
            zz = zeros(756,564);
%             for I = 1:756
%                 zz(I,:) = z((I-1)*564+1:I*564);
%             end      
            zz = reshape(z,756,564);
            
            
            %%
            ori = zz;
            figure % ԭʼͼ��
            mesh(xx,yy,zz)
            xlabel('X')
            ylabel('Y');
            zlabel('Z');
            title('ԭʼͼ��')
            
            %%
            zz_deNoise = zz;
            %% �ռ������ƽ��
            %T  =  mean(zz)/10; % ��ֵ
            [row col] = size(zz);
            T = (max(max(zz))-min(min(zz)))/(row*col);
            for K = 2:563
                for I = 2:755
                    G = 1/8 * (zz(I-1,K-1)+zz(I-1,K)+zz(I-1,K+1)+zz(I,K-1)+zz(I,K+1)+zz(I+1,K-1)+zz(I+1,K)+zz(I+1,K+1));
                    % �жϵ��Ƿ�Ϊ�����
                    if abs( zz(I,K)-G ) > T % �������
                        zz_deNoise(I,K) = G ;
                    end
                end
            end

            dataDeNoise(gunNum,zdSeq,lineSeq,:,3) = reshape(zz_deNoise,[],1);
        end   % lineSeq = 1:4
    end    % zdSeq = 1:2
end    % gunNum = 1:6


%%
figure % ȥ�����������ͼ��
mesh(xx,yy,zz_deNoise)
xlabel('X')
ylabel('Y');
zlabel('Z');
title('ȥ�������ͼ��')


%% ȥ���������
dataTemp = dataDeNoise;
for gunNum = 1:6
    for zdSeq = 1:2
        for lineSeq = 1:4
            data1 = squeeze(dataDeNoise(gunNum,zdSeq,lineSeq,:,:));
            z = CorrectZround(data1(:,3));         
           %% �õ�Z��ƽ�����
            zz = zeros(756,564);     
            zz = reshape(z,756,564);
            zz_deNoise = zz;
           
            for K = 2:563
                for I = 2:755
                    G = 1/8 * (zz(I-1,K-1)+zz(I-1,K)+zz(I-1,K+1)+zz(I,K-1)+zz(I,K+1)+zz(I+1,K-1)+zz(I+1,K)+zz(I+1,K+1));
                    zz_deNoise(I,K) = G ;
                end
            end
            dataTemp(gunNum,zdSeq,lineSeq,:,3) = reshape(zz_deNoise,[],1);
        end   % lineSeq = 1:4
    end    % zdSeq = 1:2
end    % gunNum = 1:6

y = dataTemp;

% save dataDeNoise.mat dataDeNoise


%%
figure % ȥ������������ͼ��
mesh(xx,yy,zz_deNoise)
xlabel('X')
ylabel('Y');
zlabel('Z');
title('ȥ������������ͼ��')

%% ��ͼ��ʾ

figure % ȥ����������ͼ��
mesh(xx,yy,zz_deNoise - ori)
xlabel('X')
ylabel('Y');
zlabel('Z');
title('ȥ���������+����ͼ��')

