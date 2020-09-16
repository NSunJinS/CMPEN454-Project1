function outarray = apply_imnormalize (inarray)
    inarray = double(inarray);
    outarray = (inarray/255.0) - 0.5;
    %imagesc(output);% = for function testing.
end