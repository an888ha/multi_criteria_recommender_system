%this is out main file i.e. the file which will invoke all funcitons 
%loading the data matrix ;

function rate = main1(m,count);
%%m = load('data_r1.txt'); %now m contains our data 
temp_m = m; %store the same matrix for later purposes
s = size(m);
n_users = s(1,1);
n_movies = s(1,2);
avg_rating = average_rating(m,n_users);          % avg_rating contains the average rating of all users
similarity = similarity_computation(m,n_users,n_movies,avg_rating,count); %this function will give us the similarity matrix

rate = rating_computation(m,similarity,avg_rating,n_users,n_movies);

rate = rate*13/(max(max(rate)));

%%done with this function


