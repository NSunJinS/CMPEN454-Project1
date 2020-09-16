%loading in images
load './cifar10testdata.mat'

for classindex = 1:10
    %get indices of all images of that class
    inds = find(trueclass==classindex);
    %take first one
    imrgb = imageset(:,:,:,inds(1));
    %display it along with ground truth text label
    figure; imagesc(imrgb); truesize(gcf,[64 64]);
    title(sprintf('%s',classlabels{classindex}));
end

%loading filterbanks and bias vectors
load './CNNparameters.mat' 
%Filepath

%sample code to identify which layers have biases and filters
for d = 1:length(layertypes)
    fprintf('layer %d is of type %s\n',d,layertypes{d});
filterbank = filterbanks{d};
    if not(isempty(filterbank))
        fprintf('filterbank size %d x %d x %d x %d\n', size(filterbank,1), size(filterbank,2), size(filterbank,3), size(filterbank,4));
        biasvec = biasvectors{d};
        fprintf('number of biases is %d\n',length(biasvec));
    end
end




%Decompose Channels - Optional?
%red1 = im1(:,:,1);
%green1 = im1(:,:,2);
%blue1 = im1(:,:,3);
%gray1 = (red1+green1+blue1)/3;