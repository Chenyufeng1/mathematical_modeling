function res = vrm_cal( method, n_pos, h, n_itv, t1, r_in  )  %
%����  �������ݣ���� vr �� mdotm, h Ϊ��ֲ���
% n - ����ѡȡ �� 1-��֣� 2-��ϣ�3
 
n_dif = 1 : n_itv : n_pos;
num = size(n_dif,2);

t0  = t1( n_dif);
rs0 = r_in(n_dif,:);%λ��



if method == 1 %���������
    
    t_dif = t0(2:num-1);%���ʱ��
    r_dif = rs0(2:num-1,:);% λ��ʸ�� r
    
    dr = rs0(3 : num,:) -  rs0(1 : num-2,:); % λ��
    v_dif = dr/h /2;%�ٶ�
    a_dif  = (rs0(3: num,:) - 2* rs0(2: num-1,:) + rs0(1: num-2,:)) / h/h ; %��ּ��ٶ�
    
    % function resl = slove_vrm(r, v, a0 )
    % % ��֪ r �� v, �󷽳̵� ��   vr ��mdotm
    para  = slove_vrm(r_dif, v_dif, a_dif , t_dif);
    res.r = r_dif;
    res.v = v_dif;
    res.a = a_dif;
    
else if method == 2
        
        t_pl = (t0 - t0(1))';
        
        r0_x = rs0(:,1);
        r0_y = rs0(:,2);
        r0_z = rs0(:,3);
        
%         %����������� y = (ax+b)e^(-kx);
%         
%         coe0 = [1 1 1];
% %         Str.coe0 = coe0;
%         
%         % x�������
%         Str.cy = r0_x;
%         Str.cx = t_pl;
%         save str.mat Str;
%         [coex,  ssqx, cntx] =  LMFsolve('coe_fun', coe0);
%         
%         cax = coex(1);
%         cbx = coex(2);
%         ckx = coex(3);
%       
%         rx = (cax*t_pl+cbx).*exp(-ckx*t_pl);
%         
%    % y�������
%         Str.cy = r0_y;
%         Str.cx = t_pl;
%         save str.mat Str;
%         [coey,  ssqy, cnty] =  LMFsolve('coe_fun',coe0);
%         
%         cay = coey(1);
%         cby = coey(2);
%         cky = coey(3);
%         
%         ry = (cay*t_pl+cby).*exp(-cky*t_pl);
%         
%           % z�������
%         Str.cy = r0_z;
%         Str.cx = t_pl;
%         save str.mat Str;
%          [coez,  ssqz, cntz] =  LMFsolve('coe_fun', coe0);
%         
%         caz = coez(1);
%         cbz = coez(2);
%         ckz = coez(3);
%         
%         rz = (caz*t_pl+cbz).*exp(-ckz*t_pl);
%         
%         vx = (cax-cax*ckx*t_pl).*exp(-ckx.t_pl);
%         vy = (cay-cay*cky*t_pl).*exp(-cky.t_pl);
%         vz = (caz-caz*ckz*t_pl).*exp(-ckz.t_pl);
%         
%         ax = (-2*cax.*ckx + cbx.ckx^2+ cax.*ckx^2.*t_pl).*exp(-ckx.t_pl);
%         ay = (-2*cax.*cky + cby.cky^2+ cay.*cky^2.*t_pl).*exp(-cky.t_pl);
%         az = (-2*caz.*ckz + cbz.ckz^2+ caz.*ckz^2.*t_pl).*exp(-ckz.t_pl);
        
        
        %*****************************************************
      
        % % 3 �����
        [ply_rx,S_rx]  = polyfit(t_pl, r0_x, 3);
        [ply_ry,S_ry]  = polyfit(t_pl, r0_y, 3);
        [ply_rz,S_rz]  = polyfit(t_pl, r0_z, 3);
        
        % ��Ϻ�� ���� - λ��ʸ��
        rx = ply_rx(1).*t_pl.^3 + ply_rx(2).*t_pl.^2 + ply_rx(3).*t_pl + ply_rx(4);
        ry = ply_ry(1).*t_pl.^3 + ply_ry(2).*t_pl.^2 + ply_ry(3).*t_pl + ply_ry(4);
        rz = ply_rz(1).*t_pl.^3 + ply_rz(2).*t_pl.^2 + ply_rz(3).*t_pl + ply_rz(4);
        
        
        vx = 3.*ply_rx(1).*t_pl.^2 + 2.*ply_rx(2).*t_pl  + ply_rx(3) ;
        vy = 3.*ply_ry(1).*t_pl.^2 + 2.*ply_ry(2).*t_pl  + ply_ry(3) ;
        vz = 3.*ply_rz(1).*t_pl.^2 + 2.*ply_rz(2).*t_pl  + ply_rz(3) ;
        
        ax = 6.*ply_rx(1).*t_pl + 2.*ply_rx(2) ;
        ay = 6.*ply_ry(1).*t_pl + 2.*ply_ry(2)  ;
        az = 6.*ply_rz(1).*t_pl + 2.*ply_rz(2) ;
        
        r = [rx ry rz];
        v = [vx vy vz];
        a = [ax ay az];
        
        %  function resl = slove_vrm(r, v, a0 )
        %     % ��֪ r �� v, �󷽳̵� ��   vr ��mdotm
        para  = slove_vrm(r, v, a, t_pl');
        res.r =r;
        res.v =v;
        res.a =a;
    end
end

res.para = para;


end