%       ��������ת����������ڹ۲�����������ϵת��Ϊ�����ӵ���������꣬�����Ӧ
%       ������ϵ�µľ���Ϊ�˶��ں������ݵĴ������Ҽ�����������öδ���ֻ������
%       ԭʼ�����е�201����600��400�С�������ӵ�1����500��500�еľ����Ӧֵ��
%       ����ԭʼ�����е��к��е�ѡȡ���Ը�������޸ġ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       
%%%     c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c11c1c1c1c1c1c1c
%%%     c1c11c1c1c1c1c1c1c1c1c11c1c1c1c1c1c1c1c1c11c1c1c1c1c1c1c1c1c1
load t22.mat        %�����22���ӵ������� ��������ȡ�ĵ�һ������ľ���ת�������ľ���
syms x z
x1=0;x2=0;z1=0;z2=0;
step=2;
dist=2;
begin=1;
ending=446;
col=dist/step+1;

for row=201:600         %   ��ȡ��Ӧ���� ��ÿһ�н�������任
    row
    for i=0:step:dist   %   ��ȡ�����ĵ���ȡƽ��ֵ
        x1=(begin+i)*2.75/1000.00;
        x2=(ending+i)*2.75/1000.00;
        z1=t22_c1(row,begin+i);
        z2=t22_c1(row,ending+i);
        eq1=(x-x1)^2+(z-z1)^2-3.9500^2; %   ��һ����ͱ�����Բ������ɵķ���
        eq2=(x-x2)^2+(z-z2)^2-3.9500^2; %   �ڶ�����ͱ�����Բ������ɵķ���
        R=solve(eq1,eq2,'x,z');         %   ���÷����� ��ȡ��row�ж�Ӧ���������ĵ�
        if eval(R.z(1,1))>0             %   ���������ϵ����ĵ�
            xdata(1,i/step+1)=eval(R.x(2,1));
            zdata(1,i/step+1)=eval(R.z(2,1));
        else
            xdata(1,i/step+1)=eval(R.x(1,1));   
            zdata(1,i/step+1)=eval(R.z(1,1));
        end
    end
    xm=mean(xdata); %   ����������x���ϵ��������ƽ��ֵ
    zm=mean(zdata); %   ����������y���ϵ��������ƽ��ֵ
    for i=1:500 %  ��ȡ��Ӧ�е����ݣ����ҶԸ��е�ÿһ���еĵ��������ת����
        ct22_c1((row-200),i)=sqrt((xm-(i-1)*2.75/1000)^2+(t22_c1(row,i)-zm)^2)-3.95;
    end
end
save('ct22_c1.mat','ct22_c1');%     �����ӵ���һ������ת����ľ�����б���
clear all                           


%%% c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c
%%% 2c2c2c2c2c2c2c2c2c2c2
load t22.mat     %�����22���ӵ������� ��������ȡ�ĵ�һ������ľ���ת�������ľ�������Ĵ���ͬ��ʡ�ԡ�
syms x z
x1=0;x2=0;z1=0;z2=0;p=-pi:0.01:pi;
step=2;
dist=2;
begin=1;
ending=450;
col=dist/step+1;
for row=201:600
    row
    for i=0:step:dist
        x1=(begin+i)*2.75/1000.00;
        x2=(ending+i)*2.75/1000.00;
        z1=t22_c2(row,begin+i);%%%%%%%
        z2=t22_c2(row,ending+i);%%%%%%
        eq1=(x-x1)^2+(z-z1)^2-3.9500^2;
        eq2=(x-x2)^2+(z-z2)^2-3.9500^2;
        R=solve(eq1,eq2,'x,z');
        if eval(R.z(1,1))>0
            xdata(1,i/step+1)=eval(R.x(2,1));
            zdata(1,i/step+1)=eval(R.z(2,1));
        else
            xdata(1,i/step+1)=eval(R.x(1,1));   
            zdata(1,i/step+1)=eval(R.z(1,1));
        end
    end
    xm=mean(xdata);    
    zm=mean(zdata)
    for i=1:500
        ct22_c2(row-200,i)=sqrt((xm-(i-1)*2.75/1000)^2+(t22_c2(row,i)-zm)^2)-3.95;%%%%%%
    end
end
save('ct22_c2.mat','ct22_c2');%%%%%%%%%%%%%%%%%
clear all
%%%  c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3c3
%%%  c3
load t22.mat
syms x z
x1=0;x2=0;z1=0;z2=0;p=-pi:0.01:pi;
step=2;
dist=2;
begin=1;
ending=450;
col=dist/step+1;
for row=201:600
    row
    for i=0:step:dist
        x1=(begin+i)*2.75/1000.00;
        x2=(ending+i)*2.75/1000.00;
        z1=t22_c3(row,begin+i);%%%%%%%
        z2=t22_c3(row,ending+i);%%%%%%
        eq1=(x-x1)^2+(z-z1)^2-3.9500^2;
        eq2=(x-x2)^2+(z-z2)^2-3.9500^2;
        R=solve(eq1,eq2,'x,z');
        if eval(R.z(1,1))>0
            xdata(1,i/step+1)=eval(R.x(2,1));
            zdata(1,i/step+1)=eval(R.z(2,1));
        else
            xdata(1,i/step+1)=eval(R.x(1,1));   
            zdata(1,i/step+1)=eval(R.z(1,1));
        end
    end
    xm=mean(xdata);    

    zm=mean(zdata)
    for i=1:500
        ct22_c3(row-200,i)=sqrt((xm-(i-1)*2.75/1000)^2+(t22_c3(row,i)-zm)^2)-3.95;%%%%%%
    end
end

save('ct22_c3.mat','ct22_c3');%%%%%%%%%%%%%%%%%
clear all
load t22.mat
syms x z
x1=0;x2=0;z1=0;z2=0;p=-pi:0.01:pi;
step=2;
dist=2;
begin=1;
ending=450;
col=dist/step+1;
for row=201:600
    row
    for i=0:step:dist
        x1=(begin+i)*2.75/1000.00;
        x2=(ending+i)*2.75/1000.00;
        z1=t22_c4(row,begin+i);%%%%%%%
        z2=t22_c4(row,ending+i);%%%%%%
        eq1=(x-x1)^2+(z-z1)^2-3.9500^2;
        eq2=(x-x2)^2+(z-z2)^2-3.9500^2;
        R=solve(eq1,eq2,'x,z');
        if eval(R.z(1,1))>0
            xdata(1,i/step+1)=eval(R.x(2,1));
            zdata(1,i/step+1)=eval(R.z(2,1));
        else
            xdata(1,i/step+1)=eval(R.x(1,1));   
            zdata(1,i/step+1)=eval(R.z(1,1));
        end
    end
    xm=mean(xdata);    
    zm=mean(zdata)
    for i=1:500
        ct22_c4(row-200,i)=sqrt((xm-(i-1)*2.75/1000)^2+(t22_c4(row,i)-zm)^2)-3.95;%%%%%%
    end
end
save('ct22_c4.mat','ct22_c4');%%%%%%%%%%%%%%%%
clear all
