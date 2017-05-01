function[dataStore] = motionControl(CreatePort,SonarPort,BeaconPort,tagNum,maxTime)
% backupBump: simple example program to use with iRobot Create (or simulator).
% Reads data from sensors, makes the robot hit, backup, move forward, and saves a datalog.
%
%   dataStore = TURNINPLACE(CreatePort,SonarPort,BeaconPort,tagNum,maxTime) runs
%
%   INPUTS
%       CreatePort  Create port object (get from running RoombaInit)
%       SonarPort   Sonar port object (get from running RoombaInit)
%       BeaconPort  Camera port object (get from running RoombaInit)
%       tagNum      robot number for overhead localization
%       maxTime     max time to run program (in seconds)
%
%   OUTPUTS
%       dataStore   struct containing logged data

%
%   NOTE: Assume differential-drive robot whose wheels turn at a constant
%         rate between sensor readings.
%
%   Cornell University
%   MAE 5180: Autonomous Mobile Robots
% Owen Hua
% Set unspecified inputs
if nargin < 1
    disp('ERROR: TCP/IP port object not provided.');
    return;
elseif nargin < 2
    SonarPort = CreatePort;
    BeaconPort = CreatePort;
    tagNum = CreatePort;
    maxTime = 500;
elseif nargin < 3
    BeaconPort = CreatePort;
    tagNum = CreatePort;
    maxTime = 500;
elseif nargin < 4
    tagNum = CreatePort;
    maxTime = 500;
elseif nargin < 5
    maxTime = 500;
end


% declare dataStore as a global variable so it can be accessed from the
% workspace even if the program is stopped

global dataStore
% initialize datalog struct (customize according to needs)
dataStore = struct('truthPose', [],...
    'odometry', [], ...
    'lidar', [], ...
    'sonar', [], ...
    'bump', [], ...
    'beacon', []);


% Variable used to keep track of whether the overhead localization "lost"
% the robot (number of consecutive times the robot was not identified).
% If the robot doesn't know where it is we want to stop it for
% safety reasons.
noRobotCount = 0;
% Define used variables
i = 1;
firstbeacon = 0;
maxTime = 500;
switchTime = 12;
robotRad = 0.3;
threshold = 0.2;
beaconCount = 0;
beaconEvoke = 0;
convergeFlag = 0;
closeEnough = 0.2;
m = 1;%wayPointsCount
VisitedW = [];
VisitedECW = [];
% load map
load('ExampleMap1.mat')
% map = cornerMap;
xverts = [map(:,1),map(:,3)];
yverts = [map(:,2),map(:,4)];
xmax = max(xverts(:));
xmin = min(xverts(:));
ymax = max(yverts(:));
ymin = min(yverts(:));
figure;
hold on
plotmap(map)
tic
while toc < maxTime
    %%%%%%%%%%%%%%%%%%%%%%%%Step 1: Read Sensor Data%%%%%%%%%%%%%%%%%%%%%%%
    [noRobotCount,dataStore]=readStoreSensorData(CreatePort,SonarPort,BeaconPort,tagNum,noRobotCount,dataStore);
    %%%%%%%%%%%%%%%%%%%%%%%%Step 2: Find Robot initial Position%%%%%%%%%%%%
    Time = toc;
    % Use PF to find the robot initial position, and use other methods
    % after the particles converge
    if Time < switchTime
        % Particle Filter Initialization
        if i == 1
            num_p = 500;
            % %         Use truthPose to sample particles
            %                 xi = ones(1,num_p)*dataStore.truthPose(i,2);
            %                 yi = ones(1,num_p)*dataStore.truthPose(i,3);
            %                 thetai = ones(1,num_p)*dataStore.truthPose(i,4);
            %                 wt = rand(1,num_p);
            % Sample Particles at the waypoints
            xi = [];yi = [];thetai = [];
            for p = 1:size(waypoints,1)
                xp = ones(1,num_p)*waypoints(p,1);
                yp = ones(1,num_p)*waypoints(p,2);
                thetap = rand(1,num_p)*2*pi;
                xi = [xi xp];
                yi = [yi yp];
                thetai = [thetai thetap];
            end
            wt = rand(1,num_p*size(waypoints,1));
            PSet0 =[xi;yi;thetai;wt];
            dataStore.initialParticles = PSet0;
        end
        % Use Particle Filter to find the initial position of robot
        dataStore.particles = particleFilter(PSet0,dataStore.sonar(end,2:4)',...
            [dataStore.odometry(end,2),dataStore.odometry(end,3)],@integrateOdom,@sonarPredict,map,[xmax xmin ymax ymin],switchTime);
        %Robot Localization Result if using the mean of all particles in PF
        robotPose(i,1) = mean(dataStore.particles(1,:));
        robotPose(i,2) = mean(dataStore.particles(2,:));
        robotPose(i,3) = mean(dataStore.particles(3,:));
        Pset = dataStore.particles;
        % Plot the particle set
        h = plot(dataStore.particles(1,:),dataStore.particles(2,:),'bo');
        pause(0.001)
        set(h,'Visible','off')
        % Control for initialization
        wheel2Center = 0.13;
        maxV = 0.2;
        cmdV = 0.1;
        cmdW = 0.2;
        FWDVEL = cmdV;
        ANGVEL = cmdW;
        [cmdV,cmdW] = limitCmds(FWDVEL,ANGVEL,maxV,wheel2Center);
    else % Robot Initial position is converged
        
        if convergeFlag == 0
            % PathPlanning after converging
            SetFwdVelAngVelCreate(CreatePort, 0,0 );
            Paths = globalPathFindingPRM(map,waypoints,ECwaypoints,robotPose(end,1:2),robotRad);
            PG = plot(Paths(:,1),Paths(:,2),'hk-');
            convergeFlag = NaN;
        end
        %%%%%%%%%%%%Step 3: Use Dead Reckoning to do localization based on the
        %result from previous localization data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [robotDRL,~] = integrateOdom(robotPose(end,:), dataStore.odometry(end,2), dataStore.odometry(end,3));
        robotDRL = robotDRL'; % [3X1] to [1x2]
        %%%%%%%%%%%%Step 4: Use PF to do localization%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        dataStore.particles = particleFilter(PSet0,dataStore.sonar(end,2:4)',...
            [dataStore.odometry(end,2),dataStore.odometry(end,3)],@integrateOdom,@sonarPredict,map,[xmax xmin ymax ymin],switchTime);
        %Robot Localization Result if using the mean of all particles in PF
        robotPFL(1,1) = mean(dataStore.particles(1,:));
        robotPFL(1,2) = mean(dataStore.particles(2,:));
        robotPFL(1,3) = mean(dataStore.particles(3,:));
        Pset = dataStore.particles;
        % Plot the particle set
        h = plot(PSet0(1,:),PSet0(2,:),'yo');
        pause(0.001)
        set(h,'Visible','off')
        %%%%%%%%%%%%Step 5: Check Optional Wall%%%%%%%%%%%%%%%
        smlegh = rbtPoseCompre(robotDRL(1:2),robotPFL(1:2),threshold);
        robotPose(i,:) = robotPFL;
%         SetFwdVelAngVelCreate(CreatePort, 0,0 );
        [optWalls, map, UpdateMapFlag] = CheckOptWalls(robotPose(end,:), map, optWalls, dataStore.sonar(end,2:4));
        disp(UpdateMapFlag)
        if UpdateMapFlag == 1;
            set(PG,'Visible','off')
            plotmap(map)
            % Path Planning once the map is updated
            SetFwdVelAngVelCreate(CreatePort, 0,0 );
            Paths = globalPathFindingPRM(map,waypoints,ECwaypoints,robotPose(end,1:2),robotRad);
            PG = plot(Paths(:,1),Paths(:,2),'hk-');
        end
        %         %%%%%%%%%%%%%%%%Step 6: EKF beacon%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %         if beaconCount < size(dataStore.beacon,1) && beaconEvoke == 1
        %             SetFwdVelAngVelCreate(CreatePort, 0,0 );
        %             beaconCount = size(dataStore.beacon,1);
        %             % Use the prediction from deadreckoning
        %             mu0 = robotDRL;
        %             %             sigma0 = [cov(PSet0(1,:)),0,0;
        %             %                 0,cov(PSet0(2,:)),0,;
        %             %                 0,0,cov(PSet0(3,:))];
        %             sigma0(:,:,1) = [0.05,0,0;
        %                 0,0.05,0;
        %                 0,0,0.1];
        %             zt = [dataStore.beacon(end,5),-dataStore.beacon(end,3)];
        %             ut = [dataStore.odometry(end,2),dataStore.odometry(end,3)];
        %             R = eye(3)*0.01;
        %             Q = eye(3)*0.001;
        %             g = @integrateOdom;
        %             G = @GjacDiffDrive;
        %             H = @HjacBeacon;
        %             h = @hBeacon;
        %             [mu,~] = extendedKalmanFilterBeacon(mu0,sigma0,zt,ut,Q,R,g,G,h,H,map,dataStore.beacon(end,2),beaconLoc);
        %             [Pset] = PsetGenerator(mu, num_p*size(waypoints,1), [0.5 0.05 0.1]);
        %             robotPose(i,:) = mu;
        %             h = plot(Pset(1,:),Pset(2,:),'yo');
        %             pause(0.0001)
        %             set(h,'Visible','off')
        %         end
        %         % Evoke beacon localization for next round
        %         if beaconEvoke == 0
        %             beaconCount = size(dataStore.beacon,1);
        %             beaconEvoke = 1;
        %         end
        %%%%%%%%%%%%%%%%Step 7: Path Planning and Map Info Updates%%%%%%%%%
        % CONTROL FUNCTION (send robot commands based on the result from path planning)
        SetFwdVelAngVelCreate(CreatePort, 0,0 );
        
        xb = robotPose(end,1);
        yb = robotPose(end,2);
        if UpdateMapFlag == 0
            distance = sqrt((Paths(m,1)-xb)^2+(Paths(m,2)-yb)^2);
            if distance <closeEnough && m == size(Paths,1)
                break
            end
            if distance < closeEnough
                m = m+1;
            end
            Vx = Paths(m,1)-xb;
            Vy = Paths(m,2)-yb;
            % Set angular velocity
            epsilon = 0.2;
            theta = robotPose(end,3);
            [V,w] = feedbackLin(Vx,Vy,epsilon,theta);
            FWDVEL = V;
            ANGVEL = w;
            [cmdV,cmdW] = limitCmds(FWDVEL,ANGVEL,maxV,wheel2Center);
        else
            m = 1;
            distance = sqrt((Paths(m,1)-xb)^2+(Paths(m,2)-yb)^2);
            if distance <closeEnough && m == size(Paths,1)
                break
            end
            if distance < closeEnough
                m = m+1;
            end
            Vx = Paths(m,1)-xb;
            Vy = Paths(m,2)-yb;
            % Set angular velocity
            epsilon = 0.2;
            theta = robotPose(end,3);
            [V,w] = feedbackLin(Vx,Vy,epsilon,theta);
            FWDVEL = V;
            ANGVEL = w;
            [cmdV,cmdW] = limitCmds(FWDVEL,ANGVEL,maxV,wheel2Center);
        end
    end
    % Update Particle set for the next round
    PSet0 = Pset;
    % Plot the current prediction
    Ga = plot(robotPose(end,1),robotPose(end,2),'kx');
    % Plot to compare the truthPose
    plot(dataStore.truthPose(end,2),dataStore.truthPose(end,3),'og')
    % if overhead localization loses the robot for too long, stop it
    if noRobotCount >= 3
        SetFwdVelAngVelCreate(CreatePort, 0,0);
    elseif dataStore.bump(end,2) == 1 || dataStore.bump(end,3) == 1 || dataStore.bump(end,7) == 1
        travelDist(CreatePort,cmdV,-0.1);
        speed = 0.2;
        Angle = 70;
        turnAngle(CreatePort, speed, Angle);
    else
        SetFwdVelAngVelCreate(CreatePort, cmdV, cmdW );
    end
    pause(0.1);
    
    i = i + 1;
    % Check whether the waypoints and ECwaypoints are close enough to the robot
    [VisitedW,VisitedECW,VisitedWFlag,VisitedECWFlag,waypoints,ECwaypoints] = WaypointsCheck(robotPose(end,:),waypoints,ECwaypoints,closeEnough,VisitedW,VisitedECW);
    SetFwdVelAngVelCreate(CreatePort, 0,0 );
    disp(waypoints)
    if VisitedWFlag == 1
        BeepRoomba(CreatePort)
        plot(VisitedW(end,1),VisitedW(end,2),'pk','LineWidth',3)
    end
    if VisitedECWFlag == 1
        BeepRoomba(CreatePort)
        BeepRoomba(CreatePort)
        plot(VisitedW(end,1),VisitedW(end,2),'py','LineWidth',3)
    end
    set(Ga,'Visible','off')
end
dataStore.robotPose = robotPose;
plot(robotPose(end,1),robotPose(end,2),'mo','MarkerSize',5,'LineWidth',5)
hold off
SetFwdVelAngVelCreate(CreatePort, 0,0 );
