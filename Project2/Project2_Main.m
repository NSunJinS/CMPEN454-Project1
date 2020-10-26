% EE454 Project 2 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers

% Input/Parse Mocap Dataset
    mocap = 'Subject4-Session3-Take4_mocapJoints.mat';
    mocap_full = open(mocap);
    
% Input/Parse Camera Paramters

% Project 3D to 2D Locations
    % Load in videos
    filenamevue2mp4 = 'Subject4-Session3-24form-Full-Take4-Vue2_updated.mp4';
    vue2video = VideoReader(filenamevue2mp4);
    
    filenamevue4mp4 = 'Subject4-Session3-24form-Full-Take4-Vue4_updated.mp4';
    vue4video = VideoReader(filenamevue4mp4);
    
    % Convert World pts to Cam pts
    campoint = world2cam(Pmat, worldpoint);
    
% Triangulation of 2D to 3D 

% Computation of Error btwn Original and Triangulated 3D pts

% Compute Euclidean Distance
L_Squared = Euclidean_Dist(point1, point2); % Function for computing L^2


% Compute Epipolar Lines