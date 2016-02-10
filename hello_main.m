%% multi_criteria recommender system using aggregation function
%% this is our main file which we will be calling 
m0 = load('data5.txt');
m1 = load('data1.txt');
m2 = load('data2.txt');
m3 = load('data3.txt');
m4 = load('data4.txt');
%%now i am going to use linear regression to learn my aggregation function
%%converting data in such format so that LINEAR_REGRESSION (gradient descent) can be applied
s = size(m0);
n_users = s(1,1);
n_movies = s(1,2);
s = size(m0);
theta_for_all_1 = zeros(s(1,1),5);
theta_for_all_2 = zeros(s(1,1),5);
i = 1;
while i <= s(1,1)
	p = [];
	x = [];
	y = [];
	j = 1;
	while j<=s(1,2)
		if(m0(i,j) ~= 0)
		p = [m1(i,j) m2(i,j) m3(i,j) m4(i,j)];		
		x = [x ; p];
		y = [y ; m0(i,j)];
		end
		j = j + 1;
	end
	% here we are going to compute the weights(theta) for every user
	m = length(y);
	x = [ones(m, 1), x]; % Add a column of ones to x
	

	% now we are going the learn the weights
	theta = rand(5,1);
	theta_final = gradientDescentMulti(x , y, theta, 0.0003,200);
	theta_for_all_1(i,:) = theta_final;

	%% for using GA uncomment below line
	theta_final = GA(x,y);
	theta_for_all_2(i,:) = theta_final;
	i = i + 1;
end
csvwrite('theta_1.txt',theta_for_all_1);
csvwrite('theta_2.txt',theta_for_all_2);
