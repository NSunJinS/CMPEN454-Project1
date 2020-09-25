function output = apply_convolve(input,filterbanks,biasvectors)
	output = zeros(size(input,1),size(input,2),size(filterbanks,4));
	for l = 1:size(filterbanks,4)
		sum = double(zeros(size(input,1),size(input,2)));
		for k = 1:size(input,3)
			sum = sum+double(imfilter(input(:,:,k),filterbanks(:,:,k,l),'conv'));
		end
		output(:,:,l) = sum+biasvectors(l);
	end
end