%ͨ���ҶȾ�������ͶӰ����γ������ƽ����¶Ⱦ���wendu1
wendu1=zeros(1801,1801);
for i=1:1801
    for j=1:1801
        a=touyingbb(i,j);
        if ((a+1)/8)~=floor((a+1)/8)
            p=floor((a+1)/8)+1;
            q=mod((a+1),8);      
        else
            p=(a+1)/8;
            q=8;
        end
        wendu1(i,j)=duizhao(p,q);%���վ���k_temp.txt������duizhao����
    end
end