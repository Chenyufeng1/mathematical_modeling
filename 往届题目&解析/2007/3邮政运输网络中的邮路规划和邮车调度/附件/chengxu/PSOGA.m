%-----------------------------------------------
%------���ƣ����������ӵĸĽ�PSO�㷨
%------���ܣ�����ά��Լ���Ż�����
%------�ص㣺������ǿ�������Լ����������
%------���ߣ������� <dreamsun2001@126.com>
%------��λ���й���ҵ��ѧ������ѧ˶2005
%------���ڣ�2006��8��26��
%-----------------------------------------------

%��ʽ��׼��
clear all;
clc;
format long;
%��ʼ����������
c1=1.4962;    %ѧϰ����c1
c2=1.4962;    %ѧϰ����c2
w=0.7298;     %����Ȩ��w
N=20;         %����Ⱥ��ģ
D=6;          %�����ռ�ά��(�������ʺ�3ά�����ϣ��������1,2ά)
eps=10^(-6);  %�����������Ƶ����(�ڲ�֪����Сֵʱ��������)
MaxDT=500;    %����Ⱥ��ֳ�Ĵ���

%��ʼ�����ӵ��ٶȺ�λ�ã����ݽṹ�þ���A��ʾ
for i=1:N
    for j=1:2*D
        A(i,j)=rand;
    end
end
for i=1:N
    for j=2*D+1:3*D
        A(i,j)=A(i,j-2*D);
    end
end
%����������ӵ���Ӧ��
for i=1:N
    A(i,3*D+1)=fitness(A(i,1:D),D);
end
%�����ӵ���Ӧ�Ƚ�������
B=sortrows(A,3*D+1);
%�������Ӧ�ȵ͵�ǰ��һ������ֱ�ӽ�����һ��
NextGeneration=zeros(N,3*D+1);
for i=1:N/2
    for j=1:3*D+1
        NextGeneration(i,j)=B(i,j);
    end
end
%��һ�����ӽ����Ŵ�ѡ��ͽ������
for i=1:N/2
    for j=1:3*D+1
        Cross(i,j)=B(i+N/2,j);
    end
end
%����һ������Ľ���λ��
for i=1:N/4
    Anumber=randperm(D-1);
    if Anumber(1)~=1
        position=Anumber(1);
    else
        position=Anumber(2);
    end
    %�������
    for j=position:D-1
        temp=Cross(i,j);
        Cross(i,j)=Cross(N/2-i+1,j);
        Cross(N/2-i+1,j)=temp;
    end
end
%������������и���
for i=1:N/2
    Cross(i,3*D+1)=fitness(Cross(i,1:D),D);
    if Cross(i,3*D+1)<B(i+N/2,3*D+1)
        for j=2*D+1:3*D
            Cross(i,j)=Cross(i,j-2*D);
        end
    else
        for j=2*D+1:3*D
            Cross(i,j)=B(i,j);
        end
    end
end
%����ѡ����õ�����N/2��������һ��
Pool=zeros(N,3*D+1);
for i=1:N/2
    for j=1:3*D+1
        Pool(i,j)=B(i+N/2,j);
    end
end
for i=1+N/2:N
    for j=1:3*D+1
        Pool(i,j)=Cross(i-N/2,j);
    end
end
%POOLX��ʾ����������ѡ���
PoolX=sortrows(Pool,3*D+1);
for i=1+N/2:N
    for j=1:3*D+1
        NextGeneration(i,j)=PoolX(i-N/2,j);
    end
end
Pbest=NextGeneration(i,2*D+1:3*D);
for i=2:N
    if NextGeneration(i,3*D+1)<fitness(Pbest,D)
        Pbest=NextGeneration(i,2*D+1:3*D);
    end
end
%��������Ⱥ��ʽ���е���(Stander PSO Step)
%�ٶȸ���
for i=1:N
    for j=D+1:2*D
        A(i,j)=w*NextGeneration(i,j)+c1*rand*(NextGeneration(i,j+D)-NextGeneration(i,j-D))+c2*rand*(Pbest(j-D)-NextGeneration(i,j-D));
    end
end
%λ�ø���
for i=1:N
    for j=1:D
        A(i,j)=NextGeneration(i,j)+A(i,j+D);
    end
    A(i,3*D+1)=fitness(A(i,1:D),D);
    if A(i,3*D+1)<NextGeneration(i,3*D+1)
        for j=2*D+1:3*D
            A(i,j)=A(i,j-2*D);
        end
    else
        for j=2*D+1:3*D
            A(i,j)=NextGeneration(i,j-2*D);
        end
    end
end
%���������Ҫѭ����ѭ�����������õ����Ž����Сֵ
%DDTime=1;
for time=1:MaxDT
    B=sortrows(A,3*D+1);
    NextGeneration=zeros(N,3*D+1);
    for i=1:N/2
        for j=1:3*D+1
            NextGeneration(i,j)=B(i,j);
        end
    end
    %�Ŵ�ѡ�񽻲�
    for i=1:N/2
        for j=1:3*D+1
            Cross(i,j)=B(i+N/2,j);
        end
    end

    for i=1:N/4
        Anumber=randperm(D-1);
        if Anumber(1)~=1
            position=Anumber(1);
        else
            position=Anumber(2);
        end
        
        for j=position:D-1
            temp=Cross(i,j);
            Cross(i,j)=Cross(N/2-i+1,j);
            Cross(N/2-i+1,j)=temp;
        end
    end
    %������������и���
    for i=1:N/2
        Cross(i,3*D+1)=fitness(Cross(i,1:D),D);
        if Cross(i,3*D+1)<B(i+N/2,3*D+1)
            for j=2*D+1:3*D
                Cross(i,j)=Cross(i,j-2*D);
            end
        else
            for j=2*D+1:3*D
                Cross(i,j)=B(i,j);
            end
        end
    end
    %����ѡ����õ�����N/2��������һ��
    Pool=zeros(N,3*D+1);
    for i=1:N/2
        for j=1:3*D+1
            Pool(i,j)=B(i+N/2,j);
        end
    end
    for i=1+N/2:N
        for j=1:3*D+1
            Pool(i,j)=Cross(i-N/2,j);
        end
    end
    
    PoolX=sortrows(Pool,3*D+1);
    for i=1+N/2:N
        for j=1:3*D+1
            NextGeneration(i,j)=PoolX(i-N/2,j);
        end
    end
    Pbest=NextGeneration(i,2*D+1:3*D);
    for i=2:N
        if NextGeneration(i,3*D+1)<fitness(Pbest,D)
            Pbest=NextGeneration(i,2*D+1:3*D);
        end
    end
    %��������Ⱥ��ʽ���е���
    for i=1:N
        for j=D+1:2*D
            A(i,j)=w*NextGeneration(i,j)+c1*rand*(NextGeneration(i,j+D)-NextGeneration(i,j-D))+c2*rand*(Pbest(j-D)-NextGeneration(i,j-D));
       end
    end
    
    for i=1:N
        for j=1:D
            A(i,j)=NextGeneration(i,j)+A(i,j+D);
        end
        A(i,3*D+1)=fitness(A(i,1:D),D);
        if A(i,3*D+1)<NextGeneration(i,3*D+1)
            for j=2*D+1:3*D
                A(i,j)=A(i,j-2*D);
            end
        else
            for j=2*D+1:3*D
                A(i,j)=NextGeneration(i,j-2*D);
            end
        end
    end
    Pg(time)=fitness(Pbest,D);
    %DDTime=DDTime+1;
    %if fitness(Pbest,D)<eps
        %break;
    %end
end
%�㷨�������õ��Ľ����ʾ���£�
disp('****************************************************')
disp('���õ�������λ��Ϊ��')
X=Pbest'
disp('�õ��ĺ�����СֵΪ��')
Minimize=fitness(Pbest,D)
disp('****************************************************')
%���ƽ�����������Ӧ�ȹ�ϵ����ͼ
xx=linspace(1,MaxDT,MaxDT);
yy=Pg(xx);
plot(xx,yy,'b-')
hold on
grid on
title('���������ӵ�����Ⱥ�Ż��㷨������������Ӧ��ֵ��ϵ����ͼ')
legend('������Ӧ����������')
%------�㷨����---DreamSun GL & HF-------------------------

