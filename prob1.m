% This program calculates satellite height from a given period in kms
fprintf('\n')
% Set constants to variables for calculation
gravity_constant=6.67*10^-11; %N m^2/kg^2
radius_earth = 6.371*10^6; %m
mass_earth = 5.972*10^24; %kg

%Display the equation which shows that the satellite height is a function of
%the satellite's period
disp("The height of the satalite from the ground is a function of time as follows:")
disp("h=(GMT^2/4pi)^1/3-R")
disp("where G is the gravatational constant, M is the earth's mass, and R is the earth's radius")
fprintf('\n')

%ask the user for the period to retrieve the height
time = input("Input a time (period) in seconds:  ");
fprintf("You inputted %d seconds", time)
fprintf('\n')

%check to see if the input period is a positive value
if time >= 0
    %convert the time that was inputted to a new height value
    height = ((gravity_constant*mass_earth*time^2)/(4*pi^2))^(1/3) - radius_earth;
    height = height / 1000;
    
    
    %check to see if the calculated height 
    if height >= 0
        %print the height of the satellite to the user
        fprintf ("The altitude of the satalite from earth's surface is %d km", round(height))
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

%Here is the extension where we check the difference of altitude of a
%satellite with a period of a solar day versus a sidereal day


%set time and height variables
sidereal_time = 23.93*60*60;
solar_time = 24*60*60;

sidereal_height = ((gravity_constant*mass_earth*sidereal_time^2)/(4*pi^2))^(1/3) - radius_earth;
solar_height = ((gravity_constant*mass_earth*solar_time^2)/(4*pi^2))^(1/3) - radius_earth;

%calculate difference and print

height_diff = solar_height - sidereal_height;
height_diff = height_diff/1000;

fprintf ("The height difference of a solar day satalite orbit altitude is %d km higher than a sidereal day satalite orbit altitude.", round(height_diff))

fprintf('\n')

fprintf('\n')
