
% ����ڵ�����㷨
function bsf(xx,yy,num,r)
global s;
global e;
global x;
global y;
  for i=1:458 
     if  s(i)==num
           j=e(i);
           l=sqrt((y(j)-yy)^2+(x(j)-xx)^2) ;
         if l<r %�ж�·�������Ƿ�С�ڱ�׼
              N=j
             bsf(x(j),y(j),j,r-l);%�ݹ����
         else
           s(i);  %����ڽӵ�
           X=x(s(i)) %����ڽӵ�x����
           Y=y(s(i)) %����ڽӵ�y����
        end
     end  
  end