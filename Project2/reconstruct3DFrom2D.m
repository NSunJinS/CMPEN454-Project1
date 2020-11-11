function p = reconstruct3DFrom2D(vue2, vue4, point2, point4)
    %%Obtain the triangulation of from two cameras with their pixel points

    %create the matrix for pixels joints
    p = zeros(3,12); 

    %Get camera2 and camera4 locations
    tao2 = vue2.Pmat(:,4);
    location2 = -(vue2.Rmat.')*tao2; 
    tao4 = vue4.Pmat(:,4);
    location4 = -(vue4.Rmat.')*tao4;

    %obtain linear equation answer
    C2C1 = location4-location2;

    for i = 1:12
        temp2 = vue2.Kmat\point2(:,i);     
        temp4 = vue4.Kmat\point4(:,i);
        vue2VR = (vue2.Rmat.')* temp2;
        vue4VR = (vue4.Rmat.') * temp4;

        u3 = cross(vue2VR,vue4VR)/abs(cross(vue2VR,vue4VR));

        %create a linear equation matrix
        LinearMat(:,1) = vue2VR;
        LinearMat(:,2) = -vue4VR;
        LinearMat(:,3) = u3(:,3);

        % A^(-1)* b calculation. P1 and p2 pixels coordinates
        linearVars = LinearMat\(C2C1);      
        p1 = location2 + (linearVars(1)*vue2VR); 
        p2 = location4 + (linearVars(2)*vue4VR);

        %calculate triangulation for points
        p(:,i) = (p1 + p2)/2;    
    end
end
