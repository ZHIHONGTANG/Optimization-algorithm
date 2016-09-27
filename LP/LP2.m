% �������������Թ滮��Linear programming�����Ͷ������
%
% ʵ��2��Ͷ������
% 
% ĳ��˾��һ���ʽ�����4��������Ŀ��Ͷ�ʣ���Ͷ�ʸ���Ŀʱ���õľ�����(Ͷ���ʽ����ٷֱ�)���±�
% 
% ������Ŀ�����
% ������Ŀ              ����(%)
%    A                   15
%    B                   10
%    C                    8
%    D                   12
% 
% ����ĳ��ԭ�򣬾���������ĿA��Ͷ�ʲ�������������Ͷ��֮�Ͷ�������ĿB��C��Ͷ��Ҫ������ĿD��Ͷ�ʡ���ȷ��ȫ�ĸù�˾��������Ͷ�ʷ��䷽����
% 
% ������ѧģ�ͣ�
% ��x1�� x2 ��x3 ��x4�ֱ����������ĿA��B��C��D��Ͷ�ʰٷ�����
% max f=0.15x1+0.1x2+0.08x3+0.12x4
% s.t x1-x2-x3-x4��0
% x2+x3-x4��0
% x1+x2+x3+x4=1
% xj��0 j=1,2,3,4
% 
% ����ת��Ϊ��׼��ʽ��
% min z=-0.15x1-0.1x2-0.08x3-0.12x4
% s.t x1-x2-x3-x4��0
%    -x2-x3+x4��0
%     x1+x2+x3+x4=1
%     xj��0 j=1,2,3,4
%
% ��Ӧ����MATLAB����
clc;
clear all;

f=[-0.15;-0.1;-0.08;-0.12];
A=[1 -1 -1 -1;0 -1 -1 1];
b=[0;0];
Aeq=[1 1 1 1];
beq=[1];
lb=zeros(4,1);
ub=[];

[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,lb,ub)
maxf=-fval

% ������������
% Optimization terminated.
% x =
%     0.5000
%     0.2500
%     0.0000
%     0.2500
% fval =
%    -0.1300
% exitflag =
%      1
% maxf =
%     0.1300
% 
% �����������
% ��4����Ŀ��Ͷ�ʰٷ����ֱ�Ϊ50%��25%��0, 25%ʱ��ʹ�ù�˾����������棬���������ɵ���13%����������������


% һ��MATLAB��������Թ滮�����һ��˼·
% ��������MATLAB������Ż�����ʱ��������maxf �����⻯Ϊ��min(-f )������Լ��g i (x)��0����Ϊ �Cg i��0������
% ����ʵ��ȥ��ʵ�ʱ����������滮���⣺Ŀ�꺯����Լ���������Ǳ���x�����Ժ�����
% 
% ���磺 (1) min f T X
% s.t A X��b
% Aeq X =beq
% lb��X��ub
% 
% ����XΪnάδ֪������f T=[f1,f2,��fn]ΪĿ�꺯��ϵ��������С�ڵ���Լ��ϵ������AΪm��n����bΪ���Ҷ�mά��������
% AeqΪ��ʽԼ��ϵ������beqΪ��ʽԼ���Ҷ˳�����������lb,ubΪ�Ա���ȡֵ�Ͻ����½�Լ����nά����������
% 
% ����MATLAB��������Թ滮�������Ž�ĺ���
% ���ø�ʽ�� x=linprog(f,A,b)
% 
% x=linprog(f,A,b,Aeq,beq)
% x=linprog(f,A,b,Aeq,beq,lb,ub)
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0)
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0,options)
% 
% [x,fval]=linprog(��) 
% [x, fval, exitflag]=linprog(��) 
% [x, fval, exitflag, output]=linprog(��)
% [x, fval, exitflag, output, lambda]=linprog(��)
% 
% ˵����x=linprog(f,A,b)����ֵxΪ���Ž�������
% x=linprog(f,A,b,Aeq,beq) ���е�ʽԼ�������⡣��û�в���ʽԼ��������A=[ ]��b=[ ] ��
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0,options) ��lb ,ubΪ����x���½���Ͻ磬x0Ϊ��ֵ�㣬optionsΪָ���Ż�����������С����
% Options�Ĳ���������
% Display ��ʾˮƽ�� ѡ��off�� ����ʾ�����ѡ��iter����ʾÿһ ���������̵������ѡ��final�� ��ʾ���ս����
% MaxFunEvals �������۵�����������
% Maxiter ��������������
% TolX x������ֹ���� 
% 
% [x,fval]=linprog(��) ��� fval ���ؽ�x����Ŀ�꺯��ֵ��
% [x,fval,exitflag,output,lambda]=linprog(f,A,b, Aeq,beq,lb,ub,x0) ��������֣� 
% exitflag ��������������˳���������Ϊ��ֵ����ʾĿ�꺯�������ڽ�x������Ϊ��ֵ����ʾĿ�꺯������������Ϊ��ֵ����ʾ�Ѿ��ﵽ�������ۻ��������������
% output �����Ż���Ϣ��output.iterations��ʾ����������output.algorithm��ʾ�����õ��㷨��outprt.funcCount��ʾ�������۴�����
% lambda ����x�����������ճ��ӡ������������ԣ�
% lambda.lower-lambda���½磻
% lambda.upper-lambda���Ͻ磻
% lambda.ineqlin-lambda�����Բ���ʽ��
% lambda.eqlin-lambda�����Ե�ʽ��
