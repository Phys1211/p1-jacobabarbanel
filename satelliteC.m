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
time_units = input('Input satellite period(s) followed by a unit specification, with each value seperated by a comma and space (sec, min, hr, or day) (EX: 90 min, 24 hr): ', 's')

time_units = string(split(time_units, ', '))
time_units = string(split(time_units))

time = time_units(:,1);
units = time_units(:,2);

user_play = "y"

while user_play == "y"
    
    for counter = 1:length(time)
        fprintf("You inputted %s %s\n", time(counter), units(counter))
        fprintf('\n')
        switch units(counter)
            case 'min'
                period = str2double(time(counter))*60
            case 'hr'
                period = str2double(time(counter))*3600
            case 'sec'
                period = str2double(time(counter))
            case 'day'
                period = str2double(time(counter))*(24*3600)
            otherwise
                disp('ERROR')
        end
        
        height = ((((gravity_constant*mass_earth)*(period)^2)/(4*pi^2))^(1/3) - radius_earth)/1000; %KM %restates the altitude and velocity equations so each array length is equal
        velocity = (2*pi*(radius_earth + height*1000)/period)/1000; %KM/S
        
        fprintf ("The satellite orbits at an altitude of %d km at a speed of %d km/s", round(height), round(velocity))
        
        figure('Name', append(string(counter), "a")) % altitude and period chart
        plot(period,height,'b^') %plots the period in the x-axis and altitude in y-axis, with points beign blue triangles
        title('Altitude vs Period') %adds titles and x/y labels
        xlim([0 inf])
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Altitude (km)')

        figure('Name', append(string(counter), "b"))% velocity and period chart
        plot(period ,velocity,'b^') %plots the period in the x-axis and velocity in y-axis, with points beign blue triangles
        title('Velocity vs Period') %adds titles and x/y labels
        xlim([0 inf])
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Velocity (km/s)')
        fprintf('\n')
    end
    user_play = input("Would you like to input another period (or set of periods) [y/n]: " , 's');

end

fprintf('\n')
