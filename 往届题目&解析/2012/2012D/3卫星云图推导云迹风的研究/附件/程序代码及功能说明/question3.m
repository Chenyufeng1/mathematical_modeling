
%����yunjifeng.m������touying��touyingbb,touyingcc��Ϊ����ͶӰ����ͨ����ÿ�����ص�����ݶȣ����ݶȽ��зֶ�ȷ������Ӧ���ڴ�С
 %windowpixΪ�����δ��ڵ�һ���߰���������ֵ
 weiyii=zeros(1018,1018);
 weiyij=zeros(1018,1018);
for i=32:1049
    for j=32:1049
       
 a=touying(i:i+2,j:j+2);
 dx= a(3,1)  + a(3,2) * 2 + a(3,3)+a(1,1)* (-1) + a(1,2) * (-2) + a(1,3) * (-1); 
 dy=a(1,3) + a(2,3) *2 + a(3,3) +a(1,1) * (-1) + a(2,1) * (-2) + a(3,1) * (-1); 
 tidu=sqrt(dx^2+dy^2);

if tidu<=100   %
  windowpix=32;
elseif tidu<=200&&tidu>100
  windowpix=16;   
else
  windowpix=8;
end
tiduwindow=zeros(windowpix,windowpix);
tiduwindow(1,1)=tidu;
%��ȷ�������صĴ��ڣ����㴰���ݶ�
for ii=i-windowpix/2:i+windowpix/2-1
    for jj=j-windowpix/2:j+windowpix/2-1
                     a=touying(ii:ii+2,jj:jj+2);
                     dx= a(3,1) + a(3,2) * 2 + a(3,3)+a(1,1)* (-1) + a(1,2) * (-2) + a(1,3) * (-1); 
                     dy=a(1,3) + a(2,3) *2 + a(3,3) +a(1,1) * (-1) + a(2,1) * (-2) + a(3,1) * (-1); 
                     tiduwindow(ii-i+windowpix/2+1,jj-j+windowpix/2+1)=sqrt(dx^2+dy^2);
    end
end
tidumean=mean(mean(tiduwindow));
r=zeros(64-windowpix,64-windowpix);
 %ȷ��������Χ
 for m=i-31:i+windowpix %m������ʼ���,ÿ������ƽ�ƴ���
       for n=j-31:j+windowpix% n������ʼ���
            temp1=0;
           for ii=m:m+windowpix-1 %����������ͳ��
           for jj=n:n+windowpix-1
               if touying(ii,jj)>512
               temp1=temp1+1;%����
               end
           end
           end
           if temp1<0.25*windowpix*windowpix
                for ii=m:m+windowpix-1
                for jj=n:n+windowpix-1
                    weiyii(ii,jj)=0;
                    weiyij(ii,jj)=0;
                end
                end
           else %��ÿ�����ص��ݶȺʹ��ڵ��ݶȾ�ֵ
              fenzi=0;
              fenmu1=0;
              fenmu2=0;
              for ii=m:(m+windowpix-1)  %��
                for jj=n:(n+windowpix-1)
                    %ÿ������
                    %for kk=1:windowpix
                      a=touyingbb(ii:ii+2,jj:jj+2);
                      dx= a(3,1)  + a(3,2) * 2 + a(3,3)+a(1,1)* (-1) + a(1,2) * (-2) + a(1,3) * (-1); 
                      dy=a(1,3) + a(2,3) *2 + a(3,3) +a(1,1) * (-1) + a(2,1) * (-2) + a(3,1) * (-1); 
                      tiduwindowbb(ii-m+1,jj-n+1)=sqrt(dx^2+dy^2);
                end
              end
                
                tidumeanbb=mean(mean(tiduwindowbb));
                for iii=1:windowpix%i-windowpix/2:i+windowpix/2-1
                  for jjj=1:windowpix%j-windowpix/2:j+windowpix/2-1 %ÿ�����ڼ������ϵ��
                    fenzi=fenzi+(tiduwindow(iii,jjj)- tidumean )*(tiduwindowbb(iii,jjj)- tidumeanbb);%???�ݶ�
                    fenmu1= fenmu1+(tiduwindow(iii,jjj)- tidumean )^2;
                    fenmu2= fenmu2+(tiduwindowbb(iii,jjj)- tidumeanbb)^2;
                  end   
               end
              r(m-i+32,n-j+32)=fenzi/sqrt( fenmu1*fenmu2);
           end 
       end
   end
             [M,I]=max(r);
             [N,J]=max(M);
             maxi=I(J)+m;
             maxj=J+n; %���ֵ�����к�
  
         
 
   if max(max(r))<0.5
    weiyii(i,j)=0;
     weiyij(i,j)=0
    else   
   weiyii(i,j)= i-maxi;
   weiyij(i,j)=j-maxj;
    end
 end
end
a=6378136.5;
b=6356751.8;

V=zeros(81,81);%�ٶ�
J=zeros(81,81);%�Ƕ�
for i=40:-1:-40%γ��
    for j=46:126%����
        ih=i*pi/180;
        jh=j*pi/180;
        wi=20*(45+i)+1;%��γ�������к�
        wj=20*(j-40)+1;%��γ�������к�
        if (weiyii(wi,wj)~=0)||(weiyij(wi,wj)~=0)
            wi1=wi+weiyii(wi,wj);%λ�ƺ�γ�������к�
            wj1=wj+weiyij(wi,wj);%λ�ƺ�γ�������к�
            i1=((wi1-1)*0.05-45)*pi/180;%λ�ƺ�γ��
            j1=(40+(wj1-1)*0.05)*pi/180;%λ�ƺ󾭶�
            yuanxinjiao=acos(cos(pi/2-ih)*cos(pi/2-i1)+sin(pi/2-ih)*sin(pi/2-i1)*cos(abs(j1-jh)));%Բ�Ľ�
            xx=sqrt(a^2*b^2/(b^2+a^2*tan(abs(ih))^2));
            r=xx/cos(abs(ih));%�뾶
            huchang=yuanxinjiao*r;%����
            v=huchang/1800;%�ٶȣ���λ��/��
            if j1<jh
                jiao=2*pi-acos((cos(pi/2-i1)-cos(yuanxinjiao)*cos(pi/2-ih))/sin(yuanxinjiao)*sin(pi/2-ih));
            else
                jiao=acos((cos(pi/2-i1)-cos(yuanxinjiao)*cos(pi/2-ih))/sin(yuanxinjiao)*sin(pi/2-ih));
            end
            V(41-i,j-45)=v;
            J(41-i,j-45)=jiao;
        else
            V(41-i,j-45)=0;
            J(41-i,j-45)=0;
        end
    end
end    
       
             
          
             
              
              
            
              
    
             
             
     
     
 
