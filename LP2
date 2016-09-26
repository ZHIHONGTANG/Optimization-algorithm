% 本程序利用线性规划（Linear programming）解决投资问题
%
% 实例2：投资问题
% 
% 某公司有一批资金用于4个工程项目的投资，其投资各项目时所得的净收益(投入资金锪百分比)如下表：
% 
% 工程项目收益表
% 工程项目              收益(%)
%    A                   15
%    B                   10
%    C                    8
%    D                   12
% 
% 由于某种原因，决定用于项目A的投资不大于其他各项投资之和而用于项目B和C的投资要大于项目D的投资。试确定全文该公司收益最大的投资分配方案。
% 
% 建立数学模型：
% 设x1、 x2 、x3 、x4分别代表用于项目A、B、C、D的投资百分数。
% max f=0.15x1+0.1x2+0.08x3+0.12x4
% s.t x1-x2-x3-x4≤0
% x2+x3-x4≥0
% x1+x2+x3+x4=1
% xj≥0 j=1,2,3,4
% 
% 将其转换为标准形式：
% min z=-0.15x1-0.1x2-0.08x3-0.12x4
% s.t x1-x2-x3-x4≤0
%    -x2-x3+x4≤0
%     x1+x2+x3+x4=1
%     xj≥0 j=1,2,3,4
%
% 对应求解的MATLAB程序：
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

% 程序输出结果：
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
% 输出结果解读：
% 当4个项目的投资百分数分别为50%，25%，0, 25%时可使该公司获得最大的收益，其最大收益可到达13%。过程正常收敛。


% 一、MATLAB中求解线性规划问题的一般思路
% 当我们用MATLAB软件作优化问题时，所有求maxf 的问题化为求min(-f )来作。约束g i (x)≥0，化为 –g i≤0来作。
% 上述实例去掉实际背景，归结出规划问题：目标函数和约束条件都是变量x的线性函数。
% 
% 形如： (1) min f T X
% s.t A X≤b
% Aeq X =beq
% lb≤X≤ub
% 
% 其中X为n维未知向量，f T=[f1,f2,…fn]为目标函数系数向量，小于等于约束系数矩阵A为m×n矩阵，b为其右端m维列向量，
% Aeq为等式约束系数矩阵，beq为等式约束右端常数列向量。lb,ub为自变量取值上界与下界约束的n维常数向量。
% 
% 二、MATLAB中求解线性规划问题最优解的函数
% 调用格式： x=linprog(f,A,b)
% 
% x=linprog(f,A,b,Aeq,beq)
% x=linprog(f,A,b,Aeq,beq,lb,ub)
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0)
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0,options)
% 
% [x,fval]=linprog(…) 
% [x, fval, exitflag]=linprog(…) 
% [x, fval, exitflag, output]=linprog(…)
% [x, fval, exitflag, output, lambda]=linprog(…)
% 
% 说明：x=linprog(f,A,b)返回值x为最优解向量。
% x=linprog(f,A,b,Aeq,beq) 作有等式约束的问题。若没有不等式约束，则令A=[ ]、b=[ ] 。
% x=linprog(f,A,b,Aeq,beq,lb,ub,x0,options) 中lb ,ub为变量x的下界和上界，x0为初值点，options为指定优化参数进行最小化。
% Options的参数描述：
% Display 显示水平。 选择’off’ 不显示输出；选择’iter’显示每一 步迭代过程的输出；选择’final’ 显示最终结果。
% MaxFunEvals 函数评价的最大允许次数
% Maxiter 最大允许迭代次数
% TolX x处的终止容限 
% 
% [x,fval]=linprog(…) 左端 fval 返回解x处的目标函数值。
% [x,fval,exitflag,output,lambda]=linprog(f,A,b, Aeq,beq,lb,ub,x0) 的输出部分： 
% exitflag 描述函数计算的退出条件：若为正值，表示目标函数收敛于解x处；若为负值，表示目标函数不收敛；若为零值，表示已经达到函数评价或迭代的最大次数。
% output 返回优化信息：output.iterations表示迭代次数；output.algorithm表示所采用的算法；outprt.funcCount表示函数评价次数。
% lambda 返回x处的拉格朗日乘子。它有以下属性：
% lambda.lower-lambda的下界；
% lambda.upper-lambda的上界；
% lambda.ineqlin-lambda的线性不等式；
% lambda.eqlin-lambda的线性等式。
