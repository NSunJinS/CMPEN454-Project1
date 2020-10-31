function[campoint] = world2cam(Pmat, worldpoint)
    campoint = Pmat * worldpoint; % Converting world coords to camera coords
end
