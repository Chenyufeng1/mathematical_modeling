function b=expand(t,T)
%����tʱ�̵����ڿ��
rou=1.5;
b0=40;
Bm=70;
%b=40+(Bm)*(t/T)^rou;
b=b0+(Bm-b0)*(t/T)^rou;
%b=150+(300-150)*(t/T)^rou;
%b=300*(t/T)^rou;