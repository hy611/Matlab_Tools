clear
%% Time Reformulation
% Function: combine discrete piece of time series into one time series
% Input: [0,1,...,600,0,1,...,200,0,1,...400]
% Output: [0,1,...1200]

function [OutputTimeSeries] = f_TimeReformulation(InputTimeSeries)
    Data_Pulse = InputTimeSeries;
    Data_Pulse(1) = 0;
    Length_Pulse = length(InputTimeSeries);
    Accum_Time = zeros(Length_Pulse,1);
    flag_time = 0;
    for i_time = 2:Length_Pulse
        if Data_Pulse(i_time) < Data_Pulse(i_time-1)
            flag_time = Accum_Time(i_time-1);
        end
        Accum_Time(i_time) = Data_Pulse(i_time) + flag_time;
    end
    OutputTimeSeries = Accum_Time;
end

%% Quick Curve Fitting
function [FitResults] = f_CurveFitting(Input_x,Input_y)
    fitfun = 'a + b*x'; % Set fit function framework
    startPoints = [1 -0.01]; % Set initial point of parameter a and b
    FitResults = fit(Input_x,Input_y,fitfun,'Start',startPoints);
    plot(FitResults,Input_x,Input_y)
end