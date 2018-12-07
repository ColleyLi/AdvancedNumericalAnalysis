function yh = lagrange(x,y,xh)
%Lagrange��ֵ����
%   input:x,��ֵ�ڵ�
%         y,��ֵ����
%         xh,��ֵ��
%   output:yh,��ֵ���ֵ
n = length(x);
m = length(xh);
x = x(:);
y = y(:);
xh = xh(:);
yh = zeros(m,1);
c1 = ones(1,n-1);
c2 = ones(m,1);
for t=1:n
    xp = x([1:t-1 t+1:n]);
    yh = yh + y(t)*prod((xh*c1-c2*xp')./(c2*(x(t)*c1-xp')),2);
end

%% ���ƽڵ������
% figure
% t = 11;
% xt = x([1:t-1 t+1:n]);
% yt = zeros(m,1);
% yt = yt + y(t)*prod((xh*c1-c2*xt')./(c2*(x(t)*c1-xt')),2);
% plot(xh, yt, 'm', 'Linewidth',2);
% xlabel('x')
% ylabel('y')
% title('x=0���Ľڵ������')
% saveas(gcf, 'result/base0f.png')

end

