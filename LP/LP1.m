% �������������Թ滮��Linear programming����������ƻ�����
%
% ʵ��1�������ƻ�����
% 
% ����ĳ���ƻ������ס������ֲ�Ʒ���ֿ����Ҫ������A��3600���B��2000���C��3000���
% ÿ���ײ�Ʒ���ò���A��9���B��4���C��3���ÿ���Ҳ�Ʒ�����ò���A��4���B��5���C��10���
% �׵�λ��Ʒ������70Ԫ���ҵ�λ��Ʒ������120Ԫ������ΰ�������������ʹ�ó�������������
% 
% ������ѧģ�ͣ�
% ��x1��x2�ֱ�Ϊ�����ס��Ҳ�Ʒ�ļ�����fΪ�ó���������
% max f=70x1+120x2
% s.t 9x1+4x2��3600
% 4x1+5x2��2000 
% 3x1+10x2��3000
% x1,x2��0
% 
% ����ת��Ϊ��׼��ʽ��
% min f=-70x1-120x2
% s.t 9x1+4x2��3600
%     4x1+5x2��2000 
%     3x1+10x2��3000
%     x1,x2��0
%
% ��Ӧ����MATLAB����
clc;
clear all;

f=[-70 -120];
A=[9 4 ;4 5;3 10];
b=[3600;2000;3000];
lb=[0 0];
ub=[];

[x,fval,exitflag]=linprog(f,A,b,[],[],lb,ub)
maxf=-fval

% ������������
% Optimization terminated.
% x = 
%   200.0000
%   240.0000 
% fval =
%   -4.2800e+04
% exitflag =
%      1
% maxf =
%    4.2800e+04
% 
% �����������
% ���ó������ײ�Ʒ200�����Ҳ�Ʒ240��ʱ����Ʒ���������ֵ���������Ϊ42800Ԫ��


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
