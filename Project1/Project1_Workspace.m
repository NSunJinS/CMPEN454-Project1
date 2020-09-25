%EE454 Project 1 - Workspace

%Import Test Image - "layerResults" is correct answers to test image.
load('./debuggingTest.mat'); 
load('./CNNparameters.mat','filterbanks','biasvectors');

% 1st Layer - First Image Normalization - Points to function file "apply_imnormalize.m"
output_layer_1 = apply_imnormalize(imrgb);

% 2nd Layer - First Convolution - Points to function file "apply_convolve1.m"
output_layer_2 = apply_convolve1(output_layer_1,filterbanks{1,2},biasvectors{1,2});

% 3rd Layer - First ReLU - Points to function file "apply_relu.m"
output_layer_3 = apply_relu(output_layer_2);

% 4th Layer - Second Convolution - Points to function file "apply_convolve2.m"
output_layer_4 = apply_convolve2(output_layer_3,filterbanks{1,4},biasvectors{1,4});

% 5th Layer - Second ReLU - Points to function file "apply_relu.m"
output_layer_5 = apply_relu(output_layer_4);

% 6th Layer - First Maxpool - Points to function file "apply_maxpool1.m"
output_layer_6 = apply_maxpool1(output_layer_5);

% 7th Layer - Third Convolution - Points to function file "apply_convolve3.m"
output_layer_7 = apply_convolve3(output_layer_6,filterbanks{1,7},biasvectors{1,7});

% 8th Layer - Third ReLU - Points to function file "apply_relu.m"
output_layer_8 = apply_relu(output_layer_7);

