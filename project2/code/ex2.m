close all;
clear;
clc;

testNum = 100;
dimension = (1:testNum)';
error_gauss = zeros(testNum,1);
error_jacobi = zeros(testNum, 1);
error_gs = zeros(testNum, 1);
error_sor = zeros(testNum, 1);
rho_jacobi = zeros(testNum,1);
rho_gs = zeros(testNum,1);
rho_sor = zeros(testNum,1);
knum_gs = zeros(testNum,1);
knum_sor = zeros(testNum,1);
bestw = zeros(testNum,1);

for n = 1:testNum
    H=Hilbert(n);
    x=ones(n,1);
    b=H*x;

    % Gauss��ȥ��
    x1=Gauss(H,b);
    error_gauss(n)=norm(x1-x)/norm(x);

    %Jacobi������
    x0 = zeros(n,1);
    [x2,kj,rho] = Jacobi(H,b,x0,1e-6);
    error_jacobi(n)=norm(x2-x)/norm(x);
    rho_jacobi(n) = rho;

    %Gauss-Seidel������
    x0 = zeros(n,1);
    [x2,kgs,rho,ergs] = GaussSeidel(H,b,x0,1e-2);
    error_gs(n)=norm(x2-x)/norm(x);
    rho_gs(n) = rho;
    knum_gs(n) = kgs;
    
    %SOR������
    x0 = zeros(n,1);
    bestw(n) = bestOmega(H);
    [x3,ksor,rho,ersor] = SOR(H,b,x0,1e-2,bestw(n));
    error_sor(n)=norm(x3-x)/norm(x);
    rho_sor(n) = rho;
    knum_sor(n) = ksor;
end

figure;
semilogy(dimension, error_gauss, 'g', 'LineWidth', 2)
title('Gauss��ȥ��������')
xlabel('����n')
ylabel('e_r(B)')
saveas(gcf, 'result/gausserror.png')

figure;
hold on;
plot(dimension, rho_jacobi, 'g', 'LineWidth', 2)
% plot(dimension, ones(size(dimension)), 'r')
title('Jacobi����������װ뾶')
xlabel('����n')
ylabel('\rho(J)')
saveas(gcf, 'result/jacobirho.png')
hold off;

figure;
hold on;
plot(dimension, rho_gs, 'b', 'LineWidth', 2)
% plot(dimension, ones(size(dimension)), 'r')
title('Gauss-Seidel����������װ뾶')
xlabel('����n')
ylabel('\rho(GS)')
saveas(gcf, 'result/gsrho.png')
hold off;

figure;
plot(dimension, bestw, 'r', 'Linewidth', 2)
title('SOR�������������ʱw�����n�Ĺ�ϵ')
xlabel('����n')
ylabel('�������ʱ��w')
saveas(gcf, 'result/bestw.png')

figure;
plot(dimension, rho_sor, 'r', 'LineWidth', 2)
title('SOR����������װ뾶')
xlabel('����n')
ylabel('\rho(SOR)')
saveas(gcf, 'result/sorrho.png')

figure;
semilogy(1:kgs, ergs, 'r', 'LineWidth', 2)
hold on;
semilogy(1:ksor, ersor, 'b', 'LineWidth', 2)
title('n=100���������е����仯')
xlabel('��������')
ylabel('������')
legend('GS������','SOR������')
saveas(gcf, 'result/er100.png')
hold off;