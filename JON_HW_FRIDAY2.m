clear all;
close all;

% create a cube of 200s
n = 200;

% creating a 3D matrix that is 200x200x200
I = zeros(n,n,n);

% define x as a 1D plane within I
x = 1:1:n;

% divide by 20 to get slices to 0.05cm 
x = x/20;

% **I'm not sure what this step is for**
x = x - 2.5;


% define range of each axes and dividing incriment 
x = -5:0.05:5-0.05;
y = x;
z = x;

[X,Y,Z] = meshgrid(x,y,z);

% I = some change to I

distance = sqrt(X.^2+Y.^2+Z.^2);

% everything in this dimension ":" colon
slice = distance(:,1,:);

imagesc(squeeze(slice));

% assign a value of 1 to every 
I(distance<5) = 1;

% making sure there IS in fact a sphere in my cube...haha. 
imagesc(squeeze(I(:,5,:)));

% select ideal slices
ideal_x = I(50,:,:);
ideal_y = I(:,50,:);
ideal_z = I(:,:,50);

% label ten 0.05cm slices to be concatenated into one 0.5cm slice
s_1 = I(95,:,:);
s_2 = I(96,:,:);
s_3 = I(97,:,:);
s_4 = I(98,:,:);
s_5 = I(99,:,:);
s_6 = I(100,:,:);
s_7 = I(101,:,:);
s_8 = I(102,:,:);
s_9 = I(103,:,:);
s_10 = I(104,:,:);


% integrate = take the sum over the range
% Concatenate the images together?

cat(1,s_1,s_2,s_3,s_4,s_5,s_6,s_7,s_8,s_9,s_10);

integrated_slice = cat(1,s_1,s_2,s_3,s_4,s_5,s_6,s_7,s_8,s_9,s_10);

imagesc(integrated_slice);

publish('JON_HW_FRIDAY2.m','pdf')

