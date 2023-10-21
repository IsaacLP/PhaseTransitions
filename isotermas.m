clc, clear, close all

a=1.408; %L^2*bar/mol^2
b=0.03913; %L/mol
R=0.08314; %bar*L/mol*K

f = @(t,v) (R*t)./(v-b)-a./v.^2;

Vc=3*b;
Tc=8*a/(27*R*b);
Pc=f(Tc,Vc);

hold on
axis([0 2 0 40])
for T=Tc-20:10:Tc+20
    V=linspace(0.05,5,1024)';
    P=f(T,V);
    plot(V,P)
end
plot(Vc,Pc,'ro')
legend('T=108.23 K','T=118.23 K','T=128.23 K','T=138.23 K','T=148.23 K','Punto de inflexión')
xlabel('V (L)')
ylabel('P (bar)')
title('Isotermas de Nitrógeno con ecuación de Van der Walls')
