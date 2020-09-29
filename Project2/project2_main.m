load('Subject4-Session3-Take4_mocapJoints.mat');


%%%% The following example code parses in the x,y,z coordinates
%%%% for frame 1000. The coordinates are an array of 12 numbers
%%%% that each correspond to a joint number, the last array is the
%%%% confidence values of each of the joints

mocapFnum = 1000; %mocap frame number 1000
x = mocapJoints(mocapFnum,:,1); %array of 12 X coordinates
y = mocapJoints(mocapFnum,:,2); % Y coordinates
z = mocapJoints(mocapFnum,:,3); % Z coordinates
conf = mocapJoints(mocapFnum,:,4); %confidence values

%%%%%%%

