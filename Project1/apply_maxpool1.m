function output = apply_maxpool1(input)
    a = max(input(1:2:end,1:2:end,:),input(2:2:end,1:2:end,:));
	b = max(input(1:2:end,2:2:end,:),input(2:2:end,2:2:end,:));
	output = max(a,b);
end