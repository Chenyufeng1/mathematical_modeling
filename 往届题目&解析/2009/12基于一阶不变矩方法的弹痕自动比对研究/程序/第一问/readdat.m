function [ x,y,z ] = readdat( filename )
% ��ȡ��Ŀ�и����� *.dat �ļ�������z���������Ч��������
% ����:
%       filename  --- �ļ���
% ���:
%       x: ���ݵ�x����
%       y: ���ݵ�y���� 
%       z: ���ݵ�z���꣬������Ч����λ����������������4λС��
%  

% By Liu Yu
% 2009 - 9 - 19 

fid = fopen( filename, 'r' );
if -1 == fid
    error('Wrong file type or file not exist!')
end

% Read file
s = fscanf(fid,'%g %g %g ' , [3,inf] );
fclose(fid);
s = s';
x = s(:,1);
y = s(:,2);
z = CorrectZround( s(:,3) );

