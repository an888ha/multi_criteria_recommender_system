function [r1,r2] = crossOver(theta1,theta2)
r1 = theta1;
r2 = theta2;
alpha = 0.4;
%% choosing a random index now
l = 5;
index = int32(l*rand(1,1));
if(index == 0)
		index = index + 1;
end
i = index;
while i <= l
	r1(i) = alpha*theta1(i) + (1-alpha)*theta2(i);
	r2(i) = alpha*theta2(i) + (1-alpha)*theta1(i);
	i = i + 1;
end



