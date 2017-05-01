function[mu,sigma] = extendedKalmanFilter_chenji(measurementFun,measurementJac,measurementActual,robotPoseMu,robotPoseSigma,controlInput,R,Q,map)
%   extendedKalmanFilter: prediction and update of the EKF 
% 
%   INPUTS
%       measurementFun   measurement function you choose to do EKF
%       measurementJac   the Jacobian matrix you choose according to the
%       measurement function
%       robotPoseMu      mean value of robot pose at time t-1
%       robotPoseSigma   covariance value of robto pose at time t-1
%       controlInput     the input using odometry info
%       R                process noise covariance matrix
%       Q                sensor noise covariance matrix
%       map              map.mat file
% 
%   OUTPUTS
%       robotPoseNew     a structure with mean value and covariance inside
%       at time t
% 
% 
%   Cornell University
%   MAE 4180/5180 CS 3758: Autonomous Mobile Robots
%   Homework 4
%   Chen, Ji

n = length(robotPoseMu);

dis = controlInput(1);
phi = controlInput(2);

% prediction
robotPoseMuBar = integrateOdom_cj(robotPoseMu,dis,phi);
Gt = GjacDiffDrive_cj(robotPoseMu,dis,phi);
robotPoseSigmaBar = Gt*robotPoseSigma*Gt'+R;

% take out NaN in actual measurements
ind = find(measurementActual<inf);
measurementUse = measurementActual(ind);

% find the right dimension of Q
Quse = Q(ind,ind);

% expeced measurements
measurementExp = feval(measurementFun,robotPoseMuBar,map);
measurementExpUse = measurementExp(ind);
% measurement jacobian matrix
Ht = feval(measurementJac,robotPoseMuBar,map);
HtUse = Ht(ind,:);



K = robotPoseSigmaBar*HtUse'/(HtUse*robotPoseSigmaBar*HtUse'+Quse);
mu = robotPoseMuBar+K*(measurementUse-measurementExpUse);
sigma = (eye(n)-K*HtUse)*robotPoseSigmaBar;

end
