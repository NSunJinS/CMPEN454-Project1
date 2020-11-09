function errors = errorTriangulation(trianPoints, t)
    %matrix of errors
    errors = zeros(1,12);
    
    for i = 1:12
        errors(i) = sqrt((t(1,i) - trianPoints(1,i)).^2 + (t(2,i) - trianPoints(2,i)).^2 + (t(3,i) - trianPoints(3,i)).^2);
    end
    
end