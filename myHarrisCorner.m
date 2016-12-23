function [R] = myHarrisCorner(Ix, Iy, threshold) 
k = 0.04;
[rows, columns]=size(Ix);
R=zeros(rows, columns);

Gaussian = fspecial('gaussian', [3 3], 5);
GIxx = myImageFilter((Ix.^2), Gaussian);
GIyy = myImageFilter((Iy.^2), Gaussian);
GIxy = myImageFilter((Ix.*Iy), Gaussian);
disp(rows);
disp(columns);

for iRow=1:rows
    for iCol=1:columns
        M = [double(GIxx(iRow, iCol)), double(GIxy(iRow, iCol));
            double(GIxy(iRow, iCol)), double(GIyy(iRow, iCol))];
        detM = det(M);
        traceM = trace(M);
        r = detM - (k * (traceM^2));
         if(r>threshold)
             R(iRow, iCol)=1;%black
         else
            R(iRow,iCol) = 0; %white
        end
    end
end
end 