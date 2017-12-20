//gaetan lacoste

// partie A
zeros(1;50)
ones(1, 50).*10
z=0:0.3:10
z=-3:0.2:7

//partie B 
function r=f(x)
    r=(1+x).*sin(%pi.*x)
endfunction   
x = linspace(-2, 2)    
y =  f(x) 
xdel(winsid())
fenetre = figure("figure")
fenetre background = color("white");
set ("current_figure, fenetre)
plot2d(x', y' , style = [color("forestgreen")])

