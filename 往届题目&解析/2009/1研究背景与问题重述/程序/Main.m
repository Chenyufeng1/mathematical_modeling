%%
%������Ϊ�����򣬴�ԭʼ���ݳ�����������Ƭ��ά���ݣ�
%%�������������㷨����һɨ��������Ƭͼ�Σ���ȡ�����塣�洢����������Ϣ����ȫ������������Ϣ��

load 30213.dat  %%%30213.datΪԭʼ���ݣ����Ƕ����������ӵ����б�ţ�30213��ָ������02��ǹ����ĵ�һ���ӵ���4���档  
 data0=X30213;  %load���ݺ󣬰����������ض���Ϊdata0
 resnum=30213;     %����һ���棬����Ƭ���ݣ�������resdata{}�У�ÿһ��Ϊһ��������ݣ�resdata��n,1��������Ӧ����


das=size(data0,1);
x=data0(1:564,1);
y=data0(1:564:das-563,2);
%ͼ����Ƭ����ȡ��ͬy���ֱ�ó�xoz����Ϣ����x��������ƽ�Ƶ���             
ii=10;
hang=find(data0(:,2)==y(ii));
data11=data0(hang,[1 3]);
for ii=20:10:750
    za=zeros(size(x,1),2);
hang=find(data0(:,2)==y(ii));

za(:,1)=data0(hang,1)+x(end,1)*(ii/10-1);
za(:,2)=data0(hang,3);
data11=[data11;za];
end

data12=data11;data13=data11;

%% �˲���ȥ������������Ƭ����������������ϣ�����΢���֣�Ϊ���ļ���׼����

G11=csaps(data12(:,1),data12(:,2),0.999998);        %0.999998Ϊ�����˲��Ĳ���
data11=[data12(:,1) fnval(G11,data12(:,1))];
    ZG=csaps(data11(:,1),data11(:,2),1);           %ԭͼ�����
    DZ=fnder(ZG);                                  %΢�ֺ���
    TG=fnint(ZG);                                  %���ֺ���
%nmax=564*1;plot(data12(1:nmax,1),data11(1:nmax,2))


%% ÿ��ץȡһ��L0���ȵ���Ϣ����ŵ�����sdata�У�������һ���������������ȡ��
L0=50;Li=10;maxsj=floor(564/L0);%L0�Ǳ�־���ȡ�Li��������

Sdata=[];

for si=1:75%75
    sj0=1;sj=0;
    while sj0
    sj=sj+1;
        if Li*(sj-1)+L0>564
            sx1=(si-1)*564+Li*(sj-1)+1;
            sx2=(si)*564;
            sj0=0;
        else
            sx1=(si-1)*564+Li*(sj-1)+1;
            sx2=(si-1)*564+Li*(sj-1)+L0;
        end
        sdata=data11(sx1:sx2,:);
       das=size(sdata,1);
       Zdata=sdata;
        
 
%%          

%Ѱ����͵�,�Ҹõ��Ӧ��������
[Zdx Zdz]=min(Zdata(:,2));
xmin=Zdata(Zdz,1);
L2=200;
ee=0.03;
xstep=0.00275;

  %  ZG=csaps(Zdata(:,1),Zdata(:,2),1);
  %  DZ=fnder(ZG);
Zii=1;i=0;
dx1=[];
while Zii
    xleft=[];
if xmin==Zdata(1,1)||xmin==Zdata(end,1) %������С���ڶ˵㣬������
Zii=0;
else
    i=i+1;
    xnow=xmin-i*xstep;
    dx10=fnval(DZ,xnow);
if xnow<data11((si-1)*564+1,1)  %�������һ����ƫ����һ������
    Zii=0;
 
elseif xnow<Zdata(1,1)   %���1�����˸öβ��ε���˵�
    
    if xnow<Zdata(1,1)-L2*xstep %���1����������趨��Χ�⣬ֹͣ����
        Zii=0;
    
    else                        %���1��������������  
            dx1=[dx1 dx10];
    if size(dx1,2)>5  %���ֹյ�
        if dx1(end)*dx1(end-5)<=0&&dx1(end-1)*dx1(end-4)<=0
            Zii=0;
        
            xleft=xnow;
        end
    end
     if size(dx1,2)>5  %����ƽ̨��
           if abs(dx1(end))<ee&&abs(dx1(end-1))<ee&&abs(dx1(end-2))<ee
            Zii=0;
          
            xleft=xnow;
           end
     end
        
    end
else                       %���2���������
    dx1=[dx1 dx10];
    if size(dx1,2)>5  %���ֹյ�
        if dx1(end)*dx1(end-5)<=0&&dx1(end-1)*dx1(end-4)<=0
            Zii=0;
         
            xleft=xnow;
        end
    end
     if size(dx1,2)>5  %����ƽ̨��
           if abs(dx1(end))<ee&&abs(dx1(end-1))<ee&&abs(dx1(end-2))<ee
            Zii=0;
          
            xleft=xnow;
           end
     end
end
    
end
end


Zii=1;i=0;
dx2=[];
while Zii
    xright=[];
if xmin==Zdata(1,1)||xmin==Zdata(end,1) %������С���ڶ˵㣬������
Zii=0;
else
    i=i+1;
    xnow=xmin+i*xstep;
    dx10=fnval(DZ,xnow);
if xnow>data11((si)*564-1,1)  %�������һ����ƫ����һ������
    Zii=0;
    
elseif xnow>Zdata(end,1)   %���1�����˸öβ��ε���˵�
    
    if xnow>Zdata(end,1)+L2*xstep %���1����������趨��Χ�⣬ֹͣ����
        Zii=0;
     
    else                        %���1��������������  
            dx2=[dx2 dx10];
    if size(dx2,2)>5  %���ֹյ�
        if dx2(end)*dx2(end-5)<=0&&dx2(end-1)*dx2(end-4)<=0
            Zii=0;
           
            xright=xnow;
        end
    end
     if size(dx2,2)>5  %����ƽ̨��
           if abs(dx2(end))<ee&&abs(dx2(end-1))<ee&&abs(dx2(end-2))<ee
            Zii=0;
           
            xright=xnow;
           end
     end
        
    end
else                       %���2���������
    dx2=[dx2 dx10];
    if size(dx2,2)>5  %���ֹյ�
        if dx2(end)*dx2(end-5)<=0&&dx2(end-1)*dx2(end-4)<=0
            Zii=0;
         
            xright=xnow;
        end
    end
     if size(dx2,2)>5  %����ƽ̨��
           if abs(dx2(end))<ee&&abs(dx2(end-1))<ee&&abs(dx2(end-2))<ee
            Zii=0;
           
            xright=xnow;
           end
     end
end
    
end
end



if isempty(xleft)
    
elseif isempty(xright)
    
else
    [xleft xmin xright];
    
     %figure; hold on;      plot(sdata(:,1),sdata(:,2));
     %nmax=564*1;plot(data12(1:nmax,1),data11(1:nmax,2));
     %plot([xleft+0.00275*1 xleft+0.00275*1],[min(Zdata(:,2)) max(Zdata(:,2))]);
     %plot([xright-0.00275*1 xright-0.00275*1],[min(Zdata(:,2)) max(Zdata(:,2))]);
     
     
     %4��ָ�꣺�н�v0����߱��ұ�L12�����������As�������Af
xmy=fnval(ZG,[xleft xmin xright]);yleft=xmy(1);ymin=xmy(2);yright=xmy(3);
va=[xleft-xmin yleft-ymin];vb=[xright-xmin yright-ymin];
v0=acos(va*vb'/(sqrt(va(1).^2+va(2).^2)*sqrt(vb(1).^2+vb(2).^2)));

L12=sqrt(va*va')/sqrt(vb*vb');

%As=abs((xleft*ymin+xmin*yright+xright*yleft-xleft*yright-xmin*yleft-xright*ymin)/2) 
As=sqrt(va*va')*sqrt(vb*vb')*sin(v0)/2;
Ar=abs((yleft+yright)*(xright-xleft)/2);
I=abs(fnval(TG,xleft)-fnval(TG,xright));
Af=abs(Ar-I);
saa=[v0;L12;As;Af;si;sj];
Sdata=[Sdata saa];
end  
        
        
    end
    
    
end
    
Sdata;
    
    
    %  TUnum=zeros(100000,1);TUzhb=zeros(100000,4);TUdata00=cell(100000,3);
SSe=0.02;

SSdata=[Sdata;zeros(1,size(Sdata,2))];
for SSi=2:size(Sdata,2)
   if abs(SSdata(1,SSi)-SSdata(1,SSi-1))<SSe*SSdata(1,SSi)&&abs(SSdata(2,SSi)-SSdata(2,SSi-1))<SSe*SSdata(2,SSi)
   else
      SSdata(7,SSi)=1;
   end
end

Udata=SSdata(:,find(SSdata(7,:)==1))';

%resdata Ϊ����Ĵ洢���ݿ⣬ÿ������ռһ����Ϣ��������ţ���������󣬺���Ƭ���ݡ�
load resdata  %  resdata=cell(10000,6);save resdata resdata
ii01=0;ii02=1;
while ii02
    ii01=ii01+1;
    if isempty(resdata{ii01,1})
        ii02=0;
    end
end
resdata{ii01,1}=resnum;
resdata{ii01,2}=Udata;
resdata{ii01,3}=data13;
save resdata resdata
% save beifen1 resdata
resdata{ii01,1}