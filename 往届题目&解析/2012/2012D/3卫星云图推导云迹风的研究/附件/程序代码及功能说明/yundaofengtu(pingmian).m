diqiu=zeros(1801,1801);
diqiu=touyingbb;
diqiu=diqiu/983;
imshow(diqiu);
hold on

for i=1:81
    for j=1:81
        if V(i,j)~=0
            wi=20*(4+i)+1;%��γ�������к�
            wj=20*(j+5)+1;%��γ�������к�
            draw_f(wj,1801-wi,V(i,j),J(i,j),yq(i,j));
        end
    end
end