% Given parameters
Pr = 390.2;
cp = 2163;
k = 0.1379;
mu = 0.0245;
D = 0.01;
Ts = 180;
Tin = 70;
L = 5;

% Define a range of m_dot values
m_dot_values = linspace(0.001, 0.1, 100);

% Initialize an array to store Tout values
Tout_values = zeros(size(m_dot_values));

% Loop through each m_dot value and calculate Tout
for i = 1:length(m_dot_values)
    m_dot = m_dot_values(i);
    Re = m_dot * 4 / (D * pi * mu);
    Nu = 3.66 + 0.0668 * (D / L) * Re * Pr / (1 + 0.04 * (D / L * Re * Pr)^(2/3));
    h = Nu * k / D;
    Tout_values(i) = Ts - (Ts - Tin) * exp(-L * h * pi * D / (m_dot * cp));
end

% Plot the Tout values against m_dot
figure;
plot(m_dot_values, Tout_values, 'LineWidth', 2);
xlabel('m_{dot}');
ylabel('Tout');
title('Tout vs m_(dot) at L=5');
grid on;


%%
% Given parameters
clc
m_dot = 0.001;

cp = 4179;
mu = 695*0.000001;
k = 628*0.001;
Pr = 4.62;

D = 0.01;
Ts = 80;
Tin = 20;
L = 2;



Re = m_dot * 4 / (D * pi * mu)

Nu = 3.66 + 0.0668 * (D / L) * Re * Pr / (1 + 0.04 * (D / L * Re * Pr)^(2/3))
h = Nu * k / D
Tout = Ts - (Ts - Tin) * exp(-L * h * pi * D / (m_dot * cp))


