
clc;
clear all;
sample=[];
maindir = '/Users/lijingya/Desktop/mathematics_project/CroppedYale/';
subdir =  dir( maindir );
for i = 1 : length( subdir )
    if( isequal( subdir( i ).name, '.' ) || ...
        isequal( subdir( i ).name, '..' ) || ...
        ~subdir( i ).isdir ) 
        continue;
    end

    subdirpath = fullfile( maindir, subdir( i ).name, '*.pgm' );
    images = dir( subdirpath );  
    for j = 1 : length( images )
        imagepath = fullfile( maindir, subdir( i ).name, images( j ).name  );
        img_data = imread( imagepath ); 
        b = img_data(1:122*92);
        sample=[sample;b];
    end
end
imshow(mat2gray(reshape(X(1,:),112,92)));



