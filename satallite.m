% This program calculates salatallite height from a given period in meters,
% and the the velocity of the satallite

% Set constants to variables for calculation
gravity_constant=6.67*10^-11; %N m^2/kg^2
radius_earth = 6.371*10^6; %m
mass_earth = 5.972*10^24; %kg

%Display the equation which shows that the satelite height is a function of
%the satalite's period
disp("The height of the satalite from the ground is a function of time as follows:")
fprintf('\n')
disp("h=(GMT^2/4pi)^1/3-R")
disp("where G is the gravatational constant, M is the earth's mass, and R is the earth's radius")
fprintf('\n')

%ask the user for the period to retrieve the height
time = input("Input a time (period) in seconds:  ");
fprintf("You inputted %d", time)
fprintf('\n')

%check to see if the input period is a positive value
if time >= 0
    %convert the time that was inputted to a new height value
    height = ((gravity_constant*mass_earth*time^2)/(4*pi^2))^(1/3) - radius_earth;
    
    
    %check to see if the calculated height 
    if height >= 0
        %print the height of the satalite to the user
        fprintf ("The height is %d m", height)
    else
      disp("This period is not valid as it would need a satalite on or below the surface of the earth")
    end
    
else
    disp("This time is not valid")
end

% For test case I ran:
% - negative periods, which resulted in the proper error message
% - low periods resulting in negative heights, resulting in proper error
% message
% - 5565 seconds as the period (ISS) resulting in 414km of height, while
% the ISS is 409km in height from the earths surface, rendering the code
% useful with uncertainty


fprintf('\n')

