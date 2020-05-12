function out = compareCurve( Z_posed1 , Z_posed2 )

%��������Ƚ���cutSelectedData()�õ������� ��СΪ[1,300]

%Z_posed1 �� Z_posed2 Ϊ���� [1,300]������

%outΪ�������������ߵľ����������ֵ����Ϊ�ж������������Ƴ̶ȵ�ָ��


         [a IndexM1]=max(Z_posed1);
         [a,IndexM2]=max(Z_posed2);
        
         sum = ( 100*(Z_posed1(IndexM1)-Z_posed2(IndexM2)) )^2;
         delt(1) = 100*abs( Z_posed1(IndexM1)-Z_posed2(IndexM2) );
         
         up1=IndexM1+1;
         down1=IndexM1-1;
         up2=IndexM2+1;
         down2=IndexM2-1;
         
         i=1;
         
         while 1
             
             if ( up1>200|| down1<=1 || up2>200 || down2<=1 )
                 break;
             end
             
             sum = sum + ( 100*(Z_posed1(up1) - Z_posed2(up2)) )^2 + ( 100*(Z_posed1(down1) - Z_posed2(down2)) )^2;
             
             up1=up1+1;
             up2=up2+1;
             
             down1=down1-1;
             down2=down2-1;
             
             i=i+1;
             delt(i) =100*abs( Z_posed1(up1) - Z_posed2(up2));
             i=i+1;
             delt(i) =100*abs(Z_posed1(down1) - Z_posed2(down2));
         end
       
             sort(delt);
             
         out = [ 10*( (abs( sum/(300-2*abs(IndexM1-IndexM2)))) )^0.5 , delt(1) ];
         
         
