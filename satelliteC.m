% This program calculates satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit, and plots the
% graphs of orbital altitude and velocity
fprintf('\n')

% Set constants to variables for calculation
gravity_constant=6.67*10^-11; %N m^2/kg^2
radius_earth = 6.371*10^6; %m
mass_earth = 5.972*10^24; %kg


user_play = "y"

while user_play == "y"

    %Display the equation which shows that the satellite height is a function of
    %the satellite's period
    disp("The height of the satalite from the ground is a function of time as follows:")
    disp("h=(GMT^2/4pi)^1/3-R")
    disp("where G is the gravatational constant, M is the earth's mass, and R is the earth's radius")
    fprintf('\n')


    %ask the user for the period to retrieve the height
    time_units = input('Input satellite period(s) followed by a unit specification, with each value seperated by a comma and space (sec, min, hr, or day) (EX: 90 min, 2 hr): ', 's')

    if contains(string(time_units),",")
        time_units = string(split(time_units, ', '))
        time_units = string(split(time_units))
        time = time_units(:,1);
        units = time_units(:,2);

    else
        time_units = string(split(time_units))
        time = time_units(1);
        units = time_units(2);
    end   


    
    for counter = 1:length(time)
        fprintf("You inputted %s %s\n", time(counter), units(counter))
        fprintf('\n')
        switch units(counter)
            case 'min'
                period = str2double(time(counter))*60;
                multiplier = 60;
            case "hr"
                period = str2double(time(counter))*3600;
                multiplier = 3600;
            case 'sec'
                period = str2double(time(counter));
                multiplier = 1;
            case 'day'
                period = str2double(time(counter))*(24*3600);
                multiplier = 24*3600;
            otherwise
                disp('ERROR: The format of units is incorrect, please use units as show in example.')
                user_play = n;
        end
        
        height = @(x) ((((gravity_constant*mass_earth).*(x).^2)./(4*pi^2)).^(1/3) - radius_earth)./1000; %KM
        velocity = @(x)(2*pi*(radius_earth + height(x).*1000)./x)./1000; %KM/S
        
        fprintf ("The satellite orbits at an altitude of %d km at a speed of %d km/s at that period.", round(height(period)), round(velocity(period)))

        range_min = str2double(time(counter))/5; %sets the period plot limits to 1/5x the min and 5x the max period
        range_max = str2double(time(counter))*5;
        time_array = range_min:0.01:range_max;
        
        time_multiplied = time_array*multiplier
        
        figure('Name', append(string(counter), "a")) % altitude and period chart
        plot(str2double(time(counter)),height(period),'b^') %plots the period in the x-axis and altitude in y-axis, with points beign blue triangles
        hold on
        plot(time_array,height(time_multiplied),'--') 
        title('Altitude vs Period') %adds titles and x/y labels
        xlim([0 inf])
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Altitude (km)')
        hold off
        
        figure('Name', append(string(counter), "b"))% velocity and period chart
        plot(str2double(time(counter)),velocity(period),'b^') %plots the period in the x-axis and velocity in y-axis, with points beign blue triangles
        hold on
        
        plot(time_array,velocity(time_multiplied),'--')
        title('Velocity vs Period') %adds titles and x/y labels
        xlim([0 inf])
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Velocity (km/s)')
        fprintf('\n')
    end
    user_play = input("Would you like to input another period (or set of periods) [y/n]: " , 's');
    fprintf('\n')
    fprintf('\n')
end

fprintf('\n')
