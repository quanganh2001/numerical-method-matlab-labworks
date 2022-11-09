clc
fprintf('Part a: The volume of liquid V in a hollow horizontal cylinder of radius r and length L is related to the depth of the liquid h\n')
r=2.2; L=5; V=8;
f=@(h) V-(r^2*acos((r-h)/r)-(r-h)*sqrt(2*r*h-h^2))*L;
h=fzero(f,1);
fprintf('solution:')
disp(h)