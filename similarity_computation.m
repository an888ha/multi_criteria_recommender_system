function similarity = similarity_computation(m,n_users,n_movies,avg_u,count);
%this function is being used in similarity computation
similarity = zeros(n_users,n_users); %similarity matrix
i = 1;
while i <= n_users
	j = 1;
	while j <= n_users
		similarity(i,j) = compute(m(i,:),m(j,:),n_movies,avg_u(i),avg_u(j)) ;  % rating == no of movies :)
		j = j  + 1;	
	end
	i = i + 1;
end

