classdef OOP_DataClass < handle

    properties
        ModelType
        TestType
        FileName
        MetaData
        Time
        Voltage
        Current
        Temperature
        Capacity
        SOC
        Parameters
        IndexPulse
    end

    methods
        function obj = OOP_DataClass(filenames,options)

            arguments
                filenames (1,:) string = ""
                options.TestType (1,1) string {mustBeMember(options.TestType, ...
                    ["Type_1", "Type_2"])} = "Type_1"
                options.Capacity (1,1) double
                options.Parameters (1,:) struct

            end

            if nargin ~=0
                time = linspace(0,100,101);
                current = ones(10,1);

                for i = 1: numel(filenames)
                    obj(i).ModelType = options.ModelType;
                    obj(i).Time = time;
                    obj(i).Current = current;
                end
            end
        end

        function createPulses(obj)
            for i = 1: numel(filenames)
                obj(i).IndexPulse = strfind(abs(sign(oj(i).Current')),[0,1,1]);
            end
        end

        function R0List = findParametersR0(obj)
            R0List = obj(1).Parameters.R0;
            for i = 2: numel(filenames)
                R0List = vertcat(R0List,obj(i).Parameters.R0);
            end
        end

        function RCList = findParametersRC(obj,name)
            switch name
                case "R1"
                    RCList = obj(1).Parameters.R1;
                    for i = 2: numel(filenames)
                        RCList = vertcat(RCList,obj(i).Parameters.R1);
                    end
                case "C1"
                    RCList = obj(1).Parameters.C1;
                    for i = 2: numel(filenames)
                        RCList = vertcat(RCList,obj(i).Parameters.C1);
                    end
            end
        end


    end
end

