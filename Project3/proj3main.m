% EE454 Project 2 - Main
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

v = VideoWriter(dirstring);
open(v);
%% read in each image in a loop and convert to grayscale
for frame = 1:maxframenum
    frameFile = sprintf('f%04d',frame);
    im = imread(strcat(dirstring,frameFile,'.jpg'));
    imGray = rgb2gray(im);
    
    writeVideo(v,imGray);
end
close(v);

%% compute Background Subtraction

%% compute Frame Differencing

%% compute Adaptive Background Subtraction

%% compute Persistent Frame Differencing



%% 

end












