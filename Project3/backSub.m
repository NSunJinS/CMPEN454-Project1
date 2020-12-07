function out = backSub(currentFrame, firstFrame, lambda)
    diff = abs(firstFrame - currentFrame);
    out = im2double(imbinarize(diff, lambda));

end
