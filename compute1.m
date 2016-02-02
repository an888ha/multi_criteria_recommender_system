function result  =  compute1( a,b,n,avg_a,avg_b);
%basically a person co-relation vectorized implementation;
i = 1;
a = a';
b = b';
while i <= n
	if( a(i) == 0 || b(i) == 0 )
		a(i) = 0;
		b(i) = 0;
	end
	i = i + 1;
end
C = a.*b;
nominator = sum(C);
X1 = a.*a;
Y1 = b.*b;
s1 = sqrt(sum(X1));
s2 = sqrt(sum(Y1));
s3 = s1*s2;
result = -1;
if(s3 ~=0)
	result = nominator/s3;
end;



