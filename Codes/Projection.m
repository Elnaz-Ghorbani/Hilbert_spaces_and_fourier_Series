% Define the time vector
t = linspace(0, pi/6, 1000);

% Define the original function (a sum of sines)
f = sin(2*pi*5*t) + sin(2*pi*10*t);

% Define the basis functions (orthonormal basis for the subspace)
phi1 = sqrt(2) * sin(2*pi*5*t);
phi2 = sqrt(2) * sin(2*pi*10*t);

% Calculate the coefficients (inner products)
c1 = trapz(t, f .* phi1);
c2 = trapz(t, f .* phi2);

% Construct the projection
projection = c1 * phi1 + c2 * phi2;

% Plot the original function and its projection
figure;
plot(t, f, 'r', 'DisplayName', 'Original Function');
hold on;
plot(t, projection, 'b', 'DisplayName', 'Projection');
legend;
title('Orthogonal Projection in L^2 Space');
xlabel('Time');
ylabel('Function Value');
