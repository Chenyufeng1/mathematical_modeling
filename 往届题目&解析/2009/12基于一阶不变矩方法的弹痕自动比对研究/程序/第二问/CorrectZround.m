function NewZ = CorrectZround( Zdata )
% �Բ�����ʼZ���ݽ�������
% ��Z�����������뱣����λС��
%
% ���룺
%     Zdata: *.dat�ļ��е�z����
% �����
%     NewZ���������z���꣬������λС��
%   
%     ���磺
%          Zdata = [0.139449,0.139469,0.139549];
%          CorrectZround( Zdata )
%
%     ���������
%          0.1394 0.1395 0.1395
%        

NewZ = round(fix(Zdata * 1e5)/10)/1e4;

end