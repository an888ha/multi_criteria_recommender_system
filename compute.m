function result  =  compute( a,b,n,avg_a,avg_b,n1,n2);
%basically a person co-relation vectorized implementation;
i = 1;
a = a';
b = b';
x = [];
y = [];
%fprintf("i was gere\n");
while i <= n 
	if( a(i,1) == 0 || b(i,1) == 0 )
		i = i + 1;
		continue;
        end
	x = [x a(i,1) ];
	y = [y b(i,1) ]; 
	i = i  + 1; 
end
%fprintf("i was gere\n");
X = x .- avg_a;
Y = y .- avg_b;
C = X.*Y;
nominator = sum(C);
X1 = X.*X;
Y1 = Y.*Y;
s1 = sum(X1);
s2 = sum(Y1);
s3 = s1*s2;
s = sqrt(s3);
result = -1;
if(s ~=0)
	result = nominator/s;
end;


