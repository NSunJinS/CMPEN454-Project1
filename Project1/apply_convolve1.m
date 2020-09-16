function output = apply_convolve(input)
    load('~/Data/EE454_Matlab/Project1DataFiles/CNNparameters.mat');
    filterbank1 = filterbanks{1,2};
    output = imfilter(input,filterbank1,'same','replicate');
    %imagesc(output);% = for function testing.
end