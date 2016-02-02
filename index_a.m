function [new_matrix,index,rate] = index_a (m,n_users,n_movies) ;
% a function for random index selection
new_matrix = m;
sample_size = 1; % no of movies selected from each users for testing

size_index = n_users * sample_size ;
index = zeros(size_index,2);
rate = zeros(size_index,1);
i = 1;
j = 1;
flag = zeros(n_users,n_movies);

while(i <= size_index )
		h1 = j;
		h2 = int32(n_movies*rand(1,1));
		
		if( h2 == 0 )
			h2 = h2 + 1;
		end; 
		%fprintf("%d %d %d\n",h1,h2,m(h1,h2));
		if( m(h1,h2) == 0 || flag(h1,h2) == 1 )
			continue;
		end;
		flag(h1,h2) = 1;
		index(i,1) = h1;
		index(i,2) = h2;
		rate(i) = m(h1,h2);
		new_matrix(h1,h2) = 0;
	i = i + 1;
	if(mod(i,sample_size) == 0 )
		j = j + 1;
	end
	
end
