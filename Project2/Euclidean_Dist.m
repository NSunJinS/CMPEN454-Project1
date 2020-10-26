function out = Euclidean_Dist(point1,point2)
out = sqrt(sum((point1(:) - point2(:)) .^ 2));
end