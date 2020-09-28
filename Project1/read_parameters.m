function read_parameters
%loading filterbanks and bias vectors
load('./CNNparameters.mat','filterbanks','biasvectors','layertypes') %Filepath

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
