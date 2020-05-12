%��ˮģ��

 
left_map_x             = 446400
lower_map_y            = 3517200
right_map_x            = 455400
upper_map_y            = 3526380
number_of_rows         = 103
number_of_columns      = 101

step=1;
x=1:number_of_columns ;
y=1:number_of_rows;
[x1,y1]=meshgrid(y,x);
x2=1:step:number_of_columns ;
y2=1:step:number_of_rows;
[x3,y3]=meshgrid(y2,x2);
t11=interp2(x1,y1,data,x3,y3,'cubic');
data2=t11;
[row,col]=size(data2);

%�������
scale=abs(left_map_x -right_map_x )*abs(lower_map_y- upper_map_y)/(number_of_rows*number_of_columns);
%���ȷ���
scale2=sqrt(scale);

%���ӱ���
a=1/3;
%������ϲ���
load('nihe.mat');
v=0;
h0=675;
t=1;%����Ϊ��λ

H=[]; 
S=[];
Vcheck=[];

while v<2.2*10^8*a
    %�������3������
    %v=polyval(y_lei,t/60,s_lei);  
    v=0.01715*(t*3600)^2+135.03*(t*3600);%-7.8753*10^6;
    
    for h=h0:0.01:900
     
     check=zeros(row,col);
     %ȷ������
     seed_i=1;
     seed_j=70;%*(1/step)-1; 
     
     if(data2(seed_i,seed_j)>h)
         disp(['error!','seed_h=',num2str(data2(seed_i,seed_j)),' h=',num2str(h)]);
         continue;
     end
     
     check(seed_i,seed_j)=1;
     
     %��һ����������
     if seed_j+1<=col
     if(data2(seed_i,seed_j+1)<=h)
         check(seed_i,seed_j+1)=2;
     end
     end
     if seed_i+1<=row
     if(data2(seed_i+1,seed_j)<=h)
         check(seed_i+1,seed_j)=2;
     end
     end
     
      if seed_j-1>0
      if(data2(seed_i,seed_j-1)<=h)
         check(seed_i,seed_j-1)=2;
      end
      end
      
      if seed_i-1>0
      if(data2(seed_i-1,seed_j)<=h)
         check(seed_i-1,seed_j)=2;
      end
      end
     
     while (0~=length(find(check==2)))
         len=length(find(check==2));
         [x,y]=find(check==2);
          while len>0            
                    
              %����ǿ��õ�
               if data2(x(len),y(len))<=h   
                    %���ñ�־λ
                    check(x(len),y(len))=1; 
                    
                   %������������������ 
                   if y(len)+1<=col
                   if data2(x(len),y(len)+1)<=h && check(x(len),y(len)+1)~=1
                     check(x(len),y(len)+1)=2;
                   end
                   end
                   
                   if y(len)-1>0
                   if data2(x(len),y(len)-1)<=h && check(x(len),y(len)-1)~=1
                     check(x(len),y(len)-1)=2;
                   end
                   end
                   
                   if x(len)+1<=row
                   if data2(x(len)+1,y(len))<=h && check(x(len)+1,y(len))~=1
                     check(x(len)+1,y(len))=2;
                   end
                   end
                   
                   if x(len)-1>0
                   if data2(x(len)-1,y(len))<=h && check(x(len)-1,y(len))~=1
                     check(x(len)-1,y(len))=2;
                   end
                   end    
                   
               end %end if
               len=len-1;
               
          end% while ���е���� len >0          
     end%second while ��ͨ����
            %�����Ƿ񳬹��ݻ�   
            [check_x,check_y]=size(check);
            pp=0;
            s=0;
            for i=1:check_x
                for j=1:check_y
                    if check(i,j)~=0   
                        if h<data2(i,j)
                         %disp('pp miner error!');
                        else
                        pp=pp+(h-data2(i,j))*step*step*scale ;
                        s=s+step*step*scale ;
                        end
                    end
                end
            end
             
            if pp>=v  
               H=[H; h];
               S=[S; s];               
               Vcheck=[Vcheck;reshape(check,[1,check_x*check_y])];               
               t=t+1;
               disp(['find one! h=',num2str(h),' s=',num2str(s),' pp=',num2str(pp),' v=',num2str(v),' t=',num2str(t)]);              
               break;             
            else
            %disp(['not find yet! h=',num2str(h),' s=',num2str(s),' pp=',num2str(pp),' v=',num2str(v),' t=',num2str(t)]); 
            end
           
    end%for �߶ȱ��� pp=0     
   
end%first while�������������������ݻ� 


