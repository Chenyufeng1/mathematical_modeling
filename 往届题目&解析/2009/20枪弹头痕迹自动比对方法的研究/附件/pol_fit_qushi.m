function [yy] = pol_fit_qushi(c1)
%������ȥ��,��������ת������Ӱ��
%�������������
t=(0:563)*2.75*10^(-3);
a=mean(c1,2);
cc=polyfit(t.',a,2) ;
figure(1);
subplot(211); plot(a);
y1=polyval(cc,t); 
subplot(212); plot(y1);
yy=zeros(564,756);
for mm=1:756
yy(:,mm)=y1.';
end
