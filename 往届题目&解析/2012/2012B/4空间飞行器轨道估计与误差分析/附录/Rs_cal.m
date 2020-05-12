function rs = Rs_cal(  n_pos, pos6, pos9, ab1_6, ab1_9 )
 
%ͨ�����㽻��˼·������������� ����ϵ�µ� λ��

 
%�������� λ��ʸ�����ֱ��� 6,9 ϵ�۲�����ϵ
r_in = zeros(n_pos, 3);
 
for i = 1: 1 : n_pos
    %�� �� i ��λ�õ� �� �۲�����ϵ-��׼����ϵ��ת������, ���� ��ת�� ƽ��
    
    % ���ǵ�λ��ʸ��
    r6_vec = pos6(i,:);
    r9_vec = pos9(i,:);
    
    R6 = Rcal(r6_vec);
    R9 = Rcal(r9_vec);
 
    ab6  = ab1_6(i,:);
    ab9  = ab1_9(i,:);
    
    % ��׼����ϵ  �µ�������ȣ�
    R6_inv = inv(R6);
    R9_inv = inv(R9);
     
    A1 =  R6_inv(2:3,:) -   ab6'* R6_inv(1,:);
    A2 =  R9_inv(2:3,:) -   ab9'* R9_inv(1,:);
    
    A = [A1;A2]; 
    
    b1 = R6_inv(2:3,:)*r6_vec' -   ab6'* R6_inv(1,:)*r6_vec';
    b2 = R9_inv(2:3,:)*r9_vec' -   ab9'* R9_inv(1,:)*r9_vec';
    b = [b1;b2];
 
    %����С���˷������
    A_new = A'*A;   
    b_new = A'*b;
    r_in(i,:) = (A_new\b_new)';
end

rs = r_in;
end