function y = f(x)
%�Զ���ֶκ���f(x)
y = zeros(size(x));
n = size(x,1);
for m=1:n
    if(x(m)<0 && x(m)>=-1)
        y(m)=sin(pi*x(m));
    elseif(x(m)>=0 && x(m)<1/2)
        y(m)=cos(pi*x(m));
    end
end

end

