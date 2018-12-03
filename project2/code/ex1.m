close all;
clear;
clc;

testNum = 100;

cond2 = zeros(testNum);
dimension = 1:testNum;
for n = 1:testNum
    cond2(n) = cond(Hilbert(n),2);
end

figure(1)
plot(dimension, cond2)
xlabel('dimension')
ylabel('cond2')
title('cond2-dimension����ͼ')
saveas(gcf, 'result/cond2.png')

figure(2)
semilogy(dimension, cond2)
xlabel('dimension')
ylabel('cond2')
title('cond2-dimension��������ͼ')
saveas(gcf, 'result/logcond2.png')
