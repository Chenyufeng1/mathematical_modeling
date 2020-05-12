function [data_result,ANS,DeltaCitaZ,DeltaCitaX,Wieght] = SelfCalibrat1_1(...
                            data, CitaZLimL, CitaZLimR, Num1,...
                            CitaXLimL, CitaXLimR, Num2)
%  �ڸ�������x�ᡢz����ת�Ƕȷ�Χ�ڣ����������̬�����Ƕȡ�
%  ���룺
%  data ������������ x���꣬y���꣬z���꣬��λmm
%  CitaZLimL ��Z����ת����ʼ�����Ƕ�  ��λ ��
%  CitaZLimR ��Z����ת����ֹ�����Ƕ�  ��λ ��
%  Num1 ��ɢ����
%  CitaXLimL ��X����ת����ʼ�����Ƕ�  ��λ ��
%  CitaXLimL ��X����ת����ֹ�����Ƕ�  ��λ ��
%  Num2 ��ɢ����
%  �����
%  data_result���������[x,y,z]
%  ANS:  1��3��
%        ANS(1)����С���
%        ANS(2)����Z����ת�ĽǶ�  
%        ANS(3)����X����ת�ĽǶ�


x = data(:,1);
y = data(:,2);
z = data(:,3);

% ��y��ļнǣ���Z�ᣩ
dcitaZ =linspace(CitaZLimL * pi/180,CitaZLimR * pi/180,Num1);
DeltaCitaZ = ( dcitaZ(2) - dcitaZ(1) ) * 180 / pi;
% ��XOYƽ��ļнǣ���X�ᣩ
dcitaX =linspace(CitaXLimL * pi/180,CitaXLimR * pi/180,Num2);
DeltaCitaX = ( dcitaX(2) - dcitaX(1) ) * 180 / pi;

totle = zeros(length(dcitaX));
ANS = [1e16,0,0];  % �����ֵ����һ���㱣��ͶӰ�����
%                   �ڶ������ʾ��Z����ת�ĽǶȣ�
%                   ���������ʾ��X����ת�ĽǶ�
for II = 1:length(dcitaZ)
    DcitaZ = dcitaZ(II);
    % ����x0yƽ��ת��������������������y��ļн�
    [x1,y1] = routeByZ(x,y,DcitaZ); 
    for III = 1:length(dcitaX)
        %������ת    
        DcitaX = dcitaX(III);
        % ����ĸ����x0yƽ��ļнǣ�����X��ת��
        [y1,z1] = routeByX(y1,z,DcitaX);
        %% ��ȡ����
        Ystart =1; % �ӵ�1 ��������ʼ
        step = 1;
        Yend = 756;  % ����18����������
        tt = Ystart:step:Yend;
        Z1 = Inf.*zeros(length(tt),564);

        t = 1;
        for I = Ystart:step:Yend
            Z1(t,:) = z1((I-1)*564+1:I*564)';
            t=t+1;
        end
        
        Zmax_ByY = max(Z1,[],2);
        Zmin_ByY = min(Z1,[],2);

        totle(II,III) = abs(sum(Zmax_ByY-Zmin_ByY))+abs(sum(y(2:end)-y1(2:end)));
        % totle ÿһ�д�����ǣ�������XOYƽ��ת��һ���Ƕȣ�
        %       ��Ӧ��ĸ����X��ת������������
        if  totle(II,III) < ANS(1)
            ANS(1) = totle(II,III);
            ANS(2) = DcitaZ*180/pi;
            ANS(3) = DcitaX*180/pi;
            Wieght = [abs(sum(Zmax_ByY-Zmin_ByY)), abs(sum(y(2:end)-y1(2:end)))]; % Detect
            data_result = [x1,y1,z1];
            
        end
    end
end

