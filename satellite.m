% This program calculates satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit
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
time = input("Input a period(s) in seconds in the form [x,y,z] where x,y,and z are periods:  ");
fprintf("You inputted %d seconds \n", time)
fprintf('\n')

%check to see if the input period is a positive value
%time >= 0
    %convert the time that was inputted to an orbital altitude and velocity
    height = (((gravity_constant*mass_earth).*time.^2)./(4*pi^2)).^(1/3) - radius_earth;
    velocity = 2*pi.*(radius_earth + height)./time;
    
    height = height ./ 1000;
    height = round(height);
    velocity = round(velocity);
    
    %create a matrix that takes all the values to be used in a for loop in
    %checking errors and reporting values back to user
    ans_matrix = [height; velocity; time];
    
    
   %create counter and for loop to go through all the period values to
   %report thier associated height and speed or report errors
   counter = 1;
   for counter = 1:length(time)
       %time value is below 0 for the matrix element then report an error
        if ans_matrix(3,counter) <= 0
            fprintf ("ERROR: The period %d seconds is an invalid time.", ans_matrix(3,counter))
        
        %height value is below 0 for the matrix element then report an error
        elseif ans_matrix(1, counter) <= 0
            fprintf ("ERROR: For the period %d seconds, this results in a negative altitude, meaning the satellite would need to be below the earth's surface.", ans_matrix(3,counter))
            

        else
            fprintf ("The altitude of this satalite from earth's surface is %d km and its velocity is %d m/s for the period of %d seconds.", ans_matrix(:,counter))
            
        end
       
        fprintf('\n')
    end

% For test case I ran:
% - negative periods, which resulted in the proper error message
% - low periods resulting in negative heights, resulting in proper error
% message
% - 5561 seconds as the period (ISS) resulting in 412km of altitude and a velocity of 7663m/s, 
% while the ISS is 409km in altitude from the earths surface and travels at 7660m/s
% - 6120 seconds as the period (ISS) resulting in 859km of altitude and a velocity of 7423m/s, 
% while the ISS is 850km in altitude from the earths surface and travels at 7430m/s

% therefor code works in accuratly calculating satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit



fprintf('\n')
