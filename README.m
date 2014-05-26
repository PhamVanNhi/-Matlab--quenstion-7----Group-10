%-Matlab--quenstion-7----Group-10
%================================
% Author: Jacob Pham
% Tool: Matlab 2013a
% History: 26/5/2014
%================================



function bai7_nhom9_ve_hinh
clc 
%----------Nhap diem Mo------------
disp('nhap toa do Mo(x0,y0,z0) thuoc mat phang z=2-x^2-y^2')
x0=input('x0= ');
y0=input('y0= ');    
z0=input('z0= ');
%----------Kiem tra Mo----------
while (z0~=2-x0^2-y0^2) || (z0<0)
    disp('nhap sai Mo, Mo phai thoa man mat cong z=2-x^2-y^2')
    disp('Vui long nhap lai')
    x0=input('x0= ');
    y0=input('y0= ');
    z0=input('z0= ');
end
syms x y 
%--------------Nhap ham so z=2-x^2-y^2-----------
z=2-x^2-y^2;
%------------Tinh vector don vi--------------
n=[diff(z,'x') diff(z,'y') diff(z,'z')]; % tinh vector phap tuyen
n=n/sqrt(diff(z,'x')^2+diff(z,'y')^2+diff(z,'z')^2); %Tinh vector  phap tuyen don vi
%-----------Set thuoc tinh cho toa do------------------
axis([-2.5 2.5 -2.5 2.5 -2.5 2.5])
xlabel('Ox')
ylabel('Oy')
zlabel('Oz')
%-------------------ve do thi z(x,y)---------------------
z=2-x^2-y^2;
[x,y]=meshgrid(x0-5:.05:x0+5,y0-5:.05:y0+5);
z=char(z);z=strrep(z,'*','.*');z=strrep(z,'^','.^');
z=eval(z);
[x y z]=loai(x,y,z); %loai bo cac diem bat dinh
set(surf(x,y,z),'facecolor','b','edgecolor','non','facealpha',.3)
hold on
z=0*x+0*y;
set(surf(x,y,z),'facecolor','y','edgecolor','non','facealpha',.3)
hold on
rotate3d on
z=2-x^2-y^2;
%-----------------ve phap vector--------------
x=x0;y=y0;z=z0;
n=eval(n);
x=n(1);
y=n(2);
z=n(3);
%------------------Xuat pha vector don vi--------------
disp(['vector phap tai M0(' num2str(x0) ',' num2str(y0) ',' num2str(z0) ') la:'])
disp(['n= (' num2str(n(1)) ',' num2str(n(2)) ',' num2str(n(3)) ')'])
quiver3(x0,y0,z0,x,y,z,.5,'r','LineWidth',2) %-----ve phap vector tai diem (x0,y0,z0) va co vector donvi la(x,y,z)-----
hold on
%----------Ve hinh chieu--------------
t=0:0.01:2*pi;
x1=sqrt(2)*cos(t);
y1=sqrt(2)*sin(t);
plot(x1,y1)
hold off
%--------Ham loai diem bat dinh-----------
function [x y z]=loai(x,y,z)
for i=1:length(x)
    for j=1:length(y)
        if ~isreal(z(i,j))
            z(i,j)=NaN;x(i,j)=NaN;y(i,j)=NaN;
        end
    end
end
end
end





















