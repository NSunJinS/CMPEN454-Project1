% EE454 Project 2 - Main
% Group Members: Danny McClure, Nicholas Scarpitta, Weslee Hwang, & Mackenzie Myers

% Input/Parse Mocap Dataset
    mocap = 'Subject4-Session3-Take4_mocapJoints.mat';
    mocap = open(mocap);
    
    joints = mocap.mocapJoints;
    
    ids = []; % Grabs frames and ids with valid confidence values, stores them in joints_new
    for frame = 1:size(joints,1)
        if not(any(joints(frame,1:12,4) == 0))
        ids = [ids frame]; %#ok<AGROW> %%% suppressed warning sign about pre allocating the var
        end
    end
    
    joints_new = joints(ids,:,1:4);
    
    % grabs data for singular frame
    mocapFnum = 1000; %mocap frame number 1000 
    x = joints_new(mocapFnum,:,1); %array of 12 X coordinates
    y = joints_new(mocapFnum,:,2); %  Y coordinates
    z = joints_new(mocapFnum,:,3); %  Z coordinates
    conf = joints_new(mocapFnum,:,4); %confidence values

% Input/Parse Camera Paramters

    % Parameters for Vue2 camera
    load("./vue2CalibInfo.mat");
    printpoints2 = vue2.prinpoint;
    xprint2 = printpoints2(1);
    yprint2 = printpoints2(2);
    rotation2 = vue2.Rmat;
    position2 = vue2.position;
    focal_length2 =  vue2.foclen;
    pixelmat2 = [1 0 xprint2; 0 -1 yprint2; 0 0 1];
    Pmat2 = vue2.Pmat;
    Pmat2 = [Pmat2;0 0 0 1];
    
    % Create Rotation Matrix [R]
    rotation_matrix = [rotation2; 0,0,0];
    temp = [0;0;0;1];
    rotation_matrix = [rotation_matrix temp];
    
    % Create Skew Matrix [S]
    skew_matrix = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
    position2 = position2*-1;
    position2 = [position2 1]';
    skew_matrix = [skew_matrix position2];

    % Create Essential Matrix [E]
    essential_matrix = rotation_matrix * skew_matrix;
    
    % Parameters for Vue4 camera
    load("./vue4CalibInfo.mat");
    printpoints4 = vue4.prinpoint;
    xprint4 = printpoints4(1);
    yprint4 = printpoints4(2);
    rotation4 = vue4.Rmat;
    position4 = vue4.position;
    focal_length4 =  vue4.foclen;
    pixelmat4 = [1 0 xprint4; 0 -1 yprint4; 0 0 1];
    Pmat4 = vue4.Pmat;
    Pmat4 = [Pmat4;0 0 0 1];
    
    % Forward projection for each vue for all 12 joints
A = zeros(3,size(joints_new,1),12);
B = zeros(3,size(joints_new,1),12);
for y = 1:12
    for x = 1:size(joints_new,1)
        point = joints_new(x,y,1:3);
        newpoint = world2camera(Pmat2, [point(1); point(2);point(3);1]);
        pixelpoint = camera2pixel([vue2.Kmat [0;0;0]], newpoint);
        A(:,x,y) = pixelpoint;
        
        newpoint4 = world2camera(Pmat4, [point(1);point(2);point(3);1]);
        pixelpoint4 = camera2pixel([vue4.Kmat [0;0;0]],newpoint4);
        B(:,x,y) = pixelpoint4;
    end
end

% Project 3D to 2D Locations
    % Load in videos
    filenamevue2mp4 = 'Subject4-Session3-24form-Full-Take4-Vue2.mp4';
    vue2video = VideoReader(filenamevue2mp4);
    vue2video.CurrentTime = (mocapFnum-1)*(50/100)/vue2video.FrameRate;
    vid2Frame = readFrame(vue2video);
    
    x = joints(mocapFnum,:,1);
    y = joints(mocapFnum,:,2);
    z = joints(mocapFnum,:,3);
    t = [x;y;z]
    point2 = project3DTo2D(vue2,t)
    %imshow(vid2Frame)
    %hold on;
    %scatter(point2(1,:),point2(2,:),'filled');
    
    filenamevue4mp4 = 'Subject4-Session3-24form-Full-Take4-Vue4.mp4';
    vue4video = VideoReader(filenamevue4mp4);
    vue4video.CurrentTime = (mocapFnum-1)*(50/100)/vue4video.FrameRate;
    vid4Frame = readFrame(vue4video);
    
    x = joints(mocapFnum,:,1);
    y = joints(mocapFnum,:,2);
    z = joints(mocapFnum,:,3);
    t = [x;y;z]
    point4 = project3DTo2D(vue4,t)
    %imshow(vid4Frame)
    %hold on;
    %scatter(point4(1,:),point4(2,:),'filled');
    
% Triangulation of 2D to 3D 
     triangulation = traingulationTo3D(vue2, vue4, point2, point4)
% Computation of Error btwn Original and Triangulated 3D pts

% Compute Euclidean Distance
point1 = 1; %Point 1 here (replace 1 & 2)
point2 = 2; %Point 2 here
L_Squared = sqrt(sum((point1(:) - point2(:)) .^ 2));

% Compute Epipolar Lines



% Needed Functions
function[newpoint] = world2camera(Pmat, worldpoint)
    newpoint = Pmat * worldpoint; % Convert world coordinates to camera coordinates
end

function [pixelpoint] = camera2pixel(Kmat, point)
    pixelpoint = Kmat*point; % Convert film coordinates to pixel coordinates
    pixelpoint(1) = pixelpoint(1)/pixelpoint(3);
    pixelpoint(2) = pixelpoint(2)/pixelpoint(3);
    pixelpoint(3) = 1;
end

function [pixelpoint] = world2pixel(Pmat,worldpoint,Kmat)
camerapoint = world2camera(Pmat,worldpoint);
pixelpoint = camera2pixel(Kmat,camerapoint);
end

