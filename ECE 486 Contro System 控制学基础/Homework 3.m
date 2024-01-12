%% Q1
L1=tf([1],[1 4 8 0]);
L2=tf([1 0],[1 2 0 -2 -1]);

rlocus(L1)
%rlocus(L2)



%% Q2

G=tf([1 2 2],[1 -2 2]);

rlocus(G) %根轨迹图像

%% Test

test1=tf([1],[1 3 2]);
rlocus(test1)

%%
clc, close
nu = -[1 2 2];
de = [1 -2 2];
sys = tf(nu, de)
figure();
axis square;
rlocus(sys)
% xlim([-10, 10])
ylim([-3, 3])
