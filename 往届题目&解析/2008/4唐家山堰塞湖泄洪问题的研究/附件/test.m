%��ˮģ��

left_map_x             = 443340
lower_map_y            = 3480030
right_map_x            = 476820
upper_map_y            = 3527460
number_of_rows         = 528
number_of_columns      = 373

step=1;
x=1:number_of_columns ;
y=1:number_of_rows;
[x1,y1]=meshgrid(x,y);
x2=1:step:number_of_columns ;
y2=1:step:number_of_rows;
[x3,y3]=meshgrid(x2,y2);
t11=interp2(x1,y1,data,x3,y3,'cubic');
data2=t11;
[row,col]=size(data2);

%�������
scale=abs(left_map_x -right_map_x )*abs(lower_map_y- upper_map_y)/(number_of_rows*number_of_columns);
%���ȷ���
%scale2=sqrt(scale);

%���ӱ���
a=1/3;
%������ϲ���
%load('nihe.mat');
v=0;
h0=670;
t=1;%����Ϊ��λ

T=[];
H=[]; 
S=[];
Vcheck=[];

final=0;

t=197;
while v<2.2*10^8*a && final~=1
    %�������3������
    %v=polyval(y_lei,t/60,s_lei);  
    v=0.01715*(t*60)^2+135.03*(t*60);%-7.8753*10^6;
    
    for h=h0:0.1:900
     
     check=zeros(row,col);
     %ȷ������
     seed_i=482;
     seed_j=34;%*(1/step)-1; 
     
     if(data2(seed_i,seed_j)>h)
        % disp(['error!','seed_h=',num2str(data2(seed_i,seed_j)),' h=',num2str(h)]);
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
                        %if h<data2(i,j)
                         %disp('pp miner error!');
                        %else
                        pp=pp+abs(h-data2(i,j))*step*step*scale ;
                        s=s+step*step*scale ;
                        %end
                    end
                end
            end
             
            if pp>=v  
                
                            
                
               %����΢Ԫֵ 
              % point=length(S);
              % if point==0 || S(point)~=S
               H=[H; h];
               S=[S; s];               
               Vcheck=[Vcheck;reshape(check,[1,check_x*check_y])]; 
               T=[T;t]; 
               disp(['find one! h=',num2str(h),' s=',num2str(s),' pp=',num2str(pp),' v=',num2str(v),' t=',num2str(t)]);  
              
               while pp>=v
                    t=t+1;
                    v=0.01715*(t*60)^2+135.03*(t*60);                   
               end
              
               
               if pp>=2.2*10^8*a
                   final=1;
                   disp('end!');
               end
               
               break;             
            else
           % disp(['not find yet! h=',num2str(h),' s=',num2str(s),' pp=',num2str(pp),' v=',num2str(v),' t=',num2str(t)]); 
            end
           
    end%for �߶ȱ��� pp=0     
   
end%first while�������������������ݻ� 


