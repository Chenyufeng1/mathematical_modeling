function y=flood(h,b,v,v0)
%������ȱ�ڵ�����
%h ��ǰ���
%b ��ǰ���ڿ��
%v,v0 ��ǰ���ݣ��ϴο���
%bm=70;
bm=300;
hh=h-(42-newton(v0,v));
if hh>0
    y=1.71*b*hh^(1.5)+1.2*hh^(2.5)*h/((bm-b)/2);
    %y=1.71*b*hh^(1.5)+1.2*hh^(2.5)*h/((bm-b)/2);
    %4.5
else
    y=0;
end

