function  ti_3_zhejiang()  %�����ʶ��㽭ʡ���
clc
A=load('D:\zhejiang.txt');
temp_A=A;
[m,n]=size(A) ;
%A=log(A);
corr(A)
det(corr(A))
baifen=zeros(m-1,n);
%%%%%%%%%%%%%%ȷ������΢�ַ��̵�ϵ��
AA=A(1:end-1,:) ;


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
b=A(2:end,8); 
A_ni=inv(AA'*AA) ;
x7=A_ni*AA'*b;
%%%%%%%%%%%55��������9
b=A(2:end,9); 
A_ni=inv(AA'*AA);
x8=A_ni*AA'*b;
%%%%%%%%%%55��������10
b=A(2:end,10); 
A_ni=inv(AA'*AA);
x9=A_ni*AA'*b;
% %%%%%%%%%%55��������11
b=A(2:end,11); 
A_ni=inv(AA'*AA) ;
x10=A_ni*AA'*b;

r_x=[y1,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10] 
%%%%%%%%%%%%%%%%%%%y1(t+1)=y1*[y1,x1,x2,x3,x4,x5,x6]
%%�ɵõ���ַ�����,����һ�������Ԥ����һ�������
for i=1:m
    for j=1:n
        nihe(i,j)=temp_A(i,:)*r_x(:,j);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%����в��
for j=1:n
      df(j,:)=(A(2:end,j)-nihe(1:m-1,j))';
     %abs((A(2:end,j)-nihe(1:m-1,j))./A(2:end,j));
    cancha(j)=mean(abs((A(2:end,j)-nihe(1:m-1,j))./sum(A(2:end,j)))) ;
end
% df'
% mean(df')
cancha
%%%%%%%%%%%%%%%%%%%%%%%
temp_A;
nihe=[temp_A(1,:);nihe];
figure(1);
subplot(3,3,1);plot([1990:2005],A(:,1),'.');hold on;plot([1990:2005+1],nihe(:,1),'r');legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('��ҵ����/����');
subplot(3,3,2);plot([1990:2005],A(:,2),'.');hold on;plot([1990:2005+1],nihe(:,2),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('GDP/��Ԫ');
subplot(3,3,3);plot([1990:2005],A(:,3),'.');hold on;plot([1990:2005+1],nihe(:,3),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�̶��ʲ�Ͷ��/��Ԫ');
subplot(3,3,4);plot([1990:2005],A(:,4),'.');hold on;plot([1990:2005+1],nihe(:,4),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�Ͷ�������/��/��');
subplot(3,3,5);plot([1990:2005],A(:,5),'.');hold on;plot([1990:2005+1],nihe(:,5),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('����ó�׶�/��Ԫ');
subplot(3,3,6);plot([1990:2005],A(:,6),'.');hold on;plot([1990:2005+1],nihe(:,6),'r');
xlabel('ʱ��/��');ylabel('�����˾���֧������/Ԫ/ÿ��');
subplot(3,3,7);plot([1990:2005],A(:,7),'.');hold on;plot([1990:2005+1],nihe(:,7),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('����/%');
subplot(3,3,8);plot([1990:2005],A(:,8),'.');hold on;plot([1990:2005+1],nihe(:,8),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�г���ˮƽ/Ԫ/��');
subplot(3,3,9);plot([1990:2005],A(:,9),'.');hold on;plot([1990:2005+1],nihe(:,9),'r');%legend('ԭʼ����','�������')
xlabel('ʱ��/��');ylabel('�㽭�˿�����/����');

