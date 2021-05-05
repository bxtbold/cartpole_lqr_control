%% 최신제어공학 실습 3 
% 2021.4.12
% 20181185 배트볼드 
% CartPole

% Reference book: Data-Driven Science and Engineering: Machine Learning, Dynamical Systems, and Control by Steven L. Brunton

function main()
    clear all;
    close all;
    %clc;

    %% Parameters
    m = 1.0;            % mass of pole
    M = 10.0;           % mass of cart
    L = 1.0;            % lenth of link
    dt = 0.1;           % time step
    trange = 0:dt:5;    % time array from 0 to 5
    g = 9.81;           % gravitational acceleration

    %% Initial value
    x0 = [0; 0; (-10+180)*pi/180; 0];

    %% Design Full-State Feedback Control
    A = [0 1 0 0
         0 0 -m*g/M 0
         0 0 0 1
         0 0 -(M+m)*g/M/L 0];

    B = [0; 1/M; 0; 1/M/L];

    C = ctrb(A,B);          % controllability matrix
    rank(C);                % checking controllability
    P = [-1 -2 -3 -4];      % pole placement / desired poles
    K = place(A,B,P);       % K matrix

    %% finding state and time array
    [t,y] = ode45(@(t,y)pendcart(y,m,M,L,g,-K*(y-[0; 0; pi; 0])),trange,x0);
    %% Animation
    %video = VideoWriter('CartPole_20181185_Batbold.mp4','MPEG-4');
    %open(video)
    
    
    
    %for i=1:length(t)
    %    drawanimation(y(i,:),L);
    %    F=getframe(gcf);
    %    writeVideo(video,F);
    %end
    %% Plotting
    x = y(:,1);
    th = y(:,3);
    
    figure(1);
    subplot(211); plot(t,x);grid on;xlabel('time (s)');ylabel('displacement (m)');
    subplot(212); plot(t,-(th*180/pi - 180));grid on;xlabel('time (s)');ylabel('degree');


