#include<stdlib.h>
#include"time.h"
class HpRandom{
public:
	static void init();
	//����һ��U(a,b)�ֲ��������
	static double getNextUniformly(double a=0,double b=1);
	//����һ��������̬�ֲ�
	static double getNextNormal(double u=0,double delta=1);
	//����һ������lumta�Ĳ��ɷֲ�
	static int getNextPossion(double lumta);
	//����һ������ָ���ֲ�f=1/beta*exp(-x/beta),x>=0�ķֲ�
	static double getNextExponent(double beta);
};