function out = backSub(currentFrame, firstFrame, lambda)
    % this code shouldn't work, it is just pseudocode placeholder
    diff = abs(firstFrame - currentFrame);
    out = threshold(diff, lambda);

end