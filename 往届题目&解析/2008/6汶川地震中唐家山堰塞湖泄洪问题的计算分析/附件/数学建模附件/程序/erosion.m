function y=erosion(H,V,Q,B)
%H H(i)ȱ�����
%V H(i)����
%Q Q(i)��������һ����
%B B(i)��һ�����ڵ׿�
H_water=newton(20,V);
H_water_gc=710+H_water;
deltaH=H_water_gc-752+H;
Pb=2*deltaH+B;
Lb=803;
deltaT=10/60;
p=0.1;%��϶�� 1-p
ks=0.01;%����Ч��19
y=H+Q*deltaT*3600*ks/(Pb*Lb*(1-p));

