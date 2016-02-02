function  theta = gradientDescentMulti(X, y, theta, alpha, num_iters)

m = length(y); % number of training examples
temp = zeros(5,1);

for iter = 1:num_iters

%	fprintf("cost value is");
%	if(mod(iter,100) == 0)
%		fprintf("cost value is");
%		J = computeCostMulti(X, y, theta)
%	end
    i = 1;
    for i=1:5
    temp(i) =  (sum((X*theta - y) .* X(:,i)));
    end
    i = 1;
    for i=1:5
    theta(i) =  theta(i) - (alpha/m)*temp(i);
    end
    %theta = theta - alpha / m *  X' * (X*theta-y);
    % ============================================================

    % Save the cost J in every iteration    
   

end

end
