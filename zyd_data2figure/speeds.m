% 定义窗口名，取消显示figure号
figure('Name', '不同扫描速度下熔覆层显微硬度分布曲线', 'NumberTitle', 'off');
% 定义图的标题，横纵轴标题
title('不同扫描速度下熔覆层显微硬度分布曲线');
xlabel('距 界 面 距 离 / mm');
ylabel('显 微 硬 度 / HV0.2');

% 在原图基础上绘图
hold on
% 打开数据光标功能
datacursormode on;

% 1. 20号
x20 = [-125.81, -85.87, -68.83, -39.71, -18.24, 11.68, 41.46, 72.21, 107.75, 137.62];
y20 = [240.44,  259.91, 354.4,  421.14, 381.6,  419.75,417.63,398.68,398.06, 365.02];
 % 绘制实心(FaceColor)红(r)方形点(s)
plot(x20, y20, '-rs', 'MarkerSize', 8, 'LineWidth', 1, 'MarkerFaceColor', 'r');

% 2. 21号
x21 = [-107.22, -75.02, -27.31, 32.47, 106.69, 142.65];
y21 = [298.06,  398.68, 417.63, 381.60,421.14, 354.40];
 % 绘制实心绿圆点
plot(x21, y21, '-go', 'MarkerSize', 8, 'LineWidth', 1, 'MarkerFaceColor', 'g');

% 3. 22号
x22 = [-658.3, -20.74, -6.25, 57.56, 117.79, 159.01];
y22 = [389.37, 496.73, 508.74,498.56,490.41, 439.10];
% 绘制实心黄钻石点
plot(x22, y22, '-yd', 'MarkerSize', 8, 'LineWidth', 1, 'MarkerFaceColor', 'y');

% 4. 23号
x23 = [-61.51, 30.70, 37.10, 75.50, 123.76];
y23 = [416.58, 417.40,580.58,570.35,412.06];
 % 绘制实心蓝三角点
plot(x23, y23, '-b^', 'MarkerSize', 8, 'LineWidth', 1, 'MarkerFaceColor', 'b');

% 在西北方加入legend
legend('P = 2.9 kw, V = 50 m/min', 'P = 3.2 kw, V = 50 m/min', 'P = 3.8 kw, V = 50 m/min', 'P = 4.1 kw, V = 50 m/min', 'Location', 'northwest');
% 绘制竖直线
line([0 0], [200 520], 'Color', 'black', 'LineStyle', '--', 'LineWidth', 1);
% 限制x轴跨度
xlim([-200 200]);
