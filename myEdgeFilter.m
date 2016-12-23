function [Im Io Ix Iy] = myEdgeFilter(img, sigma) 
if(ischar(img))
    img0 =  (im2double(imread(img)));
    if(size(img0,3) ==3)
        img0 =  rgb2gray(img0);
    end
else
  img0 = img;
end
Gaussian = fspecial('gaussian', [3 3], sigma);

Gx = [-1, 0, +1;
     -2, 0, +2;
     -1, 0, +1];

Gy = [1, 2, 1;
      0, 0, 0;
      -1, -2, -1];
Ismooth =  myImageFilter(img0, Gaussian); 
Ix = myImageFilter(Ismooth, Gx);
Iy = myImageFilter(Ismooth, Gy);
Io = atan(double(Iy./Ix)); 
Im = sqrt(double(Ix.^2 + Iy.^2));
end 