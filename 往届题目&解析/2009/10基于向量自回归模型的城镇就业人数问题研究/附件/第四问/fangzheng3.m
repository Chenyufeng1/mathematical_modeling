function  [yuce,jiuye]=fangzheng3()%����Ԥ���ҵ�ۺ�����
clc;clear;
shu_1=load('D:\ti4.3.txt');%���ݹ���24��
shu_2=load('D:\ti4.3.data.txt');%���ݹ���17�ڣ�ȱ�پ�ҵ�������ģ�ͨ����ʷ���ݲ���
r_x=load('D:\r_x4.3.txt');%ģ�͵�ϵ����
[m1,n1]=size(shu_1);[m2,n2]=size(shu_2);
jiuye=zeros(m2,1);%��Ԥ����ܾ�ҵ����
%%%%%%%%%%%%%%%%%%%%%���ֻ��һ��ָ����ҪԤ��
qian=log(shu_1(end,:));
xishu=r_x(:,1);
for i=1:m2
    jiuye(i)=exp(qian*xishu);
    qian=log([jiuye(i),shu_2(i,:)]);
end
jiuye;
%%%%%%%%%%%%%%%%%%���ݽ����õ�ģ�����Ԥ��13��
yizhi=log([jiuye(end),shu_2(end,:)]);
date=30;
yuce=zeros(date,n1);
for i=1:date %���Ԥ��13��
    for j=1:n1
        yuce(i,j)=exp(yizhi*r_x(:,j));
    end
    yizhi=log(yuce(i,:));
end
format long;
jiuye;
yuce;
jiuye_zongshu=[shu_1(:,1)',jiuye',yuce(:,1)'];
length(jiuye_zongshu) %55������
plot(jiuye_zongshu,'-');
%%%%%%%%%%%%%%����Ϊ��������
%%%%%%ǰ48�����ݰ�ԭ���ɱ仯
for i=1:48
    bodong=0;
    while bodong<0.97||bodong>1.03
    bodong=rand+0.5;
    end
    maker1(i)=jiuye_zongshu(i)*bodong;
end
%%%%%%48-53��������43-48̬ͬ��53�Ժ�������43�Ժ�̬ͬ
%maker1,jiuye_zongshu
for i=1:5
    bodong=0;
    while bodong<0.99||bodong>1.01
    bodong=rand+0.5;
    end
    maker1(48+i)=jiuye_zongshu(48-i)*bodong;
end
%%%%
for i=1:15
    bodong=0;
    while bodong<0.99999||bodong>1.00001
    bodong=rand+0.5;
    end
    maker1(53+i)=jiuye_zongshu(43+i)*bodong;
end
hold on
plot(maker1,'-');


    




