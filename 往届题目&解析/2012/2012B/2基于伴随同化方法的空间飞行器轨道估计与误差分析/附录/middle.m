function [xx,yy,zz,dd]=middle(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4);
% 2012-9-21
% ��������ֱ�ߡ��е㡱λ�ã�xx,yy,zz��
% ��x1��y1��z1������x2��y2��z2��Ϊ2���۲����ǵ�λ�ã����۲�����ϵԭ���ڻ�������ϵ���λ�ã�
% ��x3��y3��z3������x4��y4��z4���ֱ�Ϊ2���۲����ǹ۲⵽�ķ�������λ��
% ����ֱ��13��24�����߶ε��е㣨���棩�򽻵㣨�ཻ��
% dd�ǹ����߶εĳ���

vma=[x3-x1 y3-y1 z3-z1];
vma=vma/norm(vma);
vnb=[x4-x2 y4-y2 z4-z2];
vnb=vnb/norm(vnb);
vmn=[x2-x1 y2-y1 z2-z1];
cosst1=vma*vmn'/norm(vmn);
cosst2=-vnb*vmn'/norm(vmn);
cosst=vma*vnb';

m=(cosst1+cosst2*cosst)/(1-cosst^2)*norm(vmn);
n=(cosst2+cosst1*cosst)/(1-cosst^2)*norm(vmn);

x01=x1+vma(1)*m;
y01=y1+vma(2)*m;
z01=z1+vma(3)*m;
x02=x2+vnb(1)*n;
y02=y2+vnb(2)*n;
z02=z2+vnb(3)*n;
xx=(x01+x02)/2;
yy=(y01+y02)/2;
zz=(z01+z02)/2;
dd=norm([x02-x01 y02-y01 z02-z01]);