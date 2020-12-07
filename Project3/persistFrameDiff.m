function out = persistFrameDiff(I,B,threshold)
    diff = abs(B - I);
    lambda = threshold/255;
    out = im2double(imbinarize(diff, lambda));
end