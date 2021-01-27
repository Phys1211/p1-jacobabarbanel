% This program calculates salatalite height from a given period in meters


% Set constants to variables for calculation
GConstant=6.67*10^-11; %N m^2/kg^2
REarth = 6.371*10^6; %m
MEarth = 5.972*10^24; %kg

%Display the equation which shows that the satelite height is a function of
%the satalite's period
disp("The height of the satalite from the ground is a function of time as follows:")
fprintf('\n')
disp("h=(GMT^2/4pi)^1/3-R")
disp("where G is the gravatational constant, M is the earth's mass, and R is the earth's radius")
fprintf('\n')

%ask the user for the period to retrieve the height
Time = input("Input a time (period) in seconds:  ");
Fprintf("You inputted %d", Time)

if Time >= 0
    %convert the time that was inputted to a new height value
    Height = ((GConstant*MEarth*Time^2)/(4*pi^2))^(1/3) - REarth;
    
    if Height >= 0
        %print the height of the satalite to the user
        Fprintf ("The height is %d m", Height)
    else
      disp("This period is not valid as it would need a satalite on or below the surface of the earth")
    end
    
else
    disp("This time is not valid")
end

