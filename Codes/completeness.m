% Define the time vector
t = linspace(0, 1, 1000);

% Define the original function (a square wave)
f = square(2*pi*5*t);

% Initialize the approximation
approx = zeros(size(t));

% Number of terms in the Fourier series
N = 50;

% Initialize a vector to store the error at each step
errors = zeros(1, N);

% Calculate the Fourier series approximation
for k = 1:N
    approx = approx + (2/pi) * (1 - (-1)^k) / k * sin(2*pi*k*5*t);
    
    % Calculate the error (L2 norm of the difference)
    errors(k) = sqrt(trapz(t, (f - approx).^2));
end

% Plot the original function and its Fourier approximation
figure;
plot(t, f, 'r','LineWidth', 1.5, 'DisplayName', 'Original Function');
hold on;
plot(t, approx, 'b-', 'DisplayName', ['Fourier Approximation (N=', num2str(N), ')']);
legend;
title('Fourier Series Approximation Convergence');
xlabel('Time');
ylabel('Function Value');

% Plot the error as a function of the number of terms
figure;
plot(1:N, errors, 'b-o');
title('Convergence of Fourier Series');
xlabel('Number of Terms');
ylabel('L2 Norm of Error');
grid on;
