load 10����(ʱ��50).mat
load ����6����ĵ�·��Ϣ��W����.mat;

plot(Point2(:,2),Point2(:,3),'.r');

for l=1:464
    hold on;
    Z=[Road2(l,4),Road2(l,5);Road2(l,6),Road2(l,7)];
    plot(Z(:,1),Z(:,2));
end

for l=1:296
    hold on;
    plot(Point2(quanbufugaijiedian(1,l),2),Point2(quanbufugaijiedian(1,l),3),'sr');
end

%hold on;
%plot(InP(:,1),InP(:,2),'*r');

