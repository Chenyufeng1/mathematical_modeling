%���¶Ⱦ���temp3.mat��������ʸ���ڵ�ѹ��
minwdc=ones(81,81);
minwdc=1000*minwdc;
ceng=zeros(81,81);%����ѹǿ��
yq=zeros(81,81);%��Ӧ��ѹ�棨ѹǿֵ��
wenmean=zeros(81,81);
for i=1:81
    for j=1:81
        if V(i,j)~=0
            weidu=i-41;
            jingdu=j+45;
            p=(45-weidu)*20+1;%��Ӧwendu1���к�
            q=(jingdu-40)*20+1;%��Ӧwendu1���к�   
            a=zeros(1,256);
            for ii=1:16
               for jj=1:16
                  a(16*(ii-1)+jj)=wendu1(p-7+ii,q-7+jj);
               end
            end
           [n,x]=hist(a,10);%n��Ƶ����x��ÿ���ε��м�ֵ
            [maxn,nn]=max(n);
            frequecy=n/256;
            for kk=1:10
                wenmean(i,j)=wenmean(i,j)+frequecy(kk)*x(kk);
            end 
            pp=round(641*(90-weidu)/180);%��Ӧt��x��
            qq=round(1280*jingdu/360);%��Ӧt��y��
            for ii=1:36
                wdc=abs(wenmean(i,j)-t(pp,qq,ii))%tΪtemp3.mat
                if wdc<minwdc(i,j)
                    minwdc(i,j)=wdc;
                    ceng(i,j)=ii;
                end
            end
        end
    end
end
for i=1:81
    for j=1:81
        if ceng(i,j)~=0
        yq(i,j)=yaqiang(1,ceng(i,j));%yaqiangΪ�����Ӧѹǿֵ
        end
    end
end
        