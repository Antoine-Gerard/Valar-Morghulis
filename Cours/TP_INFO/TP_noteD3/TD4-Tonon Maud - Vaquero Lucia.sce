// Tonon Maud
// Vaquero Lucia


 //A)
 
V0 = zeros(1, 50);
V1 = 10 * ones(1, 50);
V2 = linspace(0.3, 10, 30);
V5 = linspace(-3, 7, 50)
V6 = (2).^(1:25)

//B)

function r = F(x)
    r = (1 + x) .* sin(%pi .* x)
endfunction
x = linspace(-2, 2, 100);
subplot(2, 2, 1)
plot2d(x', F(x), style=[color("pink")])

function r = P1(x)
    r = %pi .* x
endfunction
plot2d(x', P1(x), style=[color("blue")])

function r = P2(x)
    r = %pi .* x + %pi .* x.^2
endfunction
plot2d(x', P2(x), style=[color("purple")])


//C)
clear()
function r = G(t, y)
    r = (y ./ t) + t .* log(t)
endfunction
t = linspace(1, 4, 100)
u = 1
a = 1
y = ode("rk", u, a, t, G)

plot2d(t', y', style=[color("black")])

function r = G(t, y)
    r = (y ./ t) + t .* log(t)
endfunction
t = linspace(1, 4, 100)
u = -2
a = 1
y = ode("rk", u, a, t, G)

plot2d(t', y', style=[color("orange")])


function r = G(t, y)
    r = (y ./ t)  + t .* log(t)
endfunction
t = linspace(1, 4, 100)
u = 2
a = 1
y = ode("rk", u, a, t, G)

plot2d(t', y', style=[color("red")])
