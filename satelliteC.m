% This program calculates satellite altitude from a given period in kms,
% along with its velocity at any given point in its orbit, and plots the
% graphs of orbital altitude and velocity and takes a series of units

% Set constants to variables for calculation
gravity_constant=6.67*10^-11; %N m^2/kg^2
radius_earth = 6.371*10^6; %m
mass_earth = 5.972*10^24; %kg

user_play = "y" %for the first run, set the user play to yes

while user_play == "y" %open a while loop, while the user wants to play

    %Display the equation which shows that the satellite height is a function of
    %the satellite's period
    disp("The height of the satalite from the ground is a function of time as follows:")
    disp("h=(GMT^2/4pi)^1/3-R")
    disp("where G is the gravatational constant, M is the earth's mass, and R is the earth's radius")
    fprintf('\n')

    %ask the user for the period to retrieve the height
    time_units = input('Input satellite period(s) followed by a unit specification, with each value seperated by a comma and space (sec, min, hr, or day) (EX: 90 min, 2 hr): ', 's')

    if contains(string(time_units),",") %if the string contains a , which suggests there are multiple values
        time_units = string(split(time_units, ', ')) %splits the string by the comma seperating each of the input values
        time_units = string(split(time_units)) %splits each of the values from their associated units
        time = str2double(time_units(:,1)); %sets a time array for the numerical values, and a string array of units
        units = time_units(:,2);

    else
        time_units = string(split(time_units)) %if there is no comma, then simply split the string at the space 
        time = str2double(time_units(1)); %set the time to the first value of the array (the numerical value)
        units = time_units(2); %set the second value to the units
    end   
    
    for counter = 1:length(time) %for each of the time values (amount of inputs)
        fprintf("You inputted %d %s\n", time(counter), units(counter)) %print what was inputted
        fprintf('\n')
        switch units(counter) %switch case to check the unit entered  and convert the time in seconds and set a multiplier for later use
            case 'min'
                period = (time(counter))*60;
                multiplier = 60;
            case "hr"
                period = (time(counter))*3600;
                multiplier = 3600;
            case 'sec'
                period = (time(counter));
                multiplier = 1;
            case 'day'
                period = (time(counter))*(24*3600);
                multiplier = 24*3600;
            otherwise %error if the unit format is not correct
                error("The format of units is incorrect, please use units as show in example.");
                user_play = n;
        end
        
        %some anonymous functions for height and velocity which can take an
        %array
        height = @(x) ((((gravity_constant*mass_earth).*(x).^2)./(4*pi^2)).^(1/3) - radius_earth)./1000; %KM
        velocity = @(x)(2*pi*(radius_earth + height(x).*1000)./x)./1000; %KM/S
        
        %print the height and velocity for each period that was entered
        fprintf ("The satellite orbits at an altitude of %d km at a speed of %d km/s at that period.", round(height(period)), round(velocity(period)))
        fprintf('\n')
        fprintf('\n')
        range_min = time(counter)/5; %sets the period plot limits to 1/5x the min and 5x the max period
        range_max = time(counter)*5;
        time_array = range_min:0.01:range_max; %creates an array of a bunch of times over the range (in the original input unit)
        
        time_multiplied = time_array*multiplier; %sets a new array of the time in seconds
        
        figure('Name', append(string(counter), "a")) % altitude and period chart
        plot(time(counter),height(period),'b^') %plots the period in the x-axis and altitude in y-axis, with points beign blue triangles
        hold on
        plot(time_array,height(time_multiplied),'k-') %plot the curve of altitude to period(in units added)
        title('Altitude vs Period') %adds titles and x/y labels
        xlim([max(0, range_min) range_max])%makes the x range not negative
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Altitude (km)')
        hold off
        
        figure('Name', append(string(counter), "b"))% velocity and period chart
        plot(time(counter),velocity(period),'b^') %plots the period in the x-axis and velocity in y-axis, with points beign blue triangles
        hold on
        plot(time_array,velocity(time_multiplied),'k-')%plot the curve of velocity (in units added)
        title('Velocity vs Period') %adds titles and x/y labels
        xlim([max(0, range_min) range_max]) %makes the x range not negative
        ylim([0 inf])
        xlabel(append('Period (', units(counter), ')'))
        ylabel('Velocity (km/s)')
        
    end
    %ask the user if they would like to continue to use the program (yes or no)
    user_play = input("Would you like to input another period (or set of periods) in the following format [y/n]: ",'s');
    fprintf('\n')
end
fprintf('\n')

%i understand i rely and assume that the user will be entering in the
%inputs in the correct format, without many backups if the input was
%formatted differently. If i had more time i would incorporate more try and
%catch situations to allow for a more dynamic program! SORRY!