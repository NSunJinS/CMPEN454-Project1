function out = backSub(currentFrame, firstFrame, threshold)
    % this code shouldn't work, it is just pseudocode placeholder
    diff = abs(firstFrame - currentFrame);
    lambda = threshold/255;
    out = im2double(imbinarize(diff, lambda));

end