function [ax]= angleadjust(b)
%�˺���Ϊ��̬�ǵĽǶȵ���
if b<90
    ax=90-b;
elseif b>=90&&b<=180
        ax=180-b;
       ax=90+ax;
else error('wrong');
end 

