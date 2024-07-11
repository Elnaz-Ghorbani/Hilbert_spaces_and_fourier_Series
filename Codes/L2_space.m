% Define the time vector
t = linspace(0, 1, 1000);

% Define basis functions
phi1 = sqrt(2) * sin(2*pi*5*t);
phi2 = sqrt(2) * sin(2*pi*10*t);

% Plot the basis functions
figure;
plot(t, phi1, 'r', 'DisplayName', 'phi_1 = sqrt(sin(2\pi 5t))');
hold on;
plot(t, phi2, 'b', 'DisplayName', 'phi_2 = sqrt(sin(2\pi 10t))');
legend;
title('Basis Functions in L^2 Space');
xlabel('Time');
ylabel('Function Value');
