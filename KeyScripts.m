%% Parse Filename
FileName = "FileName_001_ABC_$001$_StringLong.mat";

pat_number_1 = "_" + digitsPattern(1,3) + "_";
pat_number_2 = "$" + digitsPattern(1,3) + "$";
FileName_number = erase(extract(FileNames, pat_number_1|pat_number_2),["_","$"]);

pat_letter = "_" + lettersPattern(1,3) + "_";
FileName_letter = erase(extract(FileNames, pat_letter),"_");


%% Save Figure
saveas(gcf,[erase(pwd,'\CodeFolder'), '\SubFolder', char(Title_Name), '.fig'])
