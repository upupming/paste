clear
% �÷��ź����ȽϺ�
syms x;
f_string = input('��������Ҫ���ĺ���>>', 's');
% ���ַ���ת��Ϊsym���ź���
f = evalin(symengine, f_string)

% ��
df = diff(f)
% �Ľ��������ظ���
miu = input('�������ظ���>>');
% ��ʼֵx0
x0 = input('�����ֵx0>>');
% ��������������
k = 0;
% ����������
max = 100;
% ���R = f(x0),��ȷ����ֵx0ʱ�Ƿ�ͽ�
x = x0
R = subs(f)

while(abs(R)>1e-8)
%%%%%%%%%%%%%%%%%%%
    % k > max����Ϊ���������������������ֵ
    if k > max;
        ss = input('��ֵ������������Ƿ���������(y/n)>>', 's');
        if strcmp(ss, 'y')
            x0 = input('�����µĳ�ֵx0>>', 's');
            k = 0;
        else
        	return % �˳�����
        end
    end
%%%%%%%%%%%%%%%%%%
    x = x0 - miu*R/subs(df)
    % ����x0
    x0 = x;
    % ���º���ֵ
    R = subs(f)
    k = k+1;
    if(abs(R)<1e-10);
        break
    end
    
end
% ԭʼ����
fprintf('ԭʼ����Ϊ %s\n', f_string);
% ������������
fprintf('��������Ϊ %d\n', k);
% ������
fprintf('���ս�Ϊ %d\n', x0);