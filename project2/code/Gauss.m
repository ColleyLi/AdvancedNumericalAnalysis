function x = Gauss(A,b)
%Gauss��ȥ���������Է�����Ax=b�Ľ�
%   input: A,b
%   output: x
n = size(A,1);
x = zeros(n,1);
for k=1:n-1
    for t=k+1:n
        piv=A(t,k)/A(k,k);
        for s=k:n
            A(t,s)=A(t,s)-piv*A(k,s);
        end
        b(t)=b(t)-piv*b(k);
    end
end

x(n)=b(n)/A(n,n);
for m=n-1:-1:1
    s=0;
    for k=m+1:n
        s=s+A(m,k)*x(k);
    end
    x(m)=(b(m)-s)/A(m,m);
end
end

