function result = rate_predict(m,sim,avg,user,movie,n)

%thresold value = ( sim(u1,u2) > 0.4 );  
% return the normalised rating which is when added to avg rating becomes final rating

result = 0;
k = 0;
x = m(:,movie);
x = x';
i = 1;

while i <= n
	if x(i) == 0 
		i = i + 1;
		continue;
	end
	  %thresold value
		result = result + ( (x(i)-avg(i)) * (sim(user,i)) );
		k = k +  abs(sim(user,i));
	i = i + 1;
end
result = avg(user);
if( k ~= 0 )
	result = result/k + avg(user);
	end;

