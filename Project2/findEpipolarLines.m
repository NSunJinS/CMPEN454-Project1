function [EpipolarLines1, EpipolarLines2] = findEpipolarLines(worldCoord3DPoints, cam1, cam1PixelCoords, cam2, cam2PixelCoords)

% worldCoord3DPoints are the 3D points of the joints, which the camera is trying capture. worldCoord3DPoints is a 3xM matrix, 
% where M represents the number of 3D points input to the functions.  
%(You can send one point at a time or all the 12 joints image coordinates at a time, the design choice is yours. 
% Ensure that your function works for a variable-length input.)

% cam1 & cam2 are the camera parameters provided to you (i.e., vue2 and vue4). cam1 & cam2 are a struct.

% cam1PixelCoords & cam2PixelCoords are the 2D pixel coordinates of the 3D points that are got by projecting 3D world coordinates to the 2D.  
% cam1PixelCoords & cam2PixelCoords are a matrix of size 3xN, where N represents the number of points input to the function.


% find essential matrix of camera 1 . 

    rotation1 = cam1.Rmat;
    position1 = cam1.position;
    focal_length1 =  cam1.foclen;
    Pmat1 = cam1.Pmat;
    Pmat1 = [Pmat1;0 0 0 1];
    
    % Create Rotation Matrix [R]
    rotation_matrix1 = [rotation1; 0,0,0];
    temp = [0;0;0;1];
    rotation_matrix1 = [rotation_matrix1 temp];
    
    % Create Skew Matrix [S]
    skew_matrix1 = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
    position1 = position1*-1;
    position1 = [position1 1]';
    skew_matrix1 = [skew_matrix1 position1];

    % Create Essential Matrix [E]
    essential_matrix1 = rotation_matrix1 * skew_matrix1;
    
% find essential matrix of camera 2 

    rotation2 = cam2.Rmat;
    position2 = cam2.position;
    focal_length2 =  cam2.foclen;
    Pmat2 = cam2.Pmat;
    Pmat2 = [Pmat2;0 0 0 1];
    
    % Create Rotation Matrix [R]
    rotation_matrix2 = [rotation2; 0,0,0];
    temp = [0;0;0;1];
    rotation_matrix2 = [rotation_matrix2 temp];
    
    % Create Skew Matrix [S]
    skew_matrix2 = [1 0 0; 0 1 0; 0 0 1; 0 0 0];
    position2 = position2*-1;
    position2 = [position2 1]';
    skew_matrix2 = [skew_matrix2 position2];

    % Create Essential Matrix [E]
    essential_matrix2 = rotation_matrix2 * skew_matrix2;
   

EpipolarLines1 = [];

EpipolarLines2 = [];
end
