function [y,T]=rationNew(A,x)%������󷽲���ת����,y:��ת�����T����ת�任����
[r,c]=size(x);

for k=1:c-1  %����ת�Ƕ�
    for j=k+1:c %���������ת
        aa=0;bb=0;cc=0;dd=0;
        for i=1:r
            uu=x(i,k)^2-x(i,j)^2;
            vv=x(i,k)*x(i,j)*2;
            aa=aa+uu;
            bb=bb+vv;
            cc=cc+uu^2-vv^2;
            dd=dd+uu*vv*2;
        end
        dd=r*dd-2*aa*bb;
        cc=r*cc-aa^2+bb^2;
        %��dd,  ccȷ����ת�ǵķ�Χ������������
        if abs(cc)<=1e-10
            b=pi/2;
        else
            b=abs(atan(dd/cc));
        end
        if cc<0
            b=pi-b;
            if dd>0;
                b=0.25*b;
            else
                b=-b*0.25;
            end
        elseif dd>0
            b=0.25*b;
        else
            b=-0.25*b;
        end
        si=sin(b);c0=cos(b);    %��ת����            
        T=[c0,  -si;   %��¼��ת����
            si,  c0];
        for i=1:r  %�Թ��ǰ�ľ���ʵʩ��ת����
            qq=A(i,k)*c0+A(i,j)*si;
            A(i,j)=-A(i,k)*si+c0*A(i,j);
            A(i,k)=qq;
        end
    end
end
y=A;
end

