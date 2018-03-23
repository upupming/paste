% 测试一下x轴分段
x=1:160;
y=sin(x);
subplot(211)
plot(x,y)

idx=[1:30,120:160];
xx=1:length(idx);
y(31:129)=NaN;
yy=y(idx);
xtick=0:10:80;
xticklabel=[0:10:30,130:10:170];
subplot(212)
plot(xx,yy);
set(gca,'xticklabel',xticklabel,'xtick',xtick)
