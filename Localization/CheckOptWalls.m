function [OptWalls, map, UpdateMapFlag] = CheckOptWalls(robotPose, map, OptWalls, SonarReadings)
% CheckOptWalls: check the existance of optional walls
%
%
%   INPUTS
%       robotPose: robot's [x,y,theta] in global coordinates
%       map: a matrix(NX4) which has the vertices of the known walls [x1,y1,x2,y2]
%       OptWalls: a matrix(NX4) which has the vertices of the linear wall
%       [x1,y1,x2,y2]
%       SonarReadings: [R,F,L] Three readings from the right, front and left
%       sonar
%
%   OUTPUTS
%       NewWall: either NaN or the detected new wall
%
%
%   Cornell University
%   MAE 4180/5180 CS 3758: Autonomous Mobile Robots
%   Final Project
%   Yiwen Hua
robotrad = 0.2;
SonarOrien = [-pi/2,0,pi/2];
SonarRange = 3.5;
UpdateMapFlag = 0;
DetectThresh = 0.1;
optWallInd = [];
% Find the sonar coordinates in glocal
% RightSonarCoords = robot2global(robotPose,[cos(SonarOrien(1)*robotrad) sin(SonarOrien(1)*robotrad)]);
% RightSonarRange = robot2global(robotPose,[cos(SonarOrien(1))*(robotrad+SonarRange) sin(SonarOrien(1))*(robotrad+SonarRange)]);
% FrontSonarCoords = robot2global(robotPose,[cos(SonarOrien(2)*robotrad) sin(SonarOrien(2)*robotrad)]);
% FrontSonarRange = robot2global(robotPose,[cos(SonarOrien(2))*(robotrad+SonarRange) sin(SonarOrien(2))*(robotrad+SonarRange)]);
% LeftSonarCoords = robot2global(robotPose,[cos(SonarOrien(3)*robotrad) sin(SonarOrien(3)*robotrad)]);
% LeftSonarRange = robot2global(robotPose,[cos(SonarOrien(3))*(robotrad+SonarRange) sin(SonarOrien(3))*(robotrad+SonarRange)]);
for i = 1:length(SonarOrien)
    % For three sonar, loop through each of them
    SonarCoords = robot2global(robotPose,[cos(SonarOrien(i)*robotrad) sin(SonarOrien(i)*robotrad)]);
    SonarEnd = robot2global(robotPose,[cos(SonarOrien(i))*(robotrad+SonarRange) sin(SonarOrien(i))*(robotrad+SonarRange)]);
    for j = 1:size(OptWalls,1)
        [isectvisible,x,y,~]= intersectPoint(SonarCoords(1),SonarCoords(2),SonarEnd(1),SonarEnd(2),OptWalls(j,1),OptWalls(j,2),OptWalls(j,3),OptWalls(j,4));
        if isectvisible == 1
            for k = 1:size(map,1)
                [isectcollision,~,~,~] = intersectPoint(SonarCoords(1),SonarCoords(2),SonarEnd(1),SonarEnd(2),map(k,1),map(k,2),map(k,3),map(k,4));
                if isectcollision == 1
                    break
                end
            end
            if isectcollision == 0
                Dist = findDist(SonarCoords(1),SonarCoords(2),x,y);
                if abs(Dist-SonarReadings(i)) < DetectThresh
                    map = [map;OptWalls(j,:)];
                    optWallInd = [optWallInd, j];
                    UpdateMapFlag = 1;
                end
            end
        end
    end
end
OptWalls(optWallInd,:) = [];
end

