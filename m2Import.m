function w2Import = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  W2IMPORT = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a timetable.
%
%  W2IMPORT = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  w2Import = importfile("/MATLAB Drive/WM2NS.csv", [2, Inf]);
%
%  See also READTIMETABLE.
%
% Auto-generated by MATLAB on 05-May-2024 11:45:46

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["DATE", "WM2NS"];
opts.VariableTypes = ["datetime", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "DATE", "InputFormat", "yyyy-MM-dd", "DatetimeFormat", "preserveinput");

% Import the data
w2Import = readtimetable(filename, opts, "RowTimes", "DATE");

end