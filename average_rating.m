function avg = average_rating(m,n);
avg = zeros(n,1);
i = 1;
while (i <= n)
	avg(i) = sum(m(i,:))/nnz(m(i,:));
	i = i + 1;
end

