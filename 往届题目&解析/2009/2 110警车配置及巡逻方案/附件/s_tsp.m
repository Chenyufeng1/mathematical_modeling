%TSP ����֯����ӳ����������
clear all;
city_num = 7  %���ýڵ���Ŀ
neuron_num = city_num*3; %������Ԫ��Ŀ��������ԪΪ�ڵ���Ŀ��3��,���鹫ʽΪ1.5~2.5��
neurons = rand(neuron_num,2)*100;%�������һ����Ԫ��Ϊ�˺ͽڵ�ֲ�һ�£���������0~1��Χ����������100

org1=[
1	4716	7956;
2	6750	7956;
3	5616	7920;
4	5598	7254;
5	4644	7110;
6	5022	7110;
7	5616	7110
];
%�ڵ�����ʼ����
cities = org1(:,2:3); %��ȡ�ڵ����꣨org1�����2~3�У�
% �ڵ㵽����һ�ڵ����
distanc=[
0	1	901	10000	849	10000	50;
1	0	1135	10000	10000	10000	10000;
901	1135	0	666	10000	10000	10000;
10000	10000	666	0	10000	10000	145;
849	10000	10000	10000	0	378	10000;
10000	10000	10000	10000	378	0	591;
50	10000	10000	145	10000	591	0
 ];
city_name=str2mat('7'	,'8',	'11',	'20'	,'27',	'31'	,'34');
%��������:
t1=1000;
t2=1000;
delta=10;
alpha=0.9;
times=1000;%��������������Ϊ�ڵ���Ŀ��20~50��,Խ��Խ�����������

n = -1;
h = waitbar(0,'���ڼ��㣬���Ժ򡭡�'); %����һ�����������
while (n < times) 
    waitbar(n/times,h) 
    n = n + 1;
    for i = 1:city_num 
        dist = 100000;
        ix = 0;
        for j = 1:city_num
            tmp=(cities(i,:)-neurons(j,:))*(cities(i,:)-neurons(j,:))';%����ڵ��ÿ����Ԫ�ľ��룬�ҵ���С��
            if (tmp < dist)
                dist = tmp;
                ix = j;
            end
        end 
        % ������Ԫ��Ȩֵ
        rate = alpha*exp(-n/t2);  %alpha(n)
        width = delta*exp(-n/(t1/log(10)));  %theta(n)
        for j = 1:city_num
            d = min(abs(ix-j),city_num-abs(j-ix));%d(j,i)
            %d = distance(ix,j);
            neurons(j,:)=neurons(j,:)+rate*exp(-d*d/(2*width*width))*(cities(i,:) - neurons(j,:));
        end
    end % ������������������������
end 
   close(h)
 
for i=1:neuron_num %����Ԫ���������ţ����ڵ�һ�У�������ڵ�2�͵�3��
    tmp=0;
    tmp = neurons(i,1);
    neurons(i,3) = neurons(i,2);
    neurons(i,2) = tmp;
    neurons(i,1) = i;
end 
for i=1:city_num%���о��������ţ����ڵ�һ�У�������ڵ�2�͵�3�С�������
    tmp = cities(i,1);
    cities(i,3) = cities(i,2);
    cities(i,2) = tmp;
    cities(i,1) = i;
end
for i = 1:city_num 
    dist = 100000;
    ix = 0;
    for j = 1:city_num
        tmp=(cities(i,2:3)-neurons(j,2:3))*(cities(i,2:3)-neurons(j,2:3))';
        if (tmp < dist)
            dist = tmp;
            ix = j;
        end
    end
    result(i,1) = cities(i,1);
    result(i,2) = cities(i,2);
    result(i,3) = cities(i,3);
    result(i,4) = ix;
    result(i,5) = dist;
end %������������������������
result2=sortrows(result,4); 

p = 1:city_num;
p = [p 1];
grid on;
plot(neurons(p,2),neurons(p,3),'ro','MarkerSize',5);
hold on;
plot(result2(p,2),result2(p,3))%�����ڵ�·��
plot(cities(p,2),cities(p,3),'g*','Markersize',10);%�����ڵ㣬����ɫԲȦ��ʾ
for i=1:city_num
   text(result2(i,2)+0.05,result2(i,3),int2str(result2(i,1)))%����ڵ�����
   text(result2(i,2)-0.1,result2(i,3)-0.9,city_name(result2(i,1),:))
end

dist=0;%����·���ܳ���
for i=1:city_num-1
    dist = dist + distanc(result2(i,1),result2(i+1,1));
end
dist = dist + distanc(result2(city_num,1),result2(1,1));
                                  
fid1 = fopen('resultluxian.txt','w');

fprintf(fid1,'Ѳ��·��\n');
fprintf(fid1,'%i,',result2(:,1));
fprintf(fid1,'\nѲ��·���ܳ��� = %f\n',dist);
fclose(fid1);




