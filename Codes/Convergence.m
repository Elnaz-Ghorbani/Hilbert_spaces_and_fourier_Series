% Define the time vector
t = linspace(0, 1, 1000);

% Define the original function (a square wave)
f = square(2*pi*5*t);

% Initialize the approximation
approx = zeros(size(t));

% Number of terms in the Fourier series
N = 10;

% Calculate the Fourier series approximation
for k = 1:N
    approx = approx + (2/pi) * (1 - (-1)^k) / k * sin(2*pi*k*5*t);
end

% Plot the original function and its Fourier approximation
figure;
plot(t, f, 'r', 'DisplayName', 'Original Function');
hold on;
plot(t, approx, 'b', 'DisplayName', ['Fourier Approximation (N=', num2str(N), ')']);
legend;
title('Fourier Series Approximation');
xlabel('Time');
ylabel('Function Value');
