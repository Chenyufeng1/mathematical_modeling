%�����ǲɼ��ĻҶȾ�������任��ͶӰ����γ������ƽ����
%�γ��µĻҶȾ���touyingaa��touyingbb��touyingcc
touyingaa=zeros(1801,1801);
touyingbb=zeros(1801,1801);
touyingcc=zeros(1801,1801);
X=zeros(2288,2288);
Y=zeros(2288,2288);
Z=zeros(2288,2288);
X=aa;%�ҶȾ���
Y=bb;%�ҶȾ���
Z=cc;%�ҶȾ���
for ii=1:1801%�µľ���Ϊ1801*1801�����ؼ��Ϊ0.05��
    for jj=1:1801
        a=6378136.5;
        c=6356751.8;
        H=42164000;
        a0=0.5*pi;
        a1=0.5*pi;
        weidu=45-(ii-1)*0.05;
        jingdu=40+(jj-1)*0.05;
        p=(90-weidu)*pi/180;
        q=(jingdu+3.5)*pi/180;
        if p<=a0&&q<=a1  %���������
        z=sqrt(1/(1/c^2+tan(p)^2/a^2));
        m=z*tan(p);
        x=m*cos(q);
        y=m*cos(a0-q);
        n=z/x;
        mm=(y-H)/x;
        sitai=atan(n/(sqrt(1+mm^2)));
        sitaj=atan(1/(sqrt(mm^2+n^2)));
        i=1145-sitai/0.00014;
        j=1145-sitaj/0.00014;
        elseif p>a0&&q<=a1  %�ϰ������
        z=sqrt(1/(1/c^2+tan(pi-p)^2/a^2));  
        m=z*tan(pi-p);
        x=m*cos(q);
        y=m*cos(a0-q);
        n=z/x;
        mm=(y-H)/x;
        sitai=atan(n/(sqrt(1+mm^2)));
        sitaj=atan(1/(sqrt(mm^2+n^2)));
        i=1145+sitai/0.00014;
        j=1145-sitaj/0.00014;
        elseif p<=a0&&q>a1  %�������ұ�
        z=sqrt(1/(1/c^2+tan(p)^2/a^2));
        m=z*tan(p);
        x=m*cos(pi-q);
        y=m*sin(pi-q);
        n=z/x;
        mm=(y-H)/x;
        sitai=atan(n/(sqrt(1+mm^2)));
        sitaj=atan(1/(sqrt(mm^2+n^2)));
        i=1145-sitai/0.00014;
        j=1145+sitaj/0.00014; 
        elseif p>a0&&q>a1  %�ϰ����ұ�
        z=sqrt(1/(1/c^2+tan(pi-p)^2/a^2));
        m=z*tan(pi-p);
        x=m*cos(pi-q);
        y=m*sin(pi-q);
        n=z/x;
        mm=(y-H)/x;
        sitai=atan(n/(sqrt(1+mm^2)));
        sitaj=atan(1/(sqrt(mm^2+n^2)));
        i=1145+sitai/0.00014;
        j=1145+sitaj/0.00014; 
        end 
        zi=round(i);
        zj=round(j);
        touyingaa(ii,jj)=X(zi,zj);
        touyingbb(ii,jj)=Y(zi,zj);
        touyingcc(ii,jj)=Z(zi,zj);
    end
end







