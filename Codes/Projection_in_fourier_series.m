% Define the time vector
t = linspace(0, 1, 1000); % Time from 0 to 1 second, 1000 points

% Define the original function (a square wave)
f = square(2*pi*5*t); % 5 Hz square wave

% Define the period
T = 1;

% Number of terms in the Fourier series
N = 10;

% Initialize the Fourier series approximation
fourier_approx = zeros(size(t));

% Initialize the direct projection approximation
direct_projection = zeros(size(t));

% Calculate the DC component (mean of the function)
a0 = (2/T) * trapz(t, f); % DC component (mean of the function)
fourier_approx = fourier_approx + a0 / 2; % Add the DC component to the approximation

% Calculate the Fourier coefficients and accumulate the projection
for n = 1:N
    % Define the basis functions
    cosine_basis = cos(2*pi*n*t/T);
    sine_basis = sin(2*pi*n*t/T);
    
    % Calculate the Fourier coefficients using inner product (projection)
    an = (2/T) * trapz(t, f .* cosine_basis);
    bn = (2/T) * trapz(t, f .* sine_basis);
    
    % Accumulate the Fourier series approximation
    fourier_approx = fourier_approx + an * cosine_basis + bn * sine_basis;
    
    % Directly project the function onto the current basis functions
    direct_projection = direct_projection + an * cosine_basis + bn * sine_basis;
end

% Plot the original function
figure;
plot(t, f, 'r', 'DisplayName', 'Original Function');
hold on;

% Plot the Fourier series approximation
plot(t, fourier_approx, 'b', 'DisplayName', ['Fourier Series Approximation (N=', num2str(N), ')']);

% Plot the direct projection approximation
plot(t, direct_projection, 'g--', 'DisplayName', ['Direct Projection (N=', num2str(N), ')']);

% Add legend and labels
legend;
title('Comparison of Fourier Series Approximation and Direct Projection');
xlabel('Time');
ylabel('Function Value');
hold off;
