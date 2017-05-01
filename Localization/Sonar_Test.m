%test sonar preditc and sonar data
global dataStore
num = size(dataStore.truthPose,1);
range = zeros(3,num);
for i = 1:num
[range(:,i)] = sonarPredict(dataStore.truthPose(i,2:4)');
end
figure(1)
plot(1:num,range(1,:),1:num,range(2,:),1:num,range(3,:))
legend('left','front','right')
axis([0,300,0,12])
figure(2)
plot(1:num,dataStore.sonar(:,2),1:num,dataStore.sonar(:,3),1:num,dataStore.sonar(:,4))
legend('left','front','right')
axis([0,300,0,12])