# 牛顿法求非线性方程的解

	f =

	t*t+2*t+1

	输入初值x0>>2
	警告: Support of strings that are not valid variable names or define a number
	will be removed in a future release. To create symbolic expressions, first
	create symbolic variables and then use operations on them. 
	> In sym>convertExpression (line 1536)
	  In sym>convertChar (line 1441)
	  In sym>tomupad (line 1198)
	  In sym (line 177)
	  In subs (line 68)
	  In Newton (line 16) 
	错误使用 evalin
	未定义函数或变量 't'。

	出错 sym/eval (line 11)
	s = evalin('caller',vectorize(map2mat(char(x))));

	出错 Newton (line 16)
	R = eval(subs(f, 'x0', 'x'));

	  subs(s,old,new) returns a copy of s, replacing all occurrences of old with new, and then evaluates s.
  
  报错说t未定义，在语句`R = eval(subs(f, 'x0', 'x'));`处出错，到MATLAB文档查一下`subs`是干嘛的：

	subs(s,old,new) returns a copy of s, replacing all occurrences of old with new, and then evaluates s.

这个函数的作用是把字符串s中所有`old`的出现换为`new`的出现。我想这条语句应该是想把`x`的出现换为`x0`，这段代码确实有问题。

不过在后来的测试中发现这段代码的风格不太好，大致上是说直接计算字符串在后来版本的MATLAB中将被移除，也就是说要想把输入的字符串当做函数去计算，要经过一步转换，定义`syms`符号函数来实现。

最终我修改后的代码如下：

```matlab
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
```
  
下面是一个测试用例：

	>> Newton
	请输入需要求解的函数>>x^2+x-12
	6   f = evalin(symengine, f_string)
	 
	f =
	 
	x^2 + x - 12
	 
	输入初值x0>>2
	 
	R =
	 
	-6
	 
	22  while(abs(R)>1e-8)
	 
	x =
	 
	22/5
	 
	 
	R =
	 
	294/25
	 
	 
	x =
	 
	...
	...
	 
	原始方程为 x^2+x-12
	迭代次数为 4
	最终解为 3
