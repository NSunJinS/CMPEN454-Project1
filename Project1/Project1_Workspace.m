%EE454 Project 1 - Workspace

%Import Test Image - "layerResults" is correct answers to test image.
load('./debuggingTest.mat'); 
load('./CNNparameters.mat','filterbanks','biasvectors');

%First Image Normalization (Layer 1) - Points to function file "apply_imnormalize.m"
output_layer_1 = apply_imnormalize(imrgb);

%First Convolution (Layer 2) - Points to function file "apply_convolve1.m"
output_layer_2 = apply_convolve1(output_layer_1,filterbanks{1,2},biasvectors{1,2});

%First ReLU (Layer 3) - Points to function file "apply_relu.m"
output_layer_3 = apply_relu(output_layer_2);
