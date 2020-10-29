% EE454 Project 2 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers

% Input/Parse Mocap Dataset
    mocap = 'Subject4-Session3-Take4_mocapJoints.mat';
    mocap = open(mocap);
    
    joints = mocap.mocapJoints;
    
    ids = [];
    for frame = 1:size(joints,1)
        if not(any(joints(frame,1:12,4) == 0))
        ids = [ids frame];
        end
    end
    
    joints_new = joints(ids,:,1:3);

% Input/Parse Camera Paramters

% Project 3D to 2D Locations
    % Load in videos
    filenamevue2mp4 = 'Subject4-Session3-24form-Full-Take4-Vue2_updated.mp4';
    vue2video = VideoReader(filenamevue2mp4);
    
    filenamevue4mp4 = 'Subject4-Session3-24form-Full-Take4-Vue4_updated.mp4';
    vue4video = VideoReader(filenamevue4mp4);
    
    % Convert World pts to Cam pts
    campoint = world2cam(Pmat, wpoint);
    
    % Convert World pts to Pix pts
    pixpoint = world2pix(Kmat, cpoint);
    
% Triangulation of 2D to 3D 

% Computation of Error btwn Original and Triangulated 3D pts

% Compute Euclidean Distance
point1 = 1; %Point 1 here (replace 1 & 2)
point2 = 2; %Point 2 here
L_Squared = sqrt(sum((point1(:) - point2(:)) .^ 2));

% Compute Epipolar Lines