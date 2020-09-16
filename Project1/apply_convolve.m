function outarray = apply_convolve(inarray, filterbank, biasvals)
    outarray = imfilter(inarray, filterbank+biasvals,'conv','replicate');
end