% Define orthogonal functions
f1 = sin(2*pi*5*t);
f2 = cos(2*pi*5*t);

% Plot the orthogonal functions
figure;
plot(t, f1, 'r', 'DisplayName', 'f_1 = sin(2\pi 5t)');
hold on;
plot(t, f2, 'b', 'DisplayName', 'f_2 = cos(2\pi 5t)');
legend;
title('Orthogonal Functions');
xlabel('Time');
ylabel('Function Value');
