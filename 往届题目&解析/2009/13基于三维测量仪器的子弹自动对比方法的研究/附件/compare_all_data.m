%   ����ÿһ���ӵ������������ӵ��ľ���ֵ
%   �ó��Ľ���ڱ���x�д�š�
function x=compare_all_data()
load all_data    %   ��������
for index1=1:22 %       ��ÿһ���ӵ��ֱ�����������ӵ��ľ���
    for index2=1:22
        a=index1;
        b=index2;
        data_duiying=zeros(1,4);
        index2
        for i=1:4 %     ÿһ����Ӧ ��������Ӧ�Ľ��
            data_cileng=zeros(1,4); %0
            for j=1:4 %     ��ÿһ�������������ֵ
                data_pingyi=zeros(1,5);
                for k=-10:5:10%     ÿһ��ƽ��������С��ֵ ��С��Ŀ��ƽ������Ӱ�� ͨ�����ڲ����ɽ�һ����С���
                    data_pingyi(1,(k+10)/5+1)=sum(sum(abs(...
                        all_data_circle((a-1)*500+100:(a-1)*500+200,(j-1)*500+16+k:(j-1)*500+300+15+k)...
                        -all_data_circle((b-1)*500+100:(b-1)*500+200,mod(i+j-2,4)*500+16:mod(i+j-2,4)*500+300+15)...
                    )));
                end
                data_cileng(1,j)=min(data_pingyi);
            end
            data_duiying(1,i)=sum(data_cileng)-max(data_cileng);%   ȥ���ĸ��������������һ��
        end
        x(index1,index2)=min(data_duiying);%     ȡ�ĸ���Ӧ�������С��һ��Ϊ�����ӵ��ľ���
    end
end
