%% process group score
% compute averages and error bars classification accuracies over time
% written for data generated by "runGroup.m"
clear; clc; close all;
mainDirName = 'groupScores_class';

%% load file and compute summarized data
condition = 'randomSubset';
condition = 'spatBlurring';
%
simNum = 27;
presentation = 'normal';
simName = 'decay';
ep = 20;
simNum_sub = 2:17;

% gather data 
data_sub = cell(length(simNum_sub),1);
for i = 1 : length(simNum_sub)
    % get path name
    subDirName = sprintf('sim%d.%d_%s_%s_e%d', simNum,simNum_sub(i),simName,presentation,ep);
    pathName = strcat(mainDirName,'/',subDirName);
    listing = dir([pathName '/gsClass_' condition '*.mat']);
    % summarize the data
    [data_sub{i}, propUsed] = summarizeData(listing, pathName, condition);
    
end

%% Visualize the classification accuracy over time
data = computeAvg_acrossSims(data_sub); 
plotPerformance_MVPA(data, propUsed, condition)
