%%
% Given parameters
Pr = 11.44;
cp = 4206;
k_H2O = 0.577;
k_Pipe = 0.47;
Re = 979.4;
Di = 0.025;
Do = Di + 0.008 * 2;
Ts = 10;
Tin = 0;
m_dot = 0.03;

% Define the range of L values
L_values = linspace(10, 50, 100);

% Initialize an array to store Tout values
Tout_values = zeros(size(L_values));

% Loop through each L value and calculate Tout
for i = 1:length(L_values)
    L = L_values(i);
    Nu = 3.66 + 0.0668 * (Di / L) * Re * Pr / (1 + 0.04 * (Di / L * Re * Pr)^(2/3));
    h_H2O = Nu * k_H2O / Di;
    Rt_prime = 1 / (pi * Di * h_H2O) + log(Do / Di) / (2 * pi * k_Pipe);
    Tout_values(i) = Ts - (Ts - Tin) * exp(-L / (m_dot * cp * Rt_prime));
end

% Plot the Tout values against L
figure;
plot(L_values, Tout_values, 'LineWidth', 2);
xlabel('L [m]');
ylabel('Tout [℃]');
title('Tout vs L');
grid on;

%%
% Given parameters
Pr = 11.44;
cp = 4206;
k_H2O = 0.577;
k_Pipe = 0.47;
Re = 979.4;
Di = 0.025;
Do = Di + 0.008 * 2;
Ts = 10;
Tin = 0;

% Define the range of L values
L_values = linspace(10, 50, 100);

% Define different m_dot values
m_dot_values = [0.01, 0.02, 0.03, 0.04, 0.05];

% Initialize an array to store Tout values for each m_dot
Tout_values = zeros(length(L_values), length(m_dot_values));

% Loop through each m_dot value
for j = 1:length(m_dot_values)
    m_dot = m_dot_values(j);
    
    % Loop through each L value and calculate Tout
    for i = 1:length(L_values)
        L = L_values(i);
        Nu = 3.66 + 0.0668 * (Di / L) * Re * Pr / (1 + 0.04 * (Di / L * Re * Pr)^(2/3));
        h_H2O = Nu * k_H2O / Di;
        Rt_prime = 1 / (pi * Di * h_H2O) + log(Do / Di) / (2 * pi * k_Pipe);
        Tout_values(i, j) = Ts - (Ts - Tin) * exp(-L / (m_dot * cp * Rt_prime));
    end
end

% Plot the Tout values against L for each m_dot
figure;
hold on;
for j = 1:length(m_dot_values)
    plot(L_values, Tout_values(:, j), 'LineWidth', 2, 'DisplayName', sprintf('m_{dot} = %.2f', m_dot_values(j)));
end
hold off;

xlabel('L');
ylabel('T_{out}');
title('T_{out} vs L for different m_{dot}');
legend('Location', 'Best');
grid on;

