function pose = waveltmethod(a)

v=1.37;
h1=polarsample(a);         %ͼ���������
h2=polarmarr;              %ī�����ñС�����������
h1=symmetrix(h1);
h2=symmetrix(h2);
H1=fft2(h1);              %��ά��ɢ����Ҷ�仯
H2=fft2(h2);
H3=H1.*H2;                %��ӦԪ�����
h3=ifft2(H3);             %�����渵��Ҷ�任
[v1 v2]=size(h3);   
v1=v1/2;
for k1=1:v1
    for k2=1:v2
      cx=(v^(k1-1));
       h4(k1,k2)=h3(v1+k1-1,k2)/cx;
       h4(k1,k2)=h4(k1,k2)^2;
       h4(k1,k2)=h4(k1,k2)/cx;         %h4Ϊ�Ƕ�ϵ��
   end
end
% h4
f=sum(h4)/max(sum(h4));          %�������ܶ�
[x y]=max(f);
% figure,plot(f);
% axis([0 180 0 1.2]);
y=angleadjust(y);
%disp(y);
%disp(y+180);
pose=y;                        %ʹ�������ܶ����ĽǶȾ��Ƿ�λ��

