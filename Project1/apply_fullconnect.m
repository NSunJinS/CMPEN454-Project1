function output = apply_fullconnect(input,filterbanks,biasvectors)
	output = zeros(1,1,size(filterbanks,4));
	for l = 1:size(filterbanks,4)
		sum = 0;
		for i = 1:size(input,1)
			for j = 1:size(input,2)
				for k = 1:size(input,3)
					sum = sum+filterbanks(i,j,k,l)*input(i,j,k);
				end
			end
		end
		output(:,:,l) = sum+biasvectors(l);
	end
end
