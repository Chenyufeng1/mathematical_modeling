%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  R,Q�����ӷ�������              %
%  2010-9-18 ���ϴ�ѧ  ���� %
%��Ҫ�ο��鼮��
% �߻�诣�Ӧ�ö�Ԫͳ�Ʒ�����������ѧ������,2005
%Ԭ־�����ܾ��󣬶�Ԫͳ�Ʒ�������ѧ������,2002
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           ��������            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������ݣ�ʹ��ʱע�����ݸ�ʽ
clc;
clear
load('data61.mat');
x=s;
%x=load('Paperdata.txt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           ��������            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PCNum=7; %��ȡ������Ŀ
RorQ=1;   %�������ͣ�1-R�ͷ�����2-Q�ͷ���
IsRattion=1; %�Ƿ����������ת��0-��1-��
IsSTD=1; %�Ƿ���б�׼������0-��1-��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           �����������            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rr,tt]=size(x);
a1=mean(x);
stdr=std(x);
if IsSTD==1
    sr=(x-a1(ones(rr,1),:))./stdr(ones(rr,1),:);%��������׼������
    x=sr;  %�����ӵ÷�ϵ����ʽ��xӦΪ��׼������
else
    sr=x;
end;
if RorQ==1
    r=corrcoef(sr);%��ؾ���
else
    r=calAssempleX(sr);%��Ʒ���ƾ���
    tt=rr;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('������ֵ������������');
[v,d]=eig(r);     %������ֵ����������
d=d(tt:-1:1,tt:-1:1);%����ֵ�Ӵ�С����
v=v(:,tt:-1:1);   %��������Ҳ��Ӧ����
aa=sum(d) %�����кͣ�ʵ������ȡ����ֵ
a2=100*d/sum(aa);%�����ӶԷ���Ĺ����ʣ��ɴ�ȷ����������
for i=1:tt %�����Ӻ������
    for j=1:tt
        a3(j,i)=v(j,i)*sqrt(aa(i));
    end
end;
v
length(find((d>1)==1))
pp=sum(a2);
pv=sum(pp(1:PCNum)); %����ͼ�������
disp(['ǰ',num2str(PCNum),'���������ۻ�������: ',num2str(pv,'%0.2f'),'%]']);

a3=a3(:,1:PCNum);  %��������
disp('��תǰ�����غɾ���');
a3

for i=1:PCNum%�����ӷ���ף�����ʵ�ʵ��ڸ������Ӷ�Ӧ�ķ���
    a5(i)=0;
    for j=1:tt
        a5(i)=a5(i)+a3(j,i)^2;
    end
end
disp(['ǰ',num2str(PCNum),'�������ӷ�����빱����(%)']);
[a5',pp(1:PCNum)']

for i=1:tt   %�������ӷֱ���ظ������ķ���
    a(i)=0;
    for j=1:PCNum
        a(i)=a(i)+a3(i,j)^2;
    end
end;
disp(['ǰ',num2str(PCNum),'�������ӷֱ����',num2str(tt) ,'�������ķ��������ͬ�ȣ�: %']);
a*100

%��ת�������
% a3=[  0.64 -0.64;
%     0.68  -0.55;
%     0.65  -0.52;
%     0.65  0.52;
%     0.68  0.55;
%     0.64  0.64;
%     ]
% PCNum=2;
% tt=6;

A=a3;
kkk=0;
if IsRattion==1
    orgA=a3;
    if PCNum==2
        disp('��תǰֱ�����꣺');
        TA=[1 0;
            0 1]
    end;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %���½�����ת��������
    v2=1e+10;
    VV=[];
    for kk=1:20%������ת��������
        c1=0;
        b=0;%�������Ӿ���ķ���
        [a3]=GuiGeHua(orgA);  %ÿ����ת��Ҫ�����滯����񻯣�����
        for j=1:PCNum
            c=0;
            for i=1:tt
                b=b+a3(i,j)^4;
                c=c+a3(i,j)^2;
            end
            c1=c1+c*c;
        end
        v1=b/tt-c1/tt^2;
        if abs(v1-v2)<=1e-6%�ж��Ƿ���Ҫ��ת
            break
        end
        VV=[VV;v1];
        %a3=ration(a3);%������ת����
        [a3,RT]=rationNew(orgA,a3);%������ת����
        if PCNum==2
            TA=TA*RT;
        end;
        orgA=a3;
        kkk=kkk+1;
        v2=v1;
    end
    if PCNum==2
        disp('��ת��ֱ�����꣺');
        TA
    end;
    disp(['��ת',num2str(kkk),'��']);
    disp('�������������ת����');
    a3=orgA
    disp('�����ܷ���仯��')
    VV
    for i=1:PCNum%�����ӷ���ף�����ʵ�ʵ��ڸ������Ӷ�Ӧ�ķ���
        a5(i)=0;
        for j=1:tt
            a5(i)=a5(i)+a3(j,i)^2;
        end
    end
    disp(['ǰ',num2str(PCNum),'�������ӷ����']);
    a5
end;

if RorQ==2
    hold on;
    for i=1:length(A)
        x=A(i,1);
        if x>=0
            x=x*1.05;
        else
            x=x*0.95;
        end;
        y=A(i,2);
        if y>=0
            y=y*1.05;
        else
            y=y*0.95;
        end;
        text(x,y,int2str(i),'FontSize',10,'FontWeight','bold');
        plot(A(i,1),A(i,2),'^r', 'MarkerFaceColor','r','MarkerSize',6);
    end;
    hold off;
    h=legend('��Ʒ',-1);
    set(h,'fontsize',9,'FontWeight','bold');
    h=xlabel(['Q�����ӷ���ƽ����Ʒ�����ͼ ��ת',num2str(kkk),'�Σ�[�ۻ�������: ',num2str(pv,'%0.2f'),'%]']);
    set(h,'fontsize',9,'FontWeight','bold');
    break;
end;

disp('���ӵ÷ֺ�����');
y1=a3'*inv(r) %�����ӵ÷�ϵ����,�ô˹�ʽ��xӦΪ��׼������
disp(['R�������ӷ�����',num2str(rr),'����Ʒ���ӵ÷־���']);
AA=(y1*x')'  %�����ӵĵ÷�

%%%%%%%%%%%%%%%%%%%%%%%
%  ���»�ͼ����        %
%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(2,1,1);
hold on;
plot3(0,0,0);
size(A)
for i=1:length(A)
    x=A(i,1);
    y=A(i,2);
    z=A(i,3);
    plot3(x,y,z);
    text(x,y,z,int2str(i),'FontSize',9,'FontWeight','normal','BackgroundColor','r','color','w','EdgeColor','k');
end;
hold off;
h=legend('����',-1);
set(h,'fontsize',9,'FontWeight','bold');
h=xlabel(['R�����ӷ���ƽ����������ͼ ��ת',num2str(kkk),'�Σ�[�ۻ�������: ',num2str(pv,'%0.2f'),'%]']);
set(h,'fontsize',9,'FontWeight','bold');



A=AA; %��һ���������ӵĵ÷�
%A=[A(:,1),-A(:,2)];
minX=min(A(:,1));
maxX=max(A(:,1));
minY=min(A(:,2));
maxY=max(A(:,2));
[X1]=Mod_Scale(minX,minX,maxX,0);
[X2]=Mod_Scale(maxX,minX,maxX,1);
[Y1]=Mod_Scale(minY,minY,maxY,0);
[Y2]=Mod_Scale(maxY,minY,maxY,1);

subplot(2,1,2);

hold on;
plot(0,0)
for i=1:length(A(:,1))
    x=A(i,1);
    y=A(i,3);
    plot(x,y)
    %      text(x,y,int2str(i),'FontSize',9,'FontWeight','bold');
    %      plot(A(i,1),A(i,2),'^b', 'MarkerFaceColor','b','MarkerSize',8);
    text(x,y,int2str(i),'FontSize',9,'FontWeight','normal','BackgroundColor','r','color','w','EdgeColor','k');
end;
hold off;
h=legend('��Ʒ',-1);
set(h,'fontsize',9,'FontWeight','bold');
h=xlabel(['R�����ӷ���ƽ����Ʒ�����ͼ ��ת',num2str(kkk),'�Σ�[�ۻ�������: ',num2str(pv,'%0.2f'),'%]']);
set(h,'fontsize',9,'FontWeight','bold');
axis([X1, X2, Y1, Y2]);