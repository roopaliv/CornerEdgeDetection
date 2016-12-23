function [img1] = myImageFilter(img0, h) 
if(ischar(img0))
    img =  (im2double(imread(img0)));
    if(size(img,3) ==3)
        img =  rgb2gray(img);
    end
else
  img = img0;
end
h = flip(h);
[imageRows, imageColumns]=size(img);
[maskRows, maskColumns]=size(h);
maskCenterColumns = ceil(maskColumns / 2);
maskCenterRows = ceil(maskRows / 2); 
 for IR=1:imageRows
    for IC=1:imageColumns
         pixel = 0;
          for MR=1:maskRows
             for MC=1:maskColumns
                rowDispFromCenter = maskCenterRows - MR;
                colDispFromCenter = maskCenterColumns - MC;
                rowAtHand = IR - rowDispFromCenter;
                colAtHand = IC - colDispFromCenter;
                if( rowAtHand > 0 && rowAtHand <= imageRows && colAtHand > 0 && colAtHand <= imageColumns )
                    pixel = pixel + (img(rowAtHand,colAtHand)*h(MR,MC));
                end
             end
          end  
          img1(IR,IC) = double(pixel);
    end
 end
end 