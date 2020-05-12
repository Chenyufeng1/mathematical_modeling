clear all;
clc;
fid1=fopen('pre_pro.txt','r');
data1=fscanf(fid1,'%g',[62,1909]);
data=data1';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���ݹ�һ��
sum_total=0;
std_total=0;
for i=1:1909
    for j=1:62
        sum_total=sum_total+data(i,j);
    end
end
ave=sum_total/(62*1909);
for i=1:1909
    for j=1:62
        std_total=std_total+(data(i,j)-ave)^2;
    end
end
std=sqrt(std_total/(62*1909-1));
for i=1:1909
    for j=1:62
        data_guiyihua(i,j)=(data(i,j)-ave)/std;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���������방��ľ�ֵ���׼��
for i=1:1909
    normal_ave(i)=sum(data_guiyihua(i,1:12))/12;
    for j=1:12
        normal_biaozhuncha(i)=sqrt(sum(data_guiyihua(i,j)-normal_ave(i))^2/(12-1));
    end
end
for i=1:1909
    cancer_ave(i)=sum(data_guiyihua(i,13:62))/40;
    for j=13:62
        cancer_biaozhuncha(i)=sqrt(sum(data_guiyihua(i,j)-cancer_ave(i))^2/(40-1));
    end
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % ����һ��dΪ���������
% for i=1:1909
%     d(i)=abs((normal_ave(i)-cancer_ave(i))/(normal_biaozhuncha(i)+cancer_biaozhuncha(i)));
% end
% dd=d';
% 
% [A,ind]=sort(d,'descend');
% d_juli=zeros(1909,2);
% 
% for i=1:1909
%     d_juli(i,1)=ind(i);
%     d_juli(i,2)=A(i);
% end
% 
% for i=1:300
%         choose_300(i,1)=d_juli(i,1);
%         choose_300(i,2)=d_juli(i,2);
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��������bΪBhattacharyya����
for i=1:1909
    b(i)=1/4*(normal_ave(i)-cancer_ave(i))^2/(normal_biaozhuncha(i)^2+cancer_biaozhuncha(i)^2)...
        +1/2*log((normal_biaozhuncha(i)^2+cancer_biaozhuncha(i)^2)/(2*normal_biaozhuncha(i)*cancer_biaozhuncha(i)));
end
bb=b';

[B,ind2]=sort(b,'descend');
b_juli=zeros(1909,2);

for i=1:1909
    b_juli(i,1)=ind2(i);
    b_juli(i,2)=B(i);
end



nn=200;
for i=1:nn
        choose_300(i,1)=b_juli(i,1);
        choose_300(i,2)=b_juli(i,2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

index_huanyuan=zeros(1909,1);
%��ȡ�Ĺ�һ������
for i=1:nn
    temp=choose_300(i,1);
    index_huanyuan(i)=temp;
    for j=1:62
        data_tiqu(i,j)=data_guiyihua(temp,j);
    end
end
%��ȡ��δ��һ��������
for i=1:nn
    temp=choose_300(i,1);
    index_huanyuan(i)=temp;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ӧ��ȡ����300������ı��
    for j=1:62
        data_tiqu1(i,j)=data(temp,j);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����Ϊ�����㷨
for i=1:nn
    ave_yangben(i)=sum(data_tiqu(i,:))/62;
end
coef1=zeros(nn,nn);
coef2=zeros(nn,1);
for i=1:nn
    for j=1:nn
        for k=1:62
        coef1(i,j)=coef1(i,j)+(data_tiqu(i,k)-ave_yangben(i))*(data_tiqu(j,k)-ave_yangben(j));
        end
    end
end
for i=1:nn
    for j=1:62
        
        coef2(i)=coef2(i)+(data_tiqu(i,j)-ave_yangben(i))^2;
     
    end
end
for i=1:nn
    for j=1:nn
    
        coef(i,j)=coef1(i,j)/sqrt(coef2(i)*coef2(j));
    end
end

newB=choose_300(:,2);
newindex11=choose_300(:,1);

for i=1:nn
    for j=i+1:nn
        
        if (coef(i,j)>0.5)
            newB(j)=0;
            newindex11(j)=0;
        
       
        else
            break;
        end

    end
end
j=1;
for i=1:nn
    
    if newB(i)~=0;
        newBB(j)=newB(i);
        newindex22(j)=newindex11(i);
        j=j+1;
    end
end
newBB=newBB';
newindex22=newindex22';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ɷַ�����
% index_huanyuan=zeros(1909,1);
% for i=1:length(newBB)
%     temp1=newindex22(i);
%     index_huanyuan11(i)=temp1;
%     for j=1:62
%         data_tiqu_hou(i,j)=data_guiyihua(temp1,j);
%     end
% end
for i=1:length(newBB)
    temp_1=newindex22(i);
    index_huanyuan_1(i)=temp_1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ӧ��ȡ����300������ı��
    for j=1:62
        data_tiqu1_hou(i,j)=data(temp_1,j);
    end
end
%���ɷַ����������ݹ�һ��(�ɸ���ȡ��300������)
sum_total_1=0;
std_total_1=0;

for i=1:length(newBB)
    for j=1:62
        sum_total_1=sum_total_1+data_tiqu1(i,j);
    end
end
ave_1=sum_total_1/(62*length(newBB));
for i=1:length(newBB)
    for j=1:62
        std_total_1=std_total_1+(data_tiqu1(i,j)-ave_1)^2;
    end
end
std_1=sqrt(std_total_1/(62*1909-1));
for i=1:length(newBB)
    for j=1:62
        tiqu_guiyihua(i,j)=(data_tiqu1(i,j)-ave_1)/std_1;
    end
end
%���ɷַ������������ϵ������
 tiqu_zhuanzhi=tiqu_guiyihua';
% %C=cov(tiqu_zhuanzhi);
% R=corrcoef(tiqu_zhuanzhi);
% fprintf('���ϵ������:\n');
std=CORRCOEF(tiqu_zhuanzhi);    %�������ϵ������
% fprintf('��������(vec)������ֵ(val)��\n')
[vec,val]=eig(std);    %������ֵ(val)����������(vec)
newval=abs(diag(val)) ;
%newval_biaohao_zhi=[index_huanyuan_1,newval];%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����������ֵ���300*2������
[y,index]=sort(newval) ;      %����������������yΪ��������indexΪ����
%  fprintf('����������\n');
 for z=1:length(y)
     newy(z)=y(length(y)+1-z);
 end
%  fprintf('%g\n',newy);
 rate=y/sum(y);
%  fprintf('\n�����ʣ�\n');
 newrate=newy/sum(newy);
 sumrate=0;
 newindex=[];
for k=length(y):-1:1
    sumrate=sumrate+rate(k);
    newindex(length(y)+1-k)=index(k);
    if sumrate>0.93 break;
    end  
end                %�����ۻ������ʴ�85%������ֵ����ŷ���newindex��
fprintf('���ɷ�����%g\n\n',length(newindex));

        
            
           
    
 
