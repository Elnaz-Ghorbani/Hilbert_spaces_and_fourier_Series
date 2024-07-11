% Define the time vector
t = linspace(0, 1, 1000); % Time from 0 to 1 second, 1000 points

% Define the original function (a square wave)
f = square(2*pi*5*t); % 5 Hz square wave

% Define the period
T = 1;

% Number of terms in the Fourier series
N = 5;

% Initialize the Fourier series approximation and coefficients
c_n = zeros(1, N);
approx = zeros(size(t));

% Calculate the DC component (mean of the function)
a0 = (2/T) * trapz(t, f); % DC component (mean of the function)
approx = approx + a0 / 2; % Add the DC component to the approximation

% Initialize energy calculations
time_domain_energy = trapz(t, f.^2) / T;
frequency_domain_energy = (a0 / 2)^2;

% Calculate the Fourier coefficients and accumulate the projection
for n = 1:N
    % Define the basis functions
    cosine_basis = cos(2*pi*n*t/T);
    sine_basis = sin(2*pi*n*t/T);
    
    % Calculate the Fourier coefficients using inner product (projection)
    an = (2/T) * trapz(t, f .* cosine_basis);
    bn = (2/T) * trapz(t, f .* sine_basis);
    
    % Calculate the complex Fourier coefficient c_n
    c_n(n) = sqrt(an^2 + bn^2);
    
    % Accumulate the Fourier series approximation
    approx = approx + an * cosine_basis + bn * sine_basis;
    
    % Update the frequency domain energy
    frequency_domain_energy = frequency_domain_energy + an^2 + bn^2;
end

% Plot the original function and its Fourier series approximation
figure;
plot(t, f, 'r', 'DisplayName', 'Original Function');
hold on;
plot(t, approx, 'b', 'DisplayName', ['Fourier Series Approximation (N=', num2str(N), ')']);
legend;
title('Projection of Function Using Fourier Series');
xlabel('Time');
ylabel('Function Value');

% Display the energies to verify Parseval's Theorem
fprintf('Energy in the time domain: %f\n', time_domain_energy);
fprintf('Energy in the frequency domain: %f\n', frequency_domain_energy);
fprintf('Difference (should be close to zero): %f\n', abs(time_domain_energy - frequency_domain_energy));

% Plot the energies
figure;
bar(1, time_domain_energy, 'r');
hold on;
bar(2, frequency_domain_energy, 'b');
set(gca, 'XTickLabel', {'Time Domain Energy', 'Frequency Domain Energy'});
title('Verification of Parseval''s Theorem');
ylabel('Energy');
