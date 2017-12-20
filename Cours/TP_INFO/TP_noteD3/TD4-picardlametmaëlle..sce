//Picard Lamet Maëlle

//Exercie A
vo = zeros(50,1)
v1 = 10*ones(50,1)
z=0:0.3:10
v2 = z
v5 = linspace(-3, 7, 50)
v6=(2).^(1:25)

//Exercice B
clear()
function s=f(x)
    s=(1+x).*sin(%pi *x);
endfunction
x=linspace(-2, 2, 100);

plot2d(x, f(x), style=[color("purple")])
function r=P1(x)
    r=%pi.*x
endfunction
plot2d(x,P1(x), style=[color("blue")])
function t=P2(x)
    t=%pi.*x+%pi.*x.^2
endfunction
plot2d(x, P2(x), style=[color("pink")])

//Exercice C
clear()
function r= G(t,y)
    r=(y./t)+t.*log(t)
endfunction
u = 1
a= 1
t = linspace(1, 4, 100)
y = ode("rk", u, a, t, G)
subplot(2,2,1);
plot2d(t, y, style=[color("green")])

function r= G(t,y)
    r=(y./t)+t.*log(t)
endfunction
u = -2
a= 1
t = linspace(1, 4, 100)
y = ode("rk", u, a, t, G)
subplot(2,2,1);
plot2d(t, y, style=[color("red")])

function r= G(t,y)
    r=(y./t)+t.*log(t)
endfunction
u = 2
a= 1
t = linspace(1, 4, 100)
y = ode("rk", u, a, t, G)
subplot(2,2,1);
plot2d(t, y, style=[color("grey")])
//je c'est qu'il n'est pas nécessaire de tout réecrir à chaque fois et qu'on peut juste changer le u
