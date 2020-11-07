function [EpipolarLines1, EpipolarLines2] = findEpipolarLines(worldCoord3DPoints, cam1, cam1PixelCoords, cam2, cam2PixelCoords)

    printpoints2 = cam.prinpoint;
    xprint2 = printpoints2(1);
    yprint2 = printpoints2(2);
    rotation2 = cam.Rmat;
    position2 = cam.position;
    focal_length2 =  cam.foclen;
    pixelmat2 = [1 0 xprint2; 0 -1 yprint2; 0 0 1];
    Pmat2 = cam.Pmat;
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
    
    
    %%% find epipolar lines fromthe E matrix here
    EpipolarLines1 = ;
    EpipolarLines2 = ;
end
