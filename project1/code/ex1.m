close all;
clear;
clc;

%% ����ԭʼͼ��
xh = (-1:0.01:1)';
runge = 1./(1+25*xh.^2);
figure
plot(xh,runge,'r','Linewidth',2)
xlabel('x')
ylabel('y')
title('Runge����ͼ��')
saveas(gcf, 'result/runge.png')

%% �Ⱦ�Lagrange��ֵ
x = (-1:0.1:1)';
y = 1./(1+25*x.^2);

xh2 = (-0.5:0.01:0.5)';
runge2 = 1./(1+25*xh2.^2);

lag = lagrange(x,y,xh);
figure
plot(xh,lag, 'b', 'Linewidth',2)
xlabel('x')
ylabel('y')
title('20��Lagranged�Ⱦ�ڵ��ֵRunge����ͼ��')
saveas(gcf, 'result/lagrunge.png')

lag2 = lagrange(x,y,xh2);
figure
plot(xh2,lag2, 'b', 'Linewidth',2)
hold on
plot(xh2,runge2, 'g', 'Linewidth',2)
xlabel('x')
ylabel('y')
legend('Lagrange��ֵͼ��','ԭͼ��')
title('20��Lagrange�Ⱦ�ڵ��ֵRunge�����ֲ�ͼ����ԭͼ��Ա�')
saveas(gcf, 'result/lagrunge2.png')

%% �Ⱦ�Newton��ֵ
newton = newtonInterpol(x,y,xh);
figure
plot(xh,newton, 'g', 'Linewidth',2)
xlabel('x')
ylabel('y')
title('20��Newton�Ⱦ�ڵ��ֵRunge����ͼ��')
saveas(gcf, 'result/newtonrunge.png')

newton2 = newtonInterpol(x,y,xh2);
figure
plot(xh2,newton2, 'b', 'Linewidth',2)
hold on
plot(xh2,runge2, 'r', 'Linewidth',2)
xlabel('x')
ylabel('y')
legend('Newton��ֵͼ��','ԭͼ��')
title('20��Newton�Ⱦ�ڵ��ֵRunge�����ֲ�ͼ����ԭͼ��Ա�')
saveas(gcf, 'result/newtonrunge2.png')

%% Chebyshev����ʽ���Lagrange��ֵ
k = (0:20)';
x = cos((2*k+1)/42*pi);
y = 1./(1+25*x.^2);

lagche = lagrange(x,y,xh);
figure
hold on
plot(xh,runge,'c','Linewidth',2)
plot(xh,lagche, 'r', 'Linewidth',2)
xlabel('x')
ylabel('y')
title('Chebyshev����ʽ����ֵRunge����ͼ��')
legend('ԭͼ��','��ֵͼ��')
saveas(gcf, 'result/lagche.png')

%% �ֶ����Բ�ֵ
x = (-1:0.1:1)';
y = 1./(1+25*x.^2);

ylin = interp1(x,y,xh);
figure
plot(xh,ylin, 'b', 'Linewidth',2)
xlabel('x')
ylabel('y')
title('�ֶ����Բ�ֵRunge����ͼ��')
saveas(gcf, 'result/linrunge.png')

%% ������Ȼ������ֵ
x = (-1:0.1:1)';
y = 1./(1+25*x.^2);

yspline = interp1(x,y,xh,'spline');
figure
plot(xh,yspline, 'm', 'Linewidth',2)
xlabel('x')
ylabel('y')
title('������Ȼ������ֵRunge����ͼ��')
saveas(gcf, 'result/splinerunge.png')
