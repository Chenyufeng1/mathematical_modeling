%���� �� n �������� t ʱ�̵�λ�ã� t ������ ʸ��
function pv = state(n, tspan, hmax,satinfo, a2,a3)

global Gm;
x0 = satinfo(n+1,:);

options =  odeset('AbsTol',1e-18,'RelTol',1e-8,'MaxStep',hmax);%'OutputFcn','odephas3',
[t_local,y] = ode45('myode',tspan, x0,options, Gm, a2,a3);

pv = y;


end
