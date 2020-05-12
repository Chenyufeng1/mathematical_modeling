clear,clc
close all
% c1.dat Ϊ���������ļ���
[x,y,z] = readdat('c1.dat');
data = [x,y,z];
% ��Z����ת����ʼ�Ƕ�
CitaZLimL = -0.2;
% ��Z����ת����ֹ�Ƕ�
CitaZLimR = 0.2;
% ���ϽǶ��������ɢ����
Num1 = 15;
% ��X����ת����ʼ�Ƕ�
CitaXLimL = -0.2;
% ��X����ת����ֹ�Ƕ�
CitaXLimR = 0.2;
% ���ϽǶ��������ɢ����
Num2 = 15;
ANS1 = [1e8,0,0];

toller = 1e-5; % ��������
while(1)


    [data_result,ANS,DeltaCitaZ,DeltaCitaX,W] = SelfCalibrat1_1(...
                                data, CitaZLimL, CitaZLimR, Num1,...
                                CitaXLimL, CitaXLimR, Num2);
                            
    if abs(ANS(1) - ANS1(1)) < toller
        break;
    else
        % ����2������һ����ɢ����
        CitaZLimL = ANS(2)-2*DeltaCitaZ;
        CitaZLimR = ANS(2)+2*DeltaCitaZ;
        % �·�Χ�Ĳ�������
        Num1 = 15;
        
        % ����2������һ����ɢ����
        CitaXLimL = ANS(3)-2*DeltaCitaX;
        CitaXLimR = ANS(3)+2*DeltaCitaX;
        % �·�Χ�Ĳ�������
        Num2 =15;
        ANS1 = ANS;       
    end   
end
TiaoZhengByZ = ANS(:,2) %��Z��ĵ����Ƕ�
TiaoZhengByX = ANS(:,3) %��X��ĵ����Ƕ�
%% ���ݱ��棬�ڵ���λ�����ʱ���õ��������ļ�
save result.mat   ANS data_result data

