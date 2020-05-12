RootPath = 'E:\Modeling\Data\B_Data_4';
DiffGuns = ['77-1202999',
            '77-1203959',
            '77-1504519',
            '77-1811345',
            '77-1812492',
            '77-1814117',
            '77-1814688',
            '77-1923252',
            '77-1930832',
            '77-1931817',
            '77-1932803'];
DiffBullet = ['T1',
              'T2'];
DiffCurves = ['c1.dat',
              'c2.dat',
              'c3.dat',
              'c4.dat'];
DiffLines = ['c_line1.dat',
              'c_line2.dat',
              'c_line3.dat',
              'c_line4.dat'];
DiffCuts = ['c1_mid.dat'
            'c2_mid.dat'
            'c3_mid.dat'
            'c4_mid.dat'];
          
for i=1:size(DiffGuns,1)
    for j=1:size(DiffBullet,1)
        for k = 1:size(DiffCurves,1)
            Curve = load([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffCurves(k,:)]);
            Curve_main(1:756,1:3)=0;
      
            for y_step = 150:606                                    %y��1��756
                y_scale = round((y_step-1)*0.00275*100000)/100000;  %�����y��ʵ�ʴ�С
                Curve_y = find(Curve(:,2) == y_scale);          %�ҳ�ĳһ���̶�Yֵ��Ӧ�����е���±�
                Curve_z = Curve(Curve_y,3);                     %����X-Z������x��1��564
                        
                               
                Diff_Left = (Curve_z(2:563)-Curve_z(1:562));    %���е��ȥ��ǰ���һ����
                Diff_Left = [Diff_Left(1);Diff_Left;Diff_Left(size(Diff_Left,1))];      %����
                
                Diff_Right = (Curve_z(3:564)-Curve_z(2:563));   %���е����һ�����ȥ�����
                Diff_Right = [Diff_Right(1);Diff_Right;Diff_Right(size(Diff_Right,1))];  %����
                
                Peak = find((Diff_Left.*Diff_Right)<=0);        %�����ҵ����˻�С�ڵ����㣬�õ����йյ�
                
                Peak(find(Diff_Right(Peak)==0))=[];             %ȥ�������ҵ���Ϊ������ΪֻҪ�����ҵ���Ϊ�����϶��������ڵ�����Ϊ
                                                                %��������ȡ��
                                                                
                %Peak(find(Diff_Left(Peak-1)==0&Diff_Right(Peak-1)==0))=[];
                Peak(find(Peak>514|Peak<50))=[];                    %x������ʼ����ֹ�ĵ㲻����˵������ֱ��ȥ��
                
                Diff_Peak_Left_1 = Curve_z(Peak)-Curve_z(Peak-1);  %�������еĹյ��ٴμ������ǵ�����	
                Diff_Peak_Left_n = Curve_z(Peak)-Curve_z(Peak-8);  %�������йյ���������������Զ�ĵ������
                Diff_Peak_Right_1 = Curve_z(Peak+1)-Curve_z(Peak); %�������еĹյ��ٴμ������ǵ��ҵ���
                Diff_Peak_Right_n = Curve_z(Peak+8)-Curve_z(Peak); %�������йյ���������������Զ�ĵ���ҵ���                
                
                Peak(find(Diff_Peak_Left_1.*Diff_Peak_Left_n<0 | Diff_Peak_Right_1.*Diff_Peak_Right_n<0 | Diff_Peak_Right_n.*Diff_Peak_Left_n>0))=[];   %ȥ����С�Ĺյ�
                %Peak(find((Curve_z(Peak)-Curve_z(Peak-1)).*(Curve_z(Peak)-Curve_z(Peak-8))<0|(Curve_z(Peak+1)-Curve_z(Peak)).*(Curve_z(Peak+8)-Curve_z(Peak))<0|((Curve_z(Peak+8)-Curve_z(Peak)).*(Curve_z(Peak)-Curve_z(Peak-8))>0)))=[];             
                
                if (size(Peak,1)<1)
                    break;
                end
                
                Peak_i=1;
                while Peak_i<=size(Peak,1)
                    Peak_temp = find((Peak<Peak(Peak_i)+10) & (Peak>Peak(Peak_i)-10));  %�ҳ������ڽ�С��x��Χ�ڵĹյ�
                    Peak_i=Peak_temp(size(Peak_temp,1))+1;                              %ѭ��ֵ�ƶ�
                    [Unuse,Peak_temp_max] = max(abs(Curve_z(Peak(Peak_temp))));                 %����һ����Χ�ڵļ�ֵ
                    Peak(Peak_temp(find(Peak_temp~=Peak_temp(Peak_temp_max))))=0;                  %����յ���Ϊ��
                    %Peak(Peak_temp(find(abs(Curve_z(Peak_temp)) ~= max(abs(Curve_z(Peak_temp))))))=0;
                end
                Peak(find(Peak==0)) = [];                                               %ȥ�����Ϊ��Ĺյ�
                
                if (size(Peak,1)>1)
                    
                    Diff_Peak_z = abs(Curve_z(Peak(2:size(Peak,1)))-Curve_z(Peak(1:size(Peak,1)-1))); %����z�����ϵ����ڵ�֮��Ĳ��
                    Diff_Peak_z_max = max(Diff_Peak_z);                                               %z�����ϲ�ֵ�����ֵ
                    Diff_Peak_z_large = find(abs(Diff_Peak_z) >= 0.10*Diff_Peak_z_max);               %���д������ֵ0.1���ĵ�
                    Peak = Peak(Diff_Peak_z_large(1):Diff_Peak_z_large(size(Diff_Peak_z_large,1))+1); %����Peak
                    Curve_main_mid_x = round((Peak(size(Peak,1))+Peak(1))/2);
                else
                    Curve_main_mid_x = Peak(1);
                end
                    
                Curve_main_x = 0.00275*(Curve_main_mid_x-1);                     %ȡ�м���xֵ
                Curve_main_y = (y_step-1)*0.00275;                                                %y����
                Curve_main_z = Curve_z(Curve_main_mid_x);
                
                if (Curve_main_mid_x<64)
                        Curve_main_mid_x =65;
                end
  
%{
                if(y_step==200)
                    Curve_xz_1_4 = [[Curve_main_mid_x-63-1:Curve_main_mid_x+64-1]'*0.00275,Curve_z(Curve_main_mid_x-63:Curve_main_mid_x+64)];
                    save([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffCuts(k,:) '_1_4.dat'],'Curve_xz_1_4','-ascii');
                end
                if(y_step==400)
                    Curve_xz_1_2 = [[Curve_main_mid_x-63:Curve_main_mid_x+64]'*0.00275,Curve_z(Curve_main_mid_x-63:Curve_main_mid_x+64)];
                    save([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffCuts(k,:) '_1_2.dat'],'Curve_xz_1_2','-ascii');
                end
                if(y_step==600)
                    Curve_xz_3_4 = [[Curve_main_mid_x-63:Curve_main_mid_x+64]'*0.00275,Curve_z(Curve_main_mid_x-63:Curve_main_mid_x+64)];
                    save([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffCuts(k,:) '_3_4.dat'],'Curve_xz_3_4','-ascii');
                end
%}                                
                Curve_main(y_step,:)=[Curve_main_x,Curve_main_y,Curve_main_z];
            end
            
            Curve_main(find((Curve_main(:,1)==0 & Curve_main(:,2)==0 & Curve_main(:,3)==0)),:)=[];
            save([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffLines(k,:)],'Curve_main','-ascii');
           
            mid_y = Curve_main(round(size(Curve_main,1)/2),2);
            y_scale = round(mid_y*100000)/100000;  %�����y��ʵ�ʴ�С
                Curve_y = find(Curve(:,2) == y_scale);          %�ҳ�ĳһ���̶�Yֵ��Ӧ�����е���±�
                Curve_z = Curve(Curve_y,3);                     %����X-Z������x��1��564
                             
                Diff_Left = (Curve_z(2:563)-Curve_z(1:562));    %���е��ȥ��ǰ���һ����
                Diff_Left = [Diff_Left(1);Diff_Left;Diff_Left(size(Diff_Left,1))];      %����
                
                Diff_Right = (Curve_z(3:564)-Curve_z(2:563));   %���е����һ�����ȥ�����
                Diff_Right = [Diff_Right(1);Diff_Right;Diff_Right(size(Diff_Right,1))];  %����
                
                Peak = find((Diff_Left.*Diff_Right)<=0);        %�����ҵ����˻�С�ڵ����㣬�õ����йյ�
                
                Peak(find(Diff_Right(Peak)==0))=[];             %ȥ�������ҵ���Ϊ������ΪֻҪ�����ҵ���Ϊ�����϶��������ڵ�����Ϊ
                                                                %��������ȡ��
                Peak(find(Peak>514|Peak<50))=[];                    %x������ʼ����ֹ�ĵ㲻����˵������ֱ��ȥ��
                
                Diff_Peak_Left_1 = Curve_z(Peak)-Curve_z(Peak-1);  %�������еĹյ��ٴμ������ǵ�����	
                Diff_Peak_Left_n = Curve_z(Peak)-Curve_z(Peak-8);  %�������йյ���������������Զ�ĵ������
                Diff_Peak_Right_1 = Curve_z(Peak+1)-Curve_z(Peak); %�������еĹյ��ٴμ������ǵ��ҵ���
                Diff_Peak_Right_n = Curve_z(Peak+8)-Curve_z(Peak); %�������йյ���������������Զ�ĵ���ҵ���                
                
                Peak(find(Diff_Peak_Left_1.*Diff_Peak_Left_n<0 | Diff_Peak_Right_1.*Diff_Peak_Right_n<0 | Diff_Peak_Right_n.*Diff_Peak_Left_n>0))=[];   %ȥ����С�Ĺյ� 
                
                Peak_i=1;
                while Peak_i<=size(Peak,1)
                    Peak_temp = find((Peak<Peak(Peak_i)+10) & (Peak>Peak(Peak_i)-10));  %�ҳ������ڽ�С��x��Χ�ڵĹյ�
                    Peak_i=Peak_temp(size(Peak_temp,1))+1;                              %ѭ��ֵ�ƶ�
                    [Unuse,Peak_temp_max] = max(abs(Curve_z(Peak(Peak_temp))));                 %����һ����Χ�ڵļ�ֵ
                    Peak(Peak_temp(find(Peak_temp~=Peak_temp(Peak_temp_max))))=0;                  %����յ���Ϊ��
                    %Peak(Peak_temp(find(abs(Curve_z(Peak_temp)) ~= max(abs(Curve_z(Peak_temp))))))=0;
                end
                Peak(find(Peak==0)) = [];                                               %ȥ�����Ϊ��Ĺյ�
                
                if (size(Peak,1)>1)
                    
                    Diff_Peak_z = abs(Curve_z(Peak(2:size(Peak,1)))-Curve_z(Peak(1:size(Peak,1)-1))); %����z�����ϵ����ڵ�֮��Ĳ��
                    Diff_Peak_z_max = max(Diff_Peak_z);                                               %z�����ϲ�ֵ�����ֵ
                    Diff_Peak_z_large = find(abs(Diff_Peak_z) >= 0.10*Diff_Peak_z_max);               %���д������ֵ0.1���ĵ�
                    Peak = Peak(Diff_Peak_z_large(1):Diff_Peak_z_large(size(Diff_Peak_z_large,1))+1); %����Peak
                    Curve_main_mid_x = round((Peak(size(Peak,1))+Peak(1))/2);
                else
                    Curve_main_mid_x = Peak(1);
                end
                    
                Curve_main_x = 0.00275*(Curve_main_mid_x-1);                     %ȡ�м���xֵ
                Curve_main_y = (y_step-1)*0.00275;                                                %y����
                Curve_main_z = Curve_z(Curve_main_mid_x);
                
                if (Curve_main_mid_x<64)
                        Curve_main_mid_x =65;
                end
                Curve_mid = [[Curve_main_mid_x-63-1:Curve_main_mid_x+64-1]'*0.00275,Curve_z(Curve_main_mid_x-63:Curve_main_mid_x+64)];
                save([RootPath '\' DiffGuns(i,:) '\' DiffGuns(i,1:2) DiffBullet(j,:) DiffGuns(i,3:length(DiffGuns(i,:))) '\' DiffCuts(k,:)],'Curve_mid','-ascii');
            
            clear Curve_main
        end
    end
end
    
        
    
    
    
    
       


