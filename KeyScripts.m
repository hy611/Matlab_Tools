%% Parse Filename
FileName = "FileName_001_ABC_$001$_StringLong.mat";

pat_number_1 = "_" + digitsPattern(1,3) + "_";
pat_number_2 = "$" + digitsPattern(1,3) + "$";
FileName_number = erase(extract(FileNames, pat_number_1|pat_number_2),["_","$"]);

pat_letter = "_" + lettersPattern(1,3) + "_";
FileName_letter = erase(extract(FileNames, pat_letter),"_");


%% Save Figure
saveas(gcf,[erase(pwd,'\CodeFolder'), '\SubFolder', char(Title_Name), '.fig'])

%% Transfer Function Estimation (tfest)
% tfest method estimates the parameters of equivalent circuit model of batteries by transfer function estimation
% The impedance is expressed as: Z(s) = U(S)/I(S) = R0 + sum(Ri/(S*taui + 1))
% ftest: estimates a continuous-time transfer function.
% residue: finds the residues (r), poles (p), and direct term (k) of a Partial Fraction Expansion of the ratio of two polynomials
% R0 = k, taui = -1/pi, Ri = -ri/pi, Ci = taui/R

tfest_data = iddata(Voltage - OCV, Current, ts);
np = 3;
nz = 3;
tfest_sys = tfest(tfest_data,np,nz);
[r,p,k] = residue(tfest_sys.Numerator, tfest_sys.Denominator)
R0 = abs(k);
[Param.Tau,idx] = sort(abs(1./p));
Param.Rx = abs(r(idx)./p(idx));
Param.Cx = Param.Tau./Param.Rx;
Param.FitPercent = sys.Report.Fit.FitPercent;
