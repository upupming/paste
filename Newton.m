clear
% 用符号函数比较好
syms x;
f_string = input('请输入需要求解的函数>>', 's');
% 将字符串转换为sym符号函数
f = evalin(symengine, f_string)

% 求导
df = diff(f)
% 改进常数或重根数
miu = input('请输入重根数>>');
% 初始值x0
x0 = input('输入初值x0>>');
% 迭代次数计数器
k = 0;
% 最大迭代次数
max = 100;
% 求解R = f(x0),以确定初值x0时是否就解
x = x0
R = subs(f)

while(abs(R)>1e-8)
%%%%%%%%%%%%%%%%%%%
    % k > max，认为迭代不收敛，重新输入初值
    if k > max;
        ss = input('初值输入可能有误，是否重新输入(y/n)>>', 's');
        if strcmp(ss, 'y')
            x0 = input('输入新的初值x0>>', 's');
            k = 0;
        else
        	return % 退出程序
        end
    end
%%%%%%%%%%%%%%%%%%
    x = x0 - miu*R/subs(df)
    % 更新x0
    x0 = x;
    % 更新函数值
    R = subs(f)
    k = k+1;
    if(abs(R)<1e-10);
        break
    end
    
end
% 原始方程
fprintf('原始方程为 %s\n', f_string);
% 给出迭代次数
fprintf('迭代次数为 %d\n', k);
% 给出解
fprintf('最终解为 %d\n', x0);