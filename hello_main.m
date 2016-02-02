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
[new_final_matrix,indexes,ratings] = index_a(m0,n_users,n_movies);
s = size(indexes);
i = 1;
while i<= s(1,1)
	row = indexes(i,1);
	col = indexes(i,2);
	m1(row,col) = 0;
	m2(row,col) = 0;
	m3(row,col) = 0;
	m4(row,col) = 0;	
	i = i + 1;
end

fprintf("training and testing data seperated");
pause;


s = size(m0);

%% our collaborative filtering approach
%%rate0 = main1(m0);
rate1 = main1(m1,1);
rate2 = main1(m2,2);
rate3 = main1(m3,3);
rate4 = main1(m4,4);

theta_for_all = zeros(s(1,1),5);

fprintf("single criteria work done\n");
pause;

i = 1;
while i <= s(1,1)
	p = [];
	x = [];
	y = [];
	j = 1;
	while j<=s(1,2)
		if(new_final_matrix(i,j) ~= 0)
		p = [rate1(i,j) rate2(i,j) rate3(i,j) rate4(i,j)];		
		x = [x ; p];
		y = [y ; new_final_matrix(i,j)];
		end
		j = j + 1;
	end
	% here we are going to compute the weights(theta) for every user
	m = length(y);
	x = [ones(m, 1), x]; % Add a column of ones to x
	% now we are going the learn the weights
	theta = rand(5,1);




	%% for using gradient Descent uncomment below line
	theta_final = gradientDescentMulti(x , y, theta, 0.0003,200);
	


	%% for using GA uncomment below line
	%%theta_final = GA(x,y);



	theta_for_all(i,:) = theta_final;	
	i = i + 1;
end


%% now we are going to compute the error


s = size(indexes);
predicted = zeros(s(1,1),1);
i = 1;
while i<= s(1,1)
	row = indexes(i,1);
	col = indexes(i,2);
	p = [1 rate1(row,col) rate2(row,col) rate3(row,col) rate4(row,col)];	
	value = (theta_for_all(row,:))*(p');
	predicted(i) = value;
	i = i + 1;
end

%% normalization
maximum = max(predicted);
maximum = max(maximum,13);
predicted = (predicted * 13)/ maximum ;

mae = sum(abs(ratings .- predicted))/s(1,1);
fprintf(" \n MAE is   = %f \n", mae);

