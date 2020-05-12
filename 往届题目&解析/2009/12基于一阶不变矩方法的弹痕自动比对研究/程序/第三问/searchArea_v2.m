% �ҳ�ͬһ��ǹ2����ͷ�����ƶȣ�������֮��Ӧ�����н�����ڱ���eigenVal�У�
% �Լ�eigenVal.mat��
clear all
clc

tic
% index = 10000:20000;
index = 1000:2000;
% que3data.mat ͨ��getQue3data.m���
load que3data.mat % �����3�ʵ�����

%%
% ����������z��ľ���
for gunNum = 1:6
    for zdSeq=1:2
        for line=1:4
            data(gunNum,zdSeq,line,:,3) = CorrectZround(squeeze(data(gunNum,zdSeq,line,:,3)));
        end
    end
end
%%
% �ռ���ƽ�����Σ�ȥ�����ݵ�����

data = DeNoise_v2(data);

%%
gunNum = 6;
eigenVal = zeros(gunNum,7);  % min_12 = I1_12;
                             % min_24 = I1_24;
                             % min_i = ii;
                             % min_j = jj;
                             % th = abs(I1_12-I1_24);
myEnd = 400000/min(index);
for gunNum = 1:6
    for line1=1:4
        for line2=1:4
            th = 10000000;
            ju1 = zeros(myEnd+1,1);
            ju2 = zeros(myEnd+1,1);
            for ii=0:myEnd
                index12 = index + ii*min(index);
                x = squeeze(data(gunNum,1,line1,index12,1));
                y = squeeze(data(gunNum,1,line1,index12,2));
                z = squeeze(data(gunNum,1,line1,index12,3));
                miu00 = m(0,0,x,y,z);
                j_mean = m(1,0,x,y,z) / miu00;
                k_mean = m(0,1,x,y,z) / miu00;
                miu02 = m(0,2,x,y,z) - k_mean * m(0,1,x,y,z);
                miu20 = m(2,0,x,y,z) - j_mean * m(1,0,x,y,z);
                y20 = miu20 / miu00;
                y02 = miu02 / miu00;
                I1_12 = y20 + y02;
                ju1(ii+1) = I1_12;
            end
            for jj=0:myEnd 
                index24 = index + jj*min(index);
                x = squeeze(data(gunNum,2,line2,index24,1));
                y = squeeze(data(gunNum,2,line2,index24,2));
                z = squeeze(data(gunNum,2,line2,index24,3));
                miu00 = m(0,0,x,y,z);
                j_mean = m(1,0,x,y,z) / miu00;
                k_mean = m(0,1,x,y,z) / miu00;
                miu02 = m(0,2,x,y,z) - k_mean * m(0,1,x,y,z);
                miu20 = m(2,0,x,y,z) - j_mean * m(1,0,x,y,z);
                y20 = miu20 / miu00;
                y02 = miu02 / miu00;
                I1_24 = y20 + y02;
                ju2(jj+1) = I1_24;
            end
            for ii=0:myEnd
                for jj=0:myEnd
                    if abs(ju1(ii+1)-ju2(jj+1)) <= th
                    eigenVal(gunNum,1) = ju1(ii+1);   % ��ͷ1��ii�β��β���ص�ֵ
                    eigenVal(gunNum,2) = ju2(jj+1);   % ��ͷ2��ii�β��β���ص�ֵ
                    eigenVal(gunNum,3) = ii;          % ��¼��ͷ1ѡ����ǵڼ��β���
                    eigenVal(gunNum,4) = jj;          % ��¼��ͷ2ѡ����ǵڼ��β���
                    eigenVal(gunNum,5) = line1;       % ��ͷ1ѡ��ĺۼ�
                    eigenVal(gunNum,6) = line2;       % ��ͷ2ѡ��ĺۼ�
                    eigenVal(gunNum,7) = abs(ju1(ii+1)-ju2(jj+1));  % ͬһ��ǹ2����ͷ�����ƶ�
                    th = abs(ju1(ii+1)-ju2(jj+1));
                end
                end
            end   
        end % end line2
    end % end line1
end % end gunNum
toc
%%
%save eigenVal.mat eigenVal


