function output = apply_softmax(input)
	a = max(input(1,1,:));
	s = sum(exp(input(1,1,:)-a));
	output = exp(input(1,1,:)-a)/s;
end