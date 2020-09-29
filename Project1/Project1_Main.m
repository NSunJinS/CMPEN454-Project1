% EE454 Project 1 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers

load('./CNNparameters.mat','filterbanks','biasvectors');
load('./cifar10testdata.mat','classlabels');
read_parameters % Given Sample code to output CNN layer types and filterbank sizes

input_image = load_demo; % (Un)comment line to enable/disable demo
%input_image = load_cifar10;
%input_image = imageset;

% 1st Layer - First Image Normalization - Points to function file "apply_imnormalize.m"
output_layer_1 = apply_imnormalize(input_image);

% 2nd Layer - First Convolution - Points to function file "apply_convolve.m"
output_layer_2 = apply_convolve(output_layer_1,filterbanks{1,2},biasvectors{1,2});

% 3rd Layer - First ReLU - Points to function file "apply_relu.m"
output_layer_3 = apply_relu(output_layer_2);

% 4th Layer - Second Convolution - Points to function file "apply_convolve.m"
output_layer_4 = apply_convolve(output_layer_3,filterbanks{1,4},biasvectors{1,4});

% 5th Layer - Second ReLU - Points to function file "apply_relu.m"
output_layer_5 = apply_relu(output_layer_4);

% 6th Layer - First Maxpool - Points to function file "apply_maxpool.m"
output_layer_6 = apply_maxpool(output_layer_5);

% 7th Layer - Third Convolution - Points to function file "apply_convolve.m"
output_layer_7 = apply_convolve(output_layer_6,filterbanks{1,7},biasvectors{1,7});

% 8th Layer - Third ReLU - Points to function file "apply_relu.m"
output_layer_8 = apply_relu(output_layer_7);

% 9th Layer - Fourth Convolution - Points to function file "apply_convolve.m"
output_layer_9 = apply_convolve(output_layer_8,filterbanks{1,9},biasvectors{1,9});

% 10th Layer - Fourth ReLU - Points to function file "apply_relu.m"
output_layer_10 = apply_relu(output_layer_9);

% 11th Layer - Second Maxpool - Points to function file "apply_maxpool.m"
output_layer_11 = apply_maxpool(output_layer_10);

% 12th Layer - Fifth Convolution - Points to function file "apply_convolve.m"
output_layer_12 = apply_convolve(output_layer_11,filterbanks{1,12},biasvectors{1,12});

% 13th Layer - Fifth ReLU - Points to function file "apply_relu.m"
output_layer_13 = apply_relu(output_layer_12);

% 14th Layer - Sixth Convolution - Points to function file "apply_convolve.m"
output_layer_14 = apply_convolve(output_layer_13,filterbanks{1,14},biasvectors{1,14});

% 15th Layer - Sixth ReLU - Points to function file "apply_relu.m"
output_layer_15 = apply_relu(output_layer_14);

% 16th Layer - Third Maxpool - Points to function file "apply_maxpool.m"
output_layer_16 = apply_maxpool(output_layer_15);

% 17th Layer - Fullconnect - Points to function file "apply_fullconnect.m"
output_layer_17 = apply_fullconnect(output_layer_16,filterbanks{1,17},biasvectors{1,17});

% 18th Layer - Softmax - Points to function file "apply_softmax.m"
output_layer_18 = apply_softmax(output_layer_17);


%-----Accuracy-and-Confusion-Matrix-----------


%---------------------------------------------


%-----Individual-Image-output-data------------
% Output Graph with Probabilities
figure(10)
output = (output_layer_18(:));
bar(output)

%sample code to show image
figure(11)
imagesc(input_image);
truesize(gcf,[64 64]);

% Find most probable class
classprobvec = squeeze(output_layer_18);
[maxprob,maxclass] = max(classprobvec);
% Using classlabels is defined in ’cifar10testdata.mat’
fprintf('Estimated class is %s with probability %.4f\n', classlabels{maxclass}, maxprob);
%---------------------------------------------
