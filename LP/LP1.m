% 本程序利用线性规划（Linear programming）解决生产计划问题
%
% 实例1：生产计划问题
% 
% 假设某厂计划生产甲、乙两种产品，现库存主要材料有A类3600公斤，B类2000公斤，C类3000公斤。
% 每件甲产品需用材料A类9公斤，B类4公斤，C类3公斤。每件乙产品，需用材料A类4公斤，B类5公斤，C类10公斤。
% 甲单位产品的利润70元，乙单位产品的利润120元。问如何安排生产，才能使该厂所获的利润最大。
% 
% 建立数学模型：
% 设x1、x2分别为生产甲、乙产品的件数。f为该厂所获总润。
% max f=70x1+120x2
% s.t 9x1+4x2≤3600
% 4x1+5x2≤2000 
% 3x1+10x2≤3000
% x1,x2≥0
% 
% 将其转换为标准形式：
% min f=-70x1-120x2
% s.t 9x1+4x2≤3600
%     4x1+5x2≤2000 
%     3x1+10x2≤3000
%     x1,x2≥0
%
% 对应求解的MATLAB程序：
clc;
clear all;

f=[-70 -120];
A=[9 4 ;4 5;3 10];
b=[3600;2000;3000];
lb=[0 0];
ub=[];

[x,fval,exitflag]=linprog(f,A,b,[],[],lb,ub)
maxf=-fval

% 程序输出结果：
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
% 输出结果解读：
% 当该厂生产甲产品200件，乙产品240件时，产品利润有最大值，最大利润为42800元。


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
