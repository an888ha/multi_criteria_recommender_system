function rating = rating_computation(m,similarity,avg,n_users,n_movies);
%this function is being used in similarity computation
rating = zeros(n_users,n_movies); %similarity matrix
i = 1;
while i <= n_users
	j = 1;
	while j <= n_movies
		rating(i,j) = rate_predict(m,similarity,avg,i,j,n_users) ;  % rating == no of movies :)
		j = j  + 1;	
	end
	i = i + 1;
end
