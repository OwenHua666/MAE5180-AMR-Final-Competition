

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%  EKF SONAR PART - RIGHT INIT POSE %%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %load('sonarEKF5B_Odom0,1Son0,0316.mat')
% %load('badData-DiffTraj.mat')
% %load('sonarEKF5B_R0,001_Q0,01.mat')
% load('owen_particle_500.mat')
% figure(5)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(125,2:end))
% plotCovEllipse([dataStore.ekfMu(125,2); dataStore.ekfMu(125,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with hSonar Starting at truthPose (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init (noMap)')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(125th pt)', 'Pose Covariance(end)')
% %plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(6)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(125,2:end))
% plotCovEllipse([dataStore.ekfMu(125,2); dataStore.ekfMu(125,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with hSonar with Map (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(125th pt)', 'Pose Covariance(end)')
% plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%  EKF SONAR PART WRONG INIT POSE %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% load('lc848_Lab2_ekfSonar_Q0,001_Run3_WrongInit.mat')
% figure(7)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(125,2:end))
% plotCovEllipse([dataStore.ekfMu(125,2); dataStore.ekfMu(125,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with hSonar at Wrong Init Pose [-1.5, -1, \pi/2] (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init (noMap)')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(125th pt)', 'Pose Covariance(end)')
% %plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(8)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(125,2:end))
% plotCovEllipse([dataStore.ekfMu(125,2); dataStore.ekfMu(125,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF hSonar w/Map at Wrong Init Pose [-1.5, -1, \pi/2]; (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(125th pt)', 'Pose Covariance(end)')
% plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%  EKF GPS PART CORRECT INIT POSE %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% load('lc848_Lab2_ekfGPS_Q0,001_Run4.mat')
% figure(9)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(50,2:end))
% plotCovEllipse([dataStore.ekfMu(50,2); dataStore.ekfMu(50,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with Noisy GPS (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init (noMap)')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(50th pt)', 'Pose Covariance(end)')
% %plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(10)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(50,2:end))
% plotCovEllipse([dataStore.ekfMu(50,2); dataStore.ekfMu(50,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with Noisy GPS w/Map (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(50th pt)', 'Pose Covariance(end)')
% plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%  EKF GPS PART WRONG INIT POSE %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% load('lc848_Lab2_ekfGPS_Q0,001_Run5_WrongInit.mat')
% figure(11)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(50,2:end))
% plotCovEllipse([dataStore.ekfMu(50,2); dataStore.ekfMu(50,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848 - eKF with Noisy GPS and Wrong Initial Pose [-1.5, -1, \pi/2]; (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init (noMap)')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(50th pt)', 'Pose Covariance(end)')
% %plotMap(labmap)
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(12)
% %plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'-', ...
% %    dataStore.truthPose(:,2), dataStore.truthPose(:,3), '--', ...
% %    dataStore.GPS(:,2), dataStore.GPS(:,3),'o' )
% plot(dataStore.ekfMu(:,2), dataStore.ekfMu(:,3),'b-', ...
%     dataStore.truthPose(:,2), dataStore.truthPose(:,3), 'r--', ...
%     dataStore.deadReck(:,2), dataStore.deadReck(:,3), 'k-.')
% 
% 
% % plotCovEllipse(Mu,P,Nsig,plotOpts,figHandle)
% endSig = vect2square(dataStore.ekfSigma(1,2:end))
% plotCovEllipse([dataStore.ekfMu(1,2); dataStore.ekfMu(1,3)], ...
%     endSig(1:2, 1:2), 1, ...
%     [{'color'},{'k'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% mid0Sig = vect2square(dataStore.ekfSigma(2,2:end))
% plotCovEllipse([dataStore.ekfMu(2,2); dataStore.ekfMu(2,3)], ...
%     mid0Sig(1:2, 1:2), 1, ...
%     [{'color'},{'m'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% midSig = vect2square(dataStore.ekfSigma(50,2:end))
% plotCovEllipse([dataStore.ekfMu(50,2); dataStore.ekfMu(50,3)], ...
%     midSig(1:2, 1:2), 1, ...
%     [{'color'},{'c'},{'linestyle'},{'-.'},{'linewidth'},{2}])
% 
% fSig = vect2square(dataStore.ekfSigma(end,2:end))
% plotCovEllipse([dataStore.ekfMu(end,2); dataStore.ekfMu(end,3)], ...
%     fSig(1:2, 1:2), 1, ...
%     [{'color'},{'g'},{'linestyle'},{'-.'},{'linewidth'},{2}])
%     
% hold on
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title('LC848-Noisy GPS EKF at Wrong Init Pose [-1.5,-1,\pi/2]; (R=0.01*I, Q=0.001*I)')
% %title('eKF utilizing hSonar with [-2, -1.5, \pi/2] Init')
% axis equal
% legend('LC848 - eKF with sonarPredict', 'truthPose', 'Dead Reckoning', ...
%     'Pose Covariance(1st)', 'Pose Covariance(2nd pt)', ...
%     'Pose Covariance(50th pt)', 'Pose Covariance(end)')
% plotMap(labmap)
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%  PARTICLE FILTER PART %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% PF20 = load('lc848_Lab2_PF_0,0,0.mat')
% setSize = 50;
% initX = PF20.dataStore.particles(1, 2:setSize+1)
% initY = PF20.dataStore.particles(1, setSize+2:((2*setSize)+1))
% initTh = PF20.dataStore.particles(1,((2*setSize)+2):((3*setSize)+1))
% 
% figure(1)
% hold on
% plot(initX, initY, 'g*')
% quiver(initX, initY, cos(initTh), sin(initTh), 0.5, 'g')
% hold on
% % plot(PF20.dataStore.truthPose(:, 2), PF20.dataStore.truthPose(:,3), 'r')
% % hold off
% % plotMap(labmap)
% % title('Initial Particle Set (20 Samples)')
% % xlabel('Global X Coordinate (m)')
% % ylabel('Global Y Coordinate (m)')
% % legend('Point', 'Heading', 'TruthPose')
% 
% lastX = PF20.dataStore.particles(end, 2:setSize+1)
% lastY = PF20.dataStore.particles(end, setSize+2:((2*setSize)+1))
% lastTh = PF20.dataStore.particles(end,((2*setSize)+2):((3*setSize)+1))
% 
% % figure(2)
% % hold on
% plot(lastX, lastY, 'bo')
% %quiver(lastX, lastY, cos(lastTh), sin(lastTh), 0.5, 'b')
% plot(PF20.dataStore.truthPose(:, 2), PF20.dataStore.truthPose(:,3), 'r')
% hold off
% plotMap(labmap)
% title(['LC848 PF - First and Last Particle Set (' num2str(setSize) ' Samples)'])
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% legend('Initial Particle Set', 'Initial Headings', 'Final Particle Set', 'TruthPose')
% 
% Xtrack = [];
% Ytrack =[];
% 
% figure(2)
% hold on
% for k=1:size(PF20.dataStore.particles, 1)
%     tempMat = [PF20.dataStore.particles(k,2:setSize+1)',...
%         PF20.dataStore.particles(k, setSize+2:((2*setSize)+1))', ...
%         PF20.dataStore.particles(k,((2*setSize)+2):((3*setSize)+1))', ...
%         PF20.dataStore.particles(end,((3*setSize)+2):((4*setSize)+1))'];
%     tempMat = sortrows(tempMat, 4)
%     %Xtrack(:, end+1) = tempMat(end-5:end, 1);
%     %Ytrack(:, end+1) = tempMat(end-5:end, 2);
%     Xtrack(:, end+1) = tempMat(1:6, 1);
%     Ytrack(:, end+1) = tempMat(1:6, 2);
%     setMean(k,:) = mean(tempMat, 1)
% end
% plot(PF20.dataStore.truthPose(:,2), PF20.dataStore.truthPose(:,3), 'r')
% plot(Xtrack(1,:), Ytrack(1,:), 'b-')
% %plot(Xtrack(2,:), Ytrack(2,:), 'r-')
% %plot(Xtrack(3,:), Ytrack(3,:), 'k-')
% %plot(Xtrack(4,:), Ytrack(4,:), 'g-')
% %plot(Xtrack(5,:), Ytrack(5,:), 'm-')
% %plot(Xtrack(6,:), Ytrack(6,:), 'c-')
% %plot(Xtrack(:, 1), Ytrack(:,1), 'ko')
% 
% plotMap(labmap)
% 
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% title(['LC848 PF - Highest Particle Tracking ('...
%     num2str(setSize) ' Samples)'])
% legend('Truth Pose', 'Highest Weighted Particle Track')
% % legend('Highest Weight Track', '2nd Highest Track', '3rd Highest Track', ...
% %     '4th Highest Track', '5th Highest Track', '6th Highest Track', ...
% %     'Initial Particle Seeds', 'Truth Pose')
% hold off
% 
% 
% figure(3)
% hold on
% plot(PF20.dataStore.truthPose(:, 2), PF20.dataStore.truthPose(:,3), 'r', 'LineWidth', 1)
% plot(setMean(:,1), setMean(:,2), 'b')
% hold off
% plotMap(labmap)
% title(['LC848 PF - Mean Particle Set Trajectory ('...
%     num2str(setSize) ' Samples)'])
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
% legend('Truth Pose', 'Mean Trajectory')
% 
% 
%%%%%%%%%%%%%%%%%%%%%% PLOTTING THE LAST THINGS %%%%%%%%%%%%%%%%%%%%%%%%%
%load('owen_particle_500.mat')
load('yejingwangLabPlot.mat')
clf
lastX = dataStore.particles(1,:);
lastY = dataStore.particles(2,:);


pdX = fitdist(lastX', 'Normal');
pdY = fitdist(lastY', 'Normal');

xLine = -1:0.02:1;
xLine = xLine + pdX.mu;
yLine = -1:0.02:1;
yLine = yLine + pdY.mu;
% xLine = 2:0.02:3;
% xLine = xLine + pdX.mu;
% yLine = -1:0.02:0;
% yLine = yLine + pdY.mu;

[xMesh, yMesh] = meshgrid(xLine, yLine);
xProb = pdf(pdX, xMesh);
yProb = pdf(pdY, yMesh);
totProb = xProb.*yProb;
totProb = totProb/(sum(sum(totProb)));

figure(13)
hold on
contour(xMesh, yMesh, totProb)
plot(lastX, lastY, '.k')
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
xlabel('x/m')
ylabel('y/m')
title('Single Gaussian Presentation with last Particle Set')
legend('Gaussian PDF','Final Particle Set')


%%%%%%%%%%%%%%%%%%%%%%% GM DISTRIBUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = [lastX', lastY'];
options = statset('Display','final');
obj = gmdistribution.fit(X,3,'Options',options);
%10 iterations, log-likelihood = -7046.78
figure(14)
hold on
plot(lastX, lastY, '.k')
%h = ezcontour(@(x,y)pdf(obj,[x y]),[-0.95 -0.8],[0.46 0.6]);
h = ezcontour(@(x,y)pdf(obj,[x y]),[2 3],[-1 0]);
title('Three-component Gaussian Presentation with last Particle Set')
legend('Gaussian PDF','Final Particle Set')
% xlabel('Global X Coordinate (m)')
% ylabel('Global Y Coordinate (m)')
xlabel('x/m')
ylabel('y/m')
legend('Final Particle Set','Three-Gaussian PDF')
hold off
