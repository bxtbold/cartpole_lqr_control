function drawanimation(state,L)
x = state(1);   % displacement
th = state(3);  % angle

% dimensions
W = 1;          % cart width
H = .5;         % cart height
mr = .3;        % mass radius

% positions
y = 0;          % cart vertical position
px = x + L*sin(th);     % pendulum x
py = y - L*cos(th);     % pendulum y

plot([-10 10],[0 0],'w','LineWidth',2), hold on;
rectangle('Position',[x-W/2,y-H/2,W,H],'FaceColor',[.5 0.5 1],'LineWidth',2) % Draw cart
plot([x px],[y py],'k','LineWidth',2); % Draw pendulum
rectangle('Position',[px-mr/2,py-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 1 .1],'LineWidth',1.5);

axis([-3 3 -2 2]);, axis equal
grid on;
drawnow, hold off