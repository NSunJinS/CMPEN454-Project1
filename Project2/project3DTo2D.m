function out = project3DTo2D(cam, worldCoord3DPoints) 
    % pull out the camera parameters
    printpoints2 = cam.prinpoint;
    xprint2 = printpoints2(1);
    yprint2 = printpoints2(2);
    rotation2 = cam.Rmat;
    position2 = cam.position;
    focal_length2 =  cam.foclen;
    pixelmat2 = [1 0 xprint2; 0 -1 yprint2; 0 0 1];
    Pmat2 = cam.Pmat;
    Pmat2 = [Pmat2;0 0 0 1];
    
    % contruct the K *[ R | T ] chain 
    
    %T
    t = cam.position;
    t = -t';
    
    %Rt
    Rt = [cam.Rmat  t];
    temp = [0 0 0 1];
    Rt = [Rt;temp];
    
    %K
    K = cam.Kmat;
    temp = [0;0;0];
    
    K = [K temp];
    
    %out(length(worldCoord3DPoints), 3) = 0;
    out = [];
    for ii = 1: length(worldCoord3DPoints)
        p = worldCoord3DPoints(1:3,ii);
        p = [p;1];
        temp =(K * Rt * p)
        temp = temp ./ temp(3,1)
        out = [out temp]
    end
    
end

