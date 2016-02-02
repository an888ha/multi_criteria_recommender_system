%{
function y=fit_m(x)
y=x(1)^2+x(2)^2+2;
end
%}

function J=fit_m(theta,x,y,m)
t=0;
for k=1:m
t=t+ ((x(k,1)*theta(1)+x(k,2)*theta(2)+x(k,3)*theta(3)-y(k)).^2);
end;
J=(1/(2*m))*t;
end

