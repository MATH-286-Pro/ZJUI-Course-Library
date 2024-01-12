%%
clc

syms a1 a2 a3

A=[0 0 a3;
   1 0 a2;
   0 1 a1]

B=[0;
   0;
   1]

C=[0 0 1]


CC=[B,A*B,A*A*B]
OO=[C
    C*A
    C*A*A]

det(CC)
det(OO)

%%
clc

syms x