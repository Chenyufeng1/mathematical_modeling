%�ó���ͨ���Ƕ�����������е��������ϰ������Դ��֮��ľ��� 
function d=chilijuli(t1,t2,t3,t4,t5,t6,p)

%%-----------------�����ϰ���ı߽��

%%----------------����˵ı߽��

[cx,cy,cz]=robot3(t1,t2,t3);
[dx,dy,dz]=robot4(t1,t2,t3,t4);
[ex,ey,ez]=robot2(t1,t2,t3,t4,t5,t6);

q=[cx,cy,cz;dx,dy,dz;ex,ey,ez;(cx+dx)/2 (cy+dy)/2 (cz+dz)/2; (ex+dx)/2 (ey+dy)/2 (ez+dz)/2;];
%d=norm([x,y,z]'-o);

d=1000;
for i=1:420
   for j=1:5
      l=norm(q(j,:)-p(i,:));
      if l<d
          d=l;
      end
   end
end
