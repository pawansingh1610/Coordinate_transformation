function [enu]=WGS2ENU()
clc;
input('Reference Coordinate(give input like [phi,lambda,height]):--   ')
[Xr,Yr,Zr]=WGS2ECEF(ans(1),ans(2),ans(3));
n=input('Number of coordinated need to be converted:--')
coord=[Xr,Yr,Zr];
enu=[0,0,0];
for i=1:n
    input('enter the coord(give input like [phi,lambda,height]):--')
    [X,Y,Z]=WGS2ECEF(ans(1),ans(2),ans(3));
    coord=vertcat(coord,[X,Y,Z]);
    delcoord=coord(1,:)-coord(i+1,:);
    A=[-sind(coord(1,1)) cosd(coord(1,1)) 0;
        -sind(coord(1,2))*cosd(coord(1,1)) -sind(coord(1,2))*sind(coord(1,1)) cosd(coord(i+1,1));
        cosd(coord(1,2))*cosd(coord(1,1))  cosd(coord(1,2))*sind(coord(1,1)) sind(coord(i+1,1))];
    enu=A*delcoord';
end