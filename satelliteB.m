% This program calculates satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit, and plots the
% graphs of orbital altitude and velocity
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
time = input("Input period(s) in hours in the form [x,y,z] where x,y,and z are periods:  ");
fprintf("You inputted %d hours \n", time)
fprintf('\n')


%convert the time that was inputted to an orbital altitude and velocity
height = (((gravity_constant*mass_earth).*(time.*3600).^2)./(4*pi^2)).^(1/3) - radius_earth;
velocity = 2*pi.*(radius_earth + height)./(time.*3600);
    
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
            fprintf ("ERROR: The period %d hours is an invalid time.", ans_matrix(3,counter))
        
        %height value is below 0 for the matrix element then report an error
        elseif ans_matrix(1, counter) <= 0
            fprintf ("ERROR: For the period %d hours, this results in a negative altitude, meaning the satellite would need to be below the earth's surface.", ans_matrix(3,counter))
            

        else 
            fprintf ("The altitude of this satalite from earth's surface is %d km and its velocity is %d m/s for the period of %d hours.", ans_matrix(:,counter))
            
        end
       
        fprintf('\n')
   end
    
% without the error extension I would not have used a for loop to display
% the information and instead would have ran the following code:
% fprintf ("The altitude of this satalite from earth's surface is %d km and its velocity is %d m/s for the period of %d seconds.", ans_matrix)


time = time(time>1.4166); %takes only the time values that are above 1.416hrs which is the minimum period for the altitude to be positive
height = ((((gravity_constant*mass_earth).*(time.*3600).^2)./(4*pi^2)).^(1/3) - radius_earth)./1000; %restates the altitude and velocity equations so each array length is equal
velocity = (2*pi.*(radius_earth + height)./(time.*3600))./1000;

range_min = min(time)/5; %sets the period plot limits to 1/5x the min and 5x the max period
range_max = max(time)*5;

figure(1) % altitude and period chart
plot(sort(time),height,'b--^'); %plots the period in the x-axis and altitude in y-axis, with points beign blue triangles
xlim([range_min, range_max]); %sets the xlimits to the range_min and range_max specified in lines 69-70
title('Altitude vs Period'); %adds titles and x/y labels
xlabel('Period (Hours)');
ylabel('Altitude (km)');

figure(2) % velocity and period chart
plot(sort(time),velocity,'b--^'); %plots the period in the x-axis and velocity in y-axis, with points beign blue triangles
xlim([range_min range_max]); %sets the xlimits to the range_min and range_max specified in lines 69-70
title('Velocity vs Period') %adds titles and x/y labels
xlabel('Period (Hours)')
ylabel('Velocity (km/s)')

figure(3) %earth, the ISS and accompanying satellites
[x,y,z] = sphere(); %first graph a sphere to represent the earth, label it set its radius to the earth's radius
r = (radius_earth)/1000;
surf(r*x,r*y,r*z, 'DisplayName',"EARTH");%credit from matlab link http://www.mathworks.com.au/help/techdoc/ref/sphere.html
hold on %for ISS 2d plot
r2 = (radius_earth)/1000+408; %set the radius of the circle to be 408km (altitude of ISS) plus the radius of the earth
th = 0:pi/50:2*pi; %sets a series of points around a circle from 0 to pi in an array
xunit = r2 * cos(th); %sets the x and y equations around the circle
yunit = r2 * sin(th);
zunit = zeros(size(th)); %sets the zunit to be an array the same size as x and y but 0 
plot3(xunit, yunit, zunit,'--', 'DisplayName',"ISS", 'LineWidth', 2);
for counter2 = 1:length(time)
    hold on
    r3 = (radius_earth)/1000+height(counter2); %sets the radius of the satellite circle to the height plus the earth's radius
    th = 0:pi/50:2*pi; %sets a series of points around a circle from 0 to pi in an array
    xunit = r3 * cos(th);%sets the x and y equations around the circle
    yunit = r3 * sin(th);
    zunit = zeros(size(th)); %sets the zunit to be an array the same size as x and y but 0 
    plot3(xunit, yunit, zunit, 'DisplayName',strcat(string(time(counter2))," hours period"))
end
hold off
axis equal %sets all axies equal for realistic model
title('Satellite Orbit Diagram') %adds titles and x/y labels
xlabel('Kilometers')
ylabel('Kilometers')
zlabel('Kilometers')
legend show %credit on how to incorporate legend from for loop from https://www.mathworks.com/matlabcentral/answers/29799-how-do-i-create-a-legend-and-include-loop-variable-values-in-the-labels



% For test case I ran:
% - negative periods, which resulted in the proper error message and no
% values on the figures
% - low periods resulting in negative heights, resulting in proper error
% message and no values on the figures
% - 5561 seconds as the period (ISS) resulting in 412km of altitude and a velocity of 7663m/s, 
% while the ISS is 408km in altitude from the earths surface and travels at 7660m/s

% therefor code works in accuratly calculating satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit


fprintf('\n')
