function Ipolor=polarsample(a)
%�˺���Ϊͼ���������
%�����ܶ�Ϊ1.63�ȣ���������10
v=1.37;q=15;
for theta=1:1:360
    for c1=0:q-1
        v1=cos(theta*pi/180)*(v^c1);
        v2=sin(theta*pi/180)*(v^c1);
        v1=floor(v1+0.5);
        v2=floor(v2+0.5);
        c(theta,(c1+1))=a((86-v2),(85+v1))*(v^c1);% ������任
    end
end
c=c';
for k=1:180
    for la=1:q
        if c(la,k)>=c(la,k+180)            
    v(la,k)=c(la,k);
        else v(la,k)=c(la,k+180);                 %���������
        end
    end
end
Ipolor=v;
