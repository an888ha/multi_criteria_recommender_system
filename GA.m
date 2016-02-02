function best_theta = GA(X,y);
parents = rand(50,5);
n = 50;
iter = 40;
i = 1;
while(i<=iter)
	%% selection part
	parents = selection(parents,X,y);
	%% selection part

	%% crossover part
	j = 1;
	while(j<=n-1)
	[parents(j,:) ,parents(j+1,:)] = crossOver(parents(j,:),parents(j+1,:));
	j = j + 2;
	end
	%% crossover part


	%%mutation
	parents = mutation(parents);
	%%mutation
	i = i + 1;
end

temp = -10000;
res = rand(1,5);
i = 1;
while i<= n
	fit = 1/(computeCostMulti(X,y,parents(i,:)'));
	if(fit >= temp)
			res = parents(i,:);
			temp = fit;
	end
	i = i + 1;
end
best_theta = res;
