for imgNumber=1:5
    
    imgPath = 'img0';
    imgPath2 = strcat(num2str(imgNumber),'.jpg');
    imgPath = strcat(imgPath,imgPath2);
    %%%%%%%% Loading image %%%%%%%%
    img0 =  (im2double(imread(imgPath)));
    if(size(img0,3) ==3)
        img0 =  rgb2gray(img0);
    end

    %%%%%%%% MyImageFilter Call%%%%%%%%%%%%%
    template = [1/9 1/9 1/9
                1/9  1/9  1/9
                1/9 1/9 1/9];
    img1 = myImageFilter(img0,template);
    imshow(img1), title('Convoluted');


    %%%%%%%% MyEdgeFilter Call%%%%%%%%%%%%%
    [Im Io Ix Iy] = myEdgeFilter(img0, 1); 
    figure, imshow(Im, []), title('Gradient magnitude');
    figure, imshow(Io, []), title('Gradient direction');
    figure, imshow(Ix, []), title('Directional gradient: X axis');
    figure, imshow(Iy, []), title('Directional gradient: Y axis');

    %%%%%%%% MyHarrisCorner Call%%%%%%%%%%%%%
     [Im Io Ix Iy] = myEdgeFilter(img0, 1); 
     [R] = myHarrisCorner(Ix, Iy , 0.009);
     figure, imshow(R, []), title('Corners');



    [RX, RY] = find(R == 1);
    imgOriginal =  (im2double(imread(imgPath)));
    imshow(imgOriginal), title('Superimposed');
    hold on;
    h = plot(RY,RX,'ro');

    saveas(h,strcat(imgPath,'_Harris.jpg'));
end