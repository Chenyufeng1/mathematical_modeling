load all_data_original.mat              %501*4 
%��������                               %556*12
all_data_original_diff_sum=zeros(12*556,4);
all_data_original_diff=abs(all_data_original(:,2:2004)-all_data_original(:,1:2003));
for i=1:4
    all_data_original_diff_sum(:,1)'=sum(all_data_original(:,(i-1)*501+1:(i-1)*501+500));
end
% ������Բ�ֺ͵���Ӧ���ļ���
save all_data_original_diff_sum.mat all_data_original_diff_sum
