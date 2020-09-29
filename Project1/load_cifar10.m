function output = load_cifar10

%loading in images
load('./cifar10testdata.mat')

for classindex = 1:10
    %get indices of all images of that class
    inds = find(trueclass==classindex);
    %take first one
    imrgb = imageset(:,:,:,inds(1));
    %display it along with ground truth text label
    figure; imagesc(imrgb); truesize(gcf,[64 64]);
    title(sprintf('%s',classlabels{classindex}));
end

output = imrgb;

end