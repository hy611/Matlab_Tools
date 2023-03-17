clear
% load test_data_x
% load parameters

processed_data = OOP_DataClass([...
    "test_data_1.mat",...
    "test_data_2.mat",...
    "test_data_3.mat"],...
    "TestType","Type_1","Capacity",10,"Parameters",parameters);

processed_data.createPulses;
R0_list = processed_data.findParametersR0;
R1_list = processed_data.findParametersRC("R1");
C1_list = processed_data.findParametersRC("C1");