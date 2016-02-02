function selected = selection(parents,X,y);

s = size(parents);
fit = zeros(s(1,1),1);
i = 1;
while i<= s(1,1)
	fit(i) = 1/(computeCostMulti(X,y,parents(i,:)'));
	i = i + 1;
end
mean_fit = mean(fit);
fit = round(fit/mean_fit);
wheel = [];
i = 1;
while i<= s(1,1)
	count = fit(i);
	j = 1;
	while(j <= count)
		wheel = [wheel ; parents(i,:)]; 
		j = j + 1;
	end
	i = i + 1;
end
len = length(wheel);
selected = zeros(s);
i = 1;
while i<= s(1,1)
	index = int32(rand(1,1) * len);
	if(index == 0)
		index = index + 1;
	end
	selected(i,:) = wheel(index,:);
	i = i + 1;
end
