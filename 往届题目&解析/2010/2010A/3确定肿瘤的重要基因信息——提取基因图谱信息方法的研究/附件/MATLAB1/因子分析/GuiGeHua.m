function [A]=GuiGeHua(x)
[m,n]=size(x);
for i=1:m   %�������ӷֱ���ظ������ķ���
    a(i)=0;
    for j=1:n
        a(i)=a(i)+x(i,j)^2;
    end
end;

for i=1:m %�������Ӿ������滯����񻯣�����
    for j=1:n
        A(i,j)=x(i,j)/sqrt(a(i));
    end
end;