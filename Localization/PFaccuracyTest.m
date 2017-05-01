% Test the accuracy of the particle filter
global dataStore
figure
xdiff = abs(dataStore.truthPose(:,2)-dataStore.robotPose(:,1));
ydiff = abs(dataStore.truthPose(:,3)-dataStore.robotPose(:,2));
Diff = xdiff+ydiff;
plot(dataStore.truthPose(:,1),Diff,'.-')