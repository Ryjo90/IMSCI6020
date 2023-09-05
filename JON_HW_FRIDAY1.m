clear all;
close all;

% create a cube of 100s
n = 100;

% creating a 3D matrix that is 100x100x100
I = zeros(n,n,n);

% define x as a 1D plane within I
x = 1:1:n;

% divide by 10 to get slices to 0.1cm 
x = x/10;

% **I'm not sure what this step is for**
x = x - 5;

% define range of each axes and dividing incriment 
x = -5:0.1:5-0.1;
y = x;
z = x;

[X,Y,Z] = meshgrid(x,y,z);

% I = some change to I **hint

% assigning distance formula to variable 'distance'
distance = sqrt(X.^2+Y.^2+Z.^2);

% everything in this dimension ":" colon
slice = distance(:,1,:);

imagesc(squeeze(slice));

% assign a value of 1 to every point less than 2.5 (cm) from the center.
% 2.5 is the radius of the sphere
I(distance<2.5) = 1;

% create the mask
mask = I(distance<2.5);

% making sure there IS in fact a sphere in my cube...haha. 
imagesc(squeeze(I(:,5,:)));

% select ideal slices. Dummy variablesm matrix I accessed at these points.
ideal_x = I(50,:,:);
ideal_y = I(:,50,:);
ideal_z = I(:,:,50);

%create the slice that is offset 2.4cm in the z direction
offset_slice = I(:,:,74);

%display offset slice
imagesc(squeeze(offset_slice));

publish('JON_HW_FRIDAY1.m','pdf');

