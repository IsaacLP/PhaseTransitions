clc, clear, close all

a=1.408; %L^2*bar/mol^2
b=0.03913; %L/mol
R=0.08314; %bar*L/mol*K

f = @(t,v) (R*t)./(v-b)-a./v.^2;

Vc=3*b;
Tc=8*a/(27*R*b);
Pc=f(Tc,Vc);

Vi=25;
Ti=300;
dt=50;
d=dt;

V=linspace(0.05,24.99,100000)';
P=f(Ti,V);
Pi=P;
P1=f(Ti,Vi);
nodos=0;

hold on
figure(1)
title('Búsqueda de temperatura crítica')
axis([0 0.2 -4 4])

while nodos<1

    nodos=0;
    P=f(Ti,V);
    P1=f(Ti,Vi);
    plot(V,P)
    yline(P1)
    pause(0.05)

    for i = 1:length(P)-1
        if (P1>=P(i) && P1<P(i+1)) || (P1<=P(i) && P1>P(i+1))
            nodos=nodos+1;
            if abs(P(i)-P(i+1))<0.01
                nodos=1;
                % disp("Hola")
                break
            end
            % disp(nodos)
        end
    end

    if nodos>1
        nodos=0;
        d=d/2;
        Ti=Ti+d;
        % disp(nodos)
    elseif nodos==1
        break
    else
        Ti=Ti-d;
    end
end

figure(2)
hold on
axis([-1 26 0 20])
plot(V,P,V,Pi,'LineWidth',1.5)
yline(P1,'Linestyle','--','LineWidth',1.5)
xline(Vi,'Linestyle','--','LineWidth',1.5)
legend(sprintf('Tc=%.3f K',Ti),'Ti=300 K',Location="best")
xlabel('V (L)')
ylabel('P (bar)')
title('Temperatura crítica para una compresión isométrica')
