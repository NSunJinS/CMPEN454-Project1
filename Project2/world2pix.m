function [pixpoint] = world2pix(Kmat, cpoint)
    pixpoint = Kmat*cpoint; % Convert film coordinates to pixel coordinates
    pixpoint(1) = pixpoint(1)/pixpoint(3);
    pixpoint(2) = pixpoint(2)/pixpoint(3);
    pixpoint(3) = 1;
end