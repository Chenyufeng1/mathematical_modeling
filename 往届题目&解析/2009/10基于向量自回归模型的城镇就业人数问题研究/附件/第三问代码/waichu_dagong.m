function  [r_x]=waichu_dagong()%��ũ������򹤵�ָ�����
clc
A=load('D:\dagong.txt');
temp_A=A;

A=log(A) 

[m,n]=size(A) 
corr(A);
det(corr(A));
baifen=zeros(m-1,n);
%%%%%%%%%%%%%%ȷ������΢�ַ��̵�ϵ��
%AA=A(1:end-1,:);
AA=[A(1:end-1,:),ones(m-1,1)];
%%%%%%%%%%%%%%��������һ
b=A(2:end,1); 
A_ni=inv(AA'*AA);  
y1=A_ni*AA'*b;
%%%%%%%%%%%%�������̶�
b=A(2:end,2); 
A_ni=inv(AA'*AA) ;
x1=A_ni*AA'*b;
%%%%%%%%%%%%����������
b=A(2:end,3); 
A_ni=inv(AA'*AA) ;
x2=A_ni*AA'*b;
%%%%%%%%%%%%����������
b=A(2:end,4); 
A_ni=inv(AA'*AA) ;
x3=A_ni*AA'*b;
%%%%%%%%%%%%����������
b=A(2:end,5); 
A_ni=inv(AA'*AA) ;
x4=A_ni*AA'*b;
%%%%%%%%%%%%����������
b=A(2:end,6); 
A_ni=inv(AA'*AA);
x5=A_ni*AA'*b;
%%%%%%%%%%%%����������
b=A(2:end,7); 
A_ni=inv(AA'*AA) ;
x6=A_ni*AA'*b;
%%%%%%%%%%%55��������8
% b=A(2:end,8); 
% A_ni=inv(AA'*AA) ;
% x7=A_ni*AA'*b;
%%%%%%%%%%%55��������9
r_x=[y1,x1,x2,x3,x4,x5,x6]  
%%%%%%%%%%%%%%%%%%%y1(t+1)=y1*[y1,x1,x2,x3,x4,x5,x6]
%%�ɵõ���ַ�����,����һ�������Ԥ����һ�������
 
shiyan=[A,ones(m,1)];
for i=1:m
    for j=1:n
        nihe(i,j)=shiyan(i,:)*r_x(:,j) ;
    end
end
nihe;
for i=1:m
    for j=1:n
        nihe(i,j)=exp(nihe(i,j));
    end
end
%nihe,temp_A
%A,nihe,
%%%%%%%%%%%%%%%%%%%%%%%%%%����в��
for j=1:n
      df(j,:)=(temp_A(2:end,j)-nihe(1:m-1,j))';
     %abs((A(2:end,j)-nihe(1:m-1,j))./A(2:end,j));
    cancha(j)=mean(abs((temp_A(2:end,j)-nihe(1:m-1,j))./sum(temp_A(2:end,j)))) ;
end
% df'
% mean(df')
cancha;
%%%%%%%%%%%%%%%%%%%%%%%
temp_A;
nihe=[temp_A(1,:);nihe];
figure(1);
subplot(3,3,1);plot([1990:2007],temp_A(:,1),'.');hold on;plot([1990:2007+1],nihe(:,1),'r');legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('���������/����');
subplot(3,3,2);plot([1990:2007],temp_A(:,2),'.');hold on;plot([1990:2007+1],nihe(:,2),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�г����̶�/Ԫ/��');
subplot(3,3,3);plot([1990:2007],temp_A(:,3),'.');hold on;plot([1990:2007+1],nihe(:,3),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('���򻯳̶�/%');
subplot(3,3,4);plot([1990:2007],temp_A(:,4),'.');hold on;plot([1990:2007+1],nihe(:,4),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('����������/��Ԫ');
subplot(3,3,5);plot([1990:2007],temp_A(:,5),'.');hold on;plot([1990:2007+1],nihe(:,5),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('����ó�׶�/��Ԫ');
subplot(3,3,6);plot([1990:2007],temp_A(:,6),'.');hold on;plot([1990:2007+1],nihe(:,6),'r');
xlabel('ʱ��/��');ylabel('�ڶ�������ҵGDP�ܶ�/��Ԫ');
subplot(3,3,7);plot([1990:2007],temp_A(:,7),'.');hold on;plot([1990:2007+1],nihe(:,7),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�˿�����/����');
% subplot(3,3,8);plot([1990:2007],A(:,8),'.');hold on;plot([1990:2007+1],nihe(:,8),'r');%legend('ԭʼ����','�������')
% xlabel('ʱ��/��');ylabel('����/%');
% subplot(3,3,9);plot([1990:2007],A(:,9),'.');hold on;plot([1990:2007+1],nihe(:,9),'r');%legend('ԭʼ����','�������')
% xlabel('ʱ��/��');ylabel('�������ܶ�/��Ԫ');
% % subplot(3,3,9);plot([1990:2007],A(:,9),'.');hold on;plot([1990:2007+1],nihe(:,9),'r');
% % xlabel('ʱ��/��');ylabel('�����˿�ռ���˿ڱ���/%');
% % subplot(3,3,9);plot([1990:2007],A(:,9),'.');hold on;plot([1990:2007+1],nihe(:,9),'r');
% % xlabel('ʱ��/��');ylabel('�����˿�ռ���˿ڱ���/%');

%legend('ԭʼ����','�������')
%figure(2);


% 
% 
% 
% 
