function yh = newtonInterpol(x,y,xh)
%Newton��ֵ����
%   input:x,��ֵ�ڵ�
%         y,��ֵ����
%         xh,��ֵ��
%   output:yh,��ֵ���ֵ
n = length(x);
Y = zeros(n);
Y(:,1) = y';

for k=1:n-1
    for t = 1:n-k
        Y(t,k+1)=(Y(t+1,k)-Y(t,k))/(x(t+k)-x(t));
    end
end

m = length(xh);
yh = zeros(m,1);

for t=1:n
    z = ones(m,1);
    for k = 1:t-1
        z = z.*(xh-x(k));
    end
    yh = yh + z*Y(1,t)';
end

end

