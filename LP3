% 本程序利用线性规划（Linear programming）解决运输问题
%
% 实例3：运输问题
% 
% 有A、B、C三个食品加工厂，负责供给甲、乙、丙、丁四个市场。三个厂每天生产食品箱数上限如下表：
% 工厂                  生产数
%  A                     60
%  B                     40
%  C                     50
% 四个市场每天的需求量如下表：
% 市场                  需求量
%  甲                    20  
%  乙                    35 
%  丙                    33
%  丁                    34
% 从各厂运到各市场的运输费(元/每箱)由下表给出：
%        市场  甲     乙     丙     丁
% 工厂
%  A           2      1      3      2
%  B           1      3      2      1
%  C           3      4      1      1
% 
% 求在基本满足供需平衡的约束条件下使总运输费用最小。
% 
% 建立数学模型：
% 设fee(ij)为由工厂i运到市场j的费用，x(ij)为由工厂i运到市场j的箱数。
% 设b(i)是工厂i的产量，beq(j)是市场j的需求量。
% min f=∑fee(ij)*x(ij)
% s.t x(i1)+x(i2)+x(i3)+x(i4)≤b(i)
%     x(1j)+x(2j)+x(3j)=beq(j)
%     x(ij)≥0 i=1,2,3 j=1,2,3,4
% 
% 将其转换为标准形式：
% min z=2x1+x2+3x3+x4+3x5+4x6+3x7+2x8+1x9+2x10+x11+x12
% s.t x1+x4+x7+x10≤60
%     x2+x5+x8+x11≤40
%     x3+x6+x9+x12≤50
%     x1+x2+x3=20
%     x4+x5+x6=35
%     x7+x8+x9=33
%     x10+x11+x12=34
%     xi≥0 i=1,2,3,...,12
% 对应求解的MATLAB程序：
clc;
clear all;

fee = [2 1 3 2;1 3 2 1;3 4 1 1];
f=fee(:);
A=[1 0 0 1 0 0 1 0 0 1 0 0;0 1 0 0 1 0 0 1 0 0 1 0;0 0 1 0 0 1 0 0 1 0 0 1];
b=[60;40;50];
Aeq=[1 1 1 0 0 0 0 0 0 0 0 0;0 0 0 1 1 1 0 0 0 0 0 0;0 0 0 0 0 0 1 1 1 0 0 0;0 0 0 0 0 0 0 0 0 1 1 1];
beq=[20;35;33;34];
lb=zeros(12,1);
ub=[];

[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,lb,ub)


% 程序输出结果：
% Optimization terminated.
% x =
%     0.0000
%    20.0000
%     0.0000
%    35.0000
%     0.0000
%     0.0000
%     0.0000
%     0.0000
%    33.0000
%     0.0000
%    18.4682
%    15.5318
% fval =
%   122.0000
% exitflag =
%      1
% 
% 输出结果解读：
% 运输方案为：甲市场的货由B厂送20箱；乙市场的货由A厂送35箱；丙商场的货由C厂送33箱；丁市场的货由B厂送18箱，再由C厂送16箱。
% 最低总运费为：122元。


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
