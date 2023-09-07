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

x = x - 5;

% define range of each axes and dividing incriment 
x = -5:0.1:5-0.1;
y = x;
z = x;

[X,Y,Z] = meshgrid(x,y,z);

% I = some change to I **Jon's hint

% assigning distance formula to variable 'distance'
distance = sqrt(X.^2+Y.^2+Z.^2);

% everything in this dimension ":" colon
slice = distance(:,1,:);

imagesc(squeeze(slice));
%% 

% assign a value of 1 to every point less than 2.5 (cm) from the center.
% 2.5 is the radius of the sphere
I(distance<2.5) = 1;

% create the mask
mask = I(distance<2.5);

% making sure there IS in fact a sphere in my cube...haha. 
imagesc(squeeze(I(:,50,:)));
%% 

% select ideal slices. Dummy variablesm matrix I accessed at these points.
ideal_x = I(50,:,:);
ideal_y = I(:,50,:);
ideal_z = I(:,:,50);

%create the slice that is offset 2.4cm in the z direction
offset_slice = I(:,:,74);

%display offset slice
imagesc(squeeze(offset_slice));
%% 

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


x = x - 2.5;


% define range of each axes and dividing incriment 
x = -5:0.05:5-0.05;
y = x;
z = x;

[X,Y,Z] = meshgrid(x,y,z);

% I = some change to I **Jon's hint

distance = sqrt(X.^2+Y.^2+Z.^2);

% everything in this dimension ":" colon
slice = distance(:,1,:);

imagesc(squeeze(slice));
%% 

% assign a value of 1 to every 
I(distance<5) = 1;

% making sure there IS in fact a sphere in my cube...haha. 
imagesc(squeeze(I(:,100,:)));

% select ideal slices
ideal_x = squeeze(I(50,:,:));
ideal_y = squeeze(I(:,50,:));
ideal_z = squeeze(I(:,:,50));

% create an empty slice in the middle. What I don't understand about this
% part is that giving three coordinates (x,y,z) gives us a point right? Not
% a slice? 
sample_s = I(100,100,100);

% integrate = take the sum over the range. This step takes my 10 2-D slices
% and combines them into one "3-D" slice. Is that right?
for ryans_loop = 95:104 % my 10 slices
    sample_s = sample_s + squeeze(I(ryans_loop,:));

end
%% 

% I understand the point here (creating a 5cm-wide range around the middle)
% but how do I plug this into MATLAB? 
bottom_index = 97.5;
top_index = 102.5;


max_val = max(sample_s, [], "all");
threshold = .25;
thresholded_slice1 = imbinarize(sample_s,threshold);
imagesc(squeeze(thresholded_slice1))
%% 

max_val = max(sample_s, [], "all");
threshold = .5;
thresholded_slice2 = imbinarize(sample_s,threshold);
imagesc(squeeze(thresholded_slice2))
%% 

max_val = max(sample_s, [], "all");
threshold = .75
thresholded_slice3 = imbinarize(sample_s,threshold);
imagesc(squeeze(thresholded_slice3))
%% 


%  Are you able to recover the “true” (ideal zero 
% thickness) slice? (5) 
% Since we just went +/- 2.5 cm from the ideal slice, wouldn't the original
% "true" slice just be the center of our concatenated slice? 
