function mutated = mutation(parents);
mutated = parents;
s = size(parents);
i = 1;
while i<= s(1,1)
	check = int32(rand(1,1) * 10);
	if(check == 2)
		index = int32(rand(1,1) * 5);
		if(index == 0)
			index = index + 1;
		end
		mutated(i,index) = rand(1,1);
	end
	i = i + 1;
end

