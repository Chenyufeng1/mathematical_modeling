clc
clear

%�������
Line=13;   %���񻯵�����
Cross=Line*2;  %���񻯵����������ڳ��ǿ���������������Ϊ������2����
dis=1/Line;  %��������ĳ���
m=zeros(Line,Cross);  %��ÿ������Ԫ�ĻҶȽ��г�ʼ��

%����ʾ�����ݣ����ݱ�����ϳ�̿�ʼ��������˳������
[s,f]=textread('result1.txt','%f %f');

%ȷ�����ݵĸ���
[r,c]=size(s);
NUM=r*c;

%�����ƽ������ÿһ�������ƽ��ֵ
for i=3:(NUM-2)
    sp(i)=(s(i-2)+s(i-1)+s(i)+s(i+1)+s(i+2))/5;
    fp(i)=(f(i-2)+f(i-1)+f(i)+f(i+1)+f(i+2))/5;
end
sp(1)=(s(NUM-1)+s(NUM)+s(1)+s(2)+s(3))/5;
sp(2)=(s(NUM)+s(1)+s(2)+s(3)+s(4))/5;
sp(NUM-1)=(s(NUM-3)+s(NUM-2)+s(NUM-1)+s(NUM)+s(1))/5;
sp(NUM)=(s(NUM-2)+s(NUM-1)+s(NUM)+s(1)+s(2))/5;
fp(1)=(f(NUM-1)+f(NUM)+f(1)+f(2)+f(3))/5;
fp(2)=(f(NUM)+f(1)+f(2)+f(3)+f(4))/5;
fp(NUM-1)=(f(NUM-3)+f(NUM-2)+f(NUM-1)+f(NUM)+f(1))/5;
fp(NUM)=(f(NUM-2)+f(NUM-1)+f(NUM)+f(1)+f(2))/5;

%��������������Сֵ
sp_max=max(sp);
sp_min=min(sp);
fp_max=max(fp);
fp_min=min(fp);

%��ɢ���һ��
for i=1:NUM
    spg(i)=(sp(i)-sp_min)/(sp_max-sp_min)*2;    %s��0��2
    fpg(i)=(fp(i)-fp_min)/(fp_max-fp_min);      %f��0��1
end

%�����³�̷ֿ�
for i=2:NUM
    if (spg(i)-spg(i-1))<0
        j=i;
        break;
    end
end
n_s=j-1;        %�ϳ�̵����ݸ���
n_x=NUM-j+1;    %�³�̵����ݸ���

%�ϳ������   ��s��0��2��
for i=1:j-1;
    s_s(i)=spg(i);
    f_s(i)=fpg(i);
end

%�³������ ��s��2��0��
for i=j:NUM;
    s_x(i-j+2)=spg(i);
    f_x(i-j+2)=fpg(i);
end
s_x(1)=s_s(n_s);  %Ϊ�˱�֤�±߽�����2��0
f_x(1)=f_s(n_s);
s_x(n_x+2)=s_s(1);
f_x(n_x+2)=f_s(1);
n_x=n_x+2;


%ȷ���߽����ڵĵ�Ԫ    ��������Ѱ�ң�
bo_1=zeros(1,Cross);   %���ڼ�¼�ϳ�̶�Ӧ��ÿ�е��������Ԫ���
bo_2=zeros(1,Cross);   %���ڼ�¼�ϳ�̶�Ӧ��ÿ�е���С����Ԫ���
bo_3=zeros(1,Cross);   %���ڼ�¼�³�̶�Ӧ��ÿ�е��������Ԫ���
bo_4=zeros(1,Cross);   %���ڼ�¼�³�̶�Ӧ��ÿ�е���С����Ԫ���


%�ϳ�̱߽�
for i=1:Cross
    aa1=(i-1)*dis;
    aa2=i*dis;
    
    for j=2:n_s
        if aa1<=s_s(j)
            k=j;
            break;
        end
    end
    bb1=(aa1-s_s(k-1))/(s_s(k)-s_s(k-1))*(f_s(k)-f_s(k-1))+f_s(k-1);
    bb1=fix(bb1/dis)+1;
    
        for j=2:n_s
        if aa2<=s_s(j)
            k=j;
            break;
        end
    end
    bb2=(aa2-s_s(k-1))/(s_s(k)-s_s(k-1))*(f_s(k)-f_s(k-1))+f_s(k-1);
    bb2=fix(bb2/dis)+1;
    
    bb_max=max(bb1,bb2);
    bb_min=min(bb1,bb2);
    
    for v=bb_min:bb_max
        m(v,i)=1;
    end
    
    bo_1(i)=bb_max;
    bo_2(i)=bb_min;
end

%�³�̱߽�
for i=1:Cross
    aa1=(i-1)*dis;
    aa2=i*dis;
    
    for j=2:n_x
        if aa1>=s_x(j)
            k=j;
            break;
        end
    end
    bb1=(aa1-s_x(k-1))/(s_x(k)-s_x(k-1))*(f_x(k)-f_x(k-1))+f_x(k-1);
    bb1=fix(bb1/dis)+1;
    
        for j=2:n_x
        if aa2>=s_x(j)
            k=j;
            break;
        end
    end
    bb2=(aa2-s_x(k-1))/(s_x(k)-s_x(k-1))*(f_x(k)-f_x(k-1))+f_x(k-1);
    bb2=fix(bb2/dis)+1;
    
    bb_max=max(bb1,bb2);
    bb_min=min(bb1,bb2);
    
    for v=bb_min:bb_max
        m(v,i)=1;
    end
    
    bo_3(i)=bb_max;
    bo_4(i)=bb_min;
end

%���Ǳ߽�����
for i=1:Cross
    for j=1:Line
        %�жϵ����ڲ������ⲿ
        if(j>bo_3(i) && j<bo_2(i))%�ڲ�
            ad_left=10000;
            ad_right=10000;
            ad_up=10000;
            ad_down=10000;
            %left
            if(i>1)
                for k=(i-1):-1:1
                    if(m(j,k)==1)
                        ad_left=abs(k-i);
                        break;
                    end
                end
            end
            %right
            if(i<Cross)
                for k=(i+1):Cross
                    if(m(j,k)==1)
                        ad_right=abs(k-i);
                        break;
                    end
                end
            end
            %up
            if(j<Line)
                for k=(j+1):Line
                    if(m(k,i)==1)
                        ad_up=abs(k-j);
                        break;
                    end
                end
            end
            %down
            if(j>1)
                for k=(j-1):-1:1
                    if(m(k,i)==1)
                        ad_down=abs(k-j);
                        break;
                    end
                end
            end
            ad_final=min(ad_left,ad_right);
            ad_final=min(ad_final,ad_up);
            ad_final=min(ad_final,ad_down);
            m(j,i)=1+ad_final;
        else if(j>bo_1(i) || j<bo_4(i))%�ⲿ
            ad_left=10000;
            ad_right=10000;
            ad_up=10000;
            ad_down=10000;
            %left
            if(i>1)
                for k=(i-1):-1:1
                    if(m(j,k)==1)
                        ad_left=abs(k-i);
                        break;
                    end
                end
            end
            %right
            if(i<Cross)
                for k=(i+1):Cross
                    if(m(j,k)==1)
                        ad_right=abs(k-i);
                        break;
                    end
                end
            end
            %up
            if(j<Line)
                for k=(j+1):Line
                    if(m(k,i)==1)
                        ad_up=abs(k-j);
                        break;
                    end
                end
            end
            %down
            if(j>1)
                for k=(j-1):-1:1
                    if(m(k,i)==1)
                        ad_down=abs(k-j);
                        break;
                    end
                end
            end
            ad_final=min(ad_left,ad_right);
            ad_final=min(ad_final,ad_up);
            ad_final=min(ad_final,ad_down);
            m(j,i)=1-ad_final;
            end
        end
    end   
end

mm_max=max(max(m));
mm_min=min(min(m));

R=zeros(1,(mm_max-mm_min+1));
p=zeros(1,(mm_max-mm_min+1));
for k=mm_min:mm_max
    for i=1:Line
        for j=1:Cross
            if(m(i,j)==k)
                R(k-mm_min+1)=R(k-mm_min+1)+1;
            end
        end
    end
end

for k=mm_min:mm_max
    p(k-mm_min+1)=R(k-mm_min+1)/(Line*Cross);
end

f=zeros(1,6);
%��ҶȾ�ֵ
for k=mm_min:mm_max
    f(1)=f(1)+k*p(k-mm_min+1);
end

%��Ҷȷ���
for k=mm_min:mm_max
    f(2)=f(2)+(k-f(1))^2*p(k-mm_min+1);
end

%��Ҷ�ƫ��
for k=mm_min:mm_max
    f(3)=f(3)+(k-f(1))^3*p(k-mm_min+1);
end
f(3)=f(3)/(f(2)^(3/2));

%��Ҷȷ��
for k=mm_min:mm_max
    f(4)=f(4)+(k-f(1))^4*p(k-mm_min+1);
end
f(4)=f(4)/(f(2)^2);

%��Ҷ�����
for k=mm_min:mm_max
    f(5)=f(5)+(p(k-mm_min+1))^2;
end

%��Ҷ���
for k=mm_min:mm_max
    f(6)=f(6)+(1-p(k-mm_min+1))*log10(1-p(k-mm_min+1));
end
f(6)=-f(6);

%�ο��������Ҷ�ͳ������������ֵ
fc=zeros(2,6); %�������*����ֵ
fc=[3.230769231,3.230769231,0.398332458,2.051704706,0.164665103,0.396198536;
    1.437869822,7.743181261,-0.680559339,3.349141388,0.129389727,0.404353482;
   ];

%�����ϵ��
dlt=zeros(2,6);
for i=1:2
    for k=1:6
        dlt(i,k)=abs(f(k)-fc(i,k));
    end
end

ff_min=min(min(dlt));
ff_max=max(max(dlt));
rou=0.5;   %�ֱ�ϵ��

cgm=zeros(2,6);
for i=1:2
    for k=1:6
        cgm(i,k)=(ff_min+rou*ff_max)/(dlt(i,k)+rou*ff_max);
    end
end

yita=zeros(1,2);
for i=1:2
    for k=1:6
        yita(i)=yita(i)+cgm(i,k);
    end
    yita(i)=yita(i)/6;
end
