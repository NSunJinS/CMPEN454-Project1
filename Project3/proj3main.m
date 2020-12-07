% EE454 Project 3 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers 


% FOR GROUP: USE THIS AS THE FINAL TURN IN FUNCTION%%
% dirstring = directory where numbered input image files are read from

% maxframenum = integer which is the frame number of the last image file in the sequence

% abs_diff_threshold = number between 0 and 255. It is the threshold called 
        %“lambda” in the lecture slide pseudocode

% alpha_parameter = floating point number between 0 and 1. It is the alpha
        % “blending” parameter for adaptive
        
% gamma_parameter = number between 0 and 255. It is the gamma “decay” parameter used in
        % the pseudocode for persistent frame differencing.
function out = proj3main(dirstring,maxframenum,abs_diff_threshold,alpha_parameter,gamma_parameter) 

%function stubs as per the project description
lambda = abs_diff_threshold/255;
gamma = gamma_parameter/255;

v = VideoWriter('Project3Video');
open(v);

% Back Sub init
staticBackground = rgb2gray(imread(strcat(dirstring, 'f0001.jpg')));

% frame differencing init
frameDiffBackground = staticBackground;

% adaptive back sub init
adpBackSubBackground = staticBackground;

% persistent frame differencing init
persistFrameDiffBackground = staticBackground;
H = zeros(size(staticBackground));

%% read in each image in a loop and convert to grayscale
for frame = 1:maxframenum
    frameFile = sprintf('f%04d',frame);
    im = imread(strcat(dirstring,frameFile,'.jpg'));
    imGray = rgb2gray(im);
    
    

%% compute Background Subtraction
    bSub = backSub(imGray, staticBackground, lambda);
    
%% compute Frame Differencing
    % using imGray as I(t)
    fDiff = frameDiff(imGray, frameDiffBackground, lambda);
    frameDiffBackground = imGray;
    
%% compute Adaptive Background Subtraction
    adpBSub = adpBackSub(imGray, adpBackSubBackground, lambda);
    adpBackSubBackground = (imGray.*alpha_parameter) + (adpBackSubBackground.*(1-alpha_parameter));

%% compute Persistent Frame Differencing
    persistFDiff = persistFrameDiff(imGray, persistFrameDiffBackground, lambda);
    tmp = max(H-gamma,0);
    H = max(persistFDiff, tmp);
    persistFrameDiffBackground = imGray;

%% concatenize the 4 different frame for the video
    outimage = [bSub fDiff; adpBSub H];

%% write the output to a video file
    writeVideo(v,outimage);
end
close(v);
end












