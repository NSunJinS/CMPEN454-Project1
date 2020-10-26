% EE454 Project 2 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers

% 1) Input/Parse Mocap Dataset

% 2) Input/Parse Camera Paramters

% 3) Project 3D to 2D Locations
    % Load in videos
    filenamevue2mp4 = 'Subject4-Session3-24form-Full-Take4-Vue2_updated.mp4';
    vue2video = VideoReader(filenamevue2mp4);
    
    filenamevue4mp4 = 'Subject4-Session3-24form-Full-Take4-Vue4_updated.mp4';
    vue4video = VideoReader(filenamevue4mp4);

    

% 4) Triangulation of 2D to 3D 

% 5) Computation of Error btwn Original and Triangulated 3D pts

% 6) Compute Euclidean Distance
L_Squared = Euclidean_Dist(point1, point2); % Function for computing L^2

% 7) Compute Epipolar Lines