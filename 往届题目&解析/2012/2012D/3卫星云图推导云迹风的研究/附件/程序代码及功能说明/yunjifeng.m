%�Ƽ������
%��touyingaa��touyingbb��touyingccΪ���룬������ʸ������ģ�ͣ��������ϵ�������
%���ӵĴ����ڣ��ƿ�ʶ�����ϵ����ֵ���飬ƥ�����������,�����Լ��
f=zeros(1801,1801);
g=zeros(1801,1801);
h=zeros(1801,1801);

f=touyingbb;
g=touyingcc;
h=touyingaa;

ff=0;%2030�ô����ڲ�����ĻҶ�ƽ��ֵ
wyi=zeros(109,109);%���������ϵ�����ֵ��Ӧ��λ����
wyj=zeros(109,109);%���������ϵ�����ֵ��Ӧ��λ����
wyi1=zeros(109,109);%���������ϵ�� �����ֵ��Ӧ��λ����
wyj1=zeros(109,109);%���������ϵ�� �����ֵ��Ӧ��λ����
weiyii=zeros(1801,1801);%���������ϵ�����ֵ��Ӧ��λ����
weiyij=zeros(1801,1801);%���������ϵ�����ֵ��Ӧ��������
xishumax=zeros(109,109);%���ϵ�����ֵ
xishumax1=zeros(109,109);%���ϵ�������ֵ
for i=1:109 %�������110�����ڣ�ʾ���ƣ�
    for j=1:109 %�������110�����ڣ�ʾ���ƣ�
        m=25+16*(i-1);%��������ʼ�к�
        n=25+16*(j-1);%��������ʼ�к�   
        %�ƿ�ʶ��
        temp1=0;
        for ii=m:(m+15)
            for jj=n:(n+15)
                if f(ii,jj)>512
                    temp1=temp1+1;
                end
            end
        end
        if temp1<64
            for ii=m:(m+15)
                for jj=n:(n+15)
                    weiyii(ii,jj)=0;
                    weiyij(ii,jj)=0;
                end
            end
        else
            for ii=m:(m+15)
                for jj=n:(n+15)
                    ff=ff+f(ii,jj);
                end
            end
            ff=ff/(16*16);
            fenmu1=0;
            for ii=m:(m+15)
                for jj=n:(n+15)
                    fenmu1=fenmu1+(f(ii,jj)-ff)^2;
                end
            end   
            xishu=zeros(25,25);
            p=zeros(25,25);
            q=zeros(25,25);
            for ii=1:25
                for jj=1:25
                    p(ii,jj)=26-2*ii;%λ�Ƹı������У�
                    q(ii,jj)=2*jj-26;%λ�Ƹı������У�
                    gg=0;%2100�ô�����Χ��Ŀ�괰���ڲ�����ĻҶ�ƽ��ֵ
                    for iii=(m+p(ii,jj)):(m+p(ii,jj)+15)
                        for jjj=(n+q(ii,jj)):(n+q(ii,jj)+15)
                            gg=gg+g(iii,jjj);
                        end
                    end
                    gg=gg/(16*16);
                    fenzi=0;
                    for iii=m:(m+15)
                        for jjj=n:(n+15)
                            fenzi=fenzi+(f(iii,jjj)-ff)*(g(iii+p(ii,jj),jjj+q(ii,jj))-gg);
                        end
                    end
                    fenmu2=0;
                    for  iii=m:(m+15)
                        for jjj=n:(n+15)
                            fenmu2=fenmu2+(g(iii+p(ii,jj),jjj+q(ii,jj))-gg)^2;
                        end
                    end
                    xishu(ii,jj)=fenzi/sqrt(fenmu1*fenmu2);
                    if xishu(ii,jj)>xishumax(i,j)
                        xishumax(i,j)=xishu(ii,jj);
                        wyi(i,j)=p(ii,jj);
                        wyj(i,j)=q(ii,jj);
                    end
                end
            end
            for ii=1:25
                for jj=1:25
                    if (xishu(ii,jj)>xishumax1(i,j))&&(xishu(ii,jj)~=xishumax(i,j))
                        xishumax1(i,j)=xishu(ii,jj);
                        wyi1(i,j)=p(ii,jj);
                        wyj1(i,j)=q(ii,jj);
                    end
                end
            end
            
            
            if (abs(wyi(i,j)-wyi1(i,j))<3)&&(abs(wyj(i,j)-wyj1(i,j))<3)%ƥ�����������
                if (xishumax(i,j)-xishumax1(i,j))<0.01
                    wyi(i,j)=0;
                    wyj(i,j)=0;
                end
            else%ͨ��ƥ�����������,���������Լ��
                for ii=(m-wyi(i,j)):(m-wyi(i,j)+15)
                    for jj=(n-wyj(i,j)):(n-wyj(i,j)+15)
                        hh=0;
                        for iii=(m-wyi(i,j)):(m-wyi(i,j)+15)
                        	for jjj=(n-wyj(i,j)):(n-wyj(i,j)+15)
                                hh=hh+h(iii,jjj);
                            end
                        end
                        hh=hh/(16*16);
                        fenzi=0;
                        for iii=m:(m+15)
                            for jjj=n:(n+15)
                                fenzi=fenzi+(f(iii,jjj)-ff)*(h(iii-wyi(i,j),jjj-wyj(i,j))-hh);
                            end
                        end
                        fenmu2=0;
                        for  iii=m:(m+15)
                            for jjj=n:(n+15)
                                fenmu2=fenmu2+(h(iii-wyi(i,j),jjj-wyj(i,j))-hh)^2;
                            end
                        end
                        xishu1=fenzi/sqrt(fenmu1*fenmu2);
                    end
                end
                
                for ii=(m-wyi1(i,j)):(m-wyi1(i,j)+15)
                    for jj=(n-wyj1(i,j)):(n-wyj1(i,j)+15)
                        hh1=0;
                        for iii=(m-wyi1(i,j)):(m-wyi1(i,j)+15)
                        	for jjj=(n-wyj1(i,j)):(n-wyj1(i,j)+15)
                                hh1=hh1+h(iii,jjj);
                            end
                        end
                        hh1=hh1/(16*16);
                        fenzi1=0;
                        for iii=m:(m+15)
                            for jjj=n:(n+15)
                                fenzi1=fenzi1+(f(iii,jjj)-ff)*(h(iii-wyi1(i,j),jjj-wyj1(i,j))-hh1);
                            end
                        end
                        fenmu21=0;
                        for  iii=m:(m+15)
                            for jjj=n:(n+15)
                                fenmu21=fenmu21+(h(iii-wyi1(i,j),jjj-wyj1(i,j))-hh1)^2;
                            end
                        end
                        xishu2=fenzi1/sqrt(fenmu1*fenmu21);
                    end
                end
                
                if abs(xishu1-xishu2)<0.01
                    wyi(i,j)=0;
                    wyj(i,j)=0;
                else
                    if abs(xishu1-xishumax(i,j))>0.2
                        wyi(i,j)=0;
                        wyj(i,j)=0;
                    end
                end
            end
            if xishumax(i,j)>0.5%��ֵ����
                for ii=m:(m+15)
                    for jj=n:(n+15)
                        weiyii(ii,jj)=wyi(i,j);
                        weiyij(ii,jj)=wyj(i,j);
                    end
                end
            end
        end
    end
end

%������ʸ����
geshu=0;
for i=1:109
    for j=1:109
        if xishumax(i,j)>0
            geshu=geshu+1;
        end
    end
end
%ͨ�����ص�λ�Ƹı������ʸ���ٶȺͽǶ�
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


        
        









        
        