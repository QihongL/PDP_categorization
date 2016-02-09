%% process group RSA score
% compute means and error bars for RSA correlation over time
% written for data generated by "runTemporalRSA_group.m"
clear; clc; clf

%% load file and compute summarized data
condition1 = 'randomSubset';
[data.randSub] = summarizeTempRsaData(condition1);
condition2 = 'spatBlurring';
[data.spatBlur] = summarizeTempRsaData(condition2);

%% % Plot the correlation against time
% constant
d.FONTSIZE = 18;
d.LW = 1.5;

% correlation with the basic matrix
figure(1)
subplot(1,2,1)
plot(data.randSub.mean.basic,'linewidth',d.LW)
ylim([0 1])
% hold on 
% for i = 1 : numFiles
%     errorbar(data.randSub.mean.basic(:,i),data.randSub.mean.basic(:,i),'linewidth',d.LW)
% end
% hold off
legend({'1%', '5%', '15%', '30%', '100%'}, 'location', 'southeast', 'fontsize', d.FONTSIZE-2)
xlabel('time', 'FontSize', d.FONTSIZE)
ylabel('Correlation', 'FontSize', d.FONTSIZE)
title('Correlation - basic matrix - random subset', 'FontSize', d.FONTSIZE)

% correlation with the superordinate matrix
subplot(1,2,2)
plot(data.randSub.mean.super,'linewidth',d.LW)
ylim([0 1])
legend({'1%', '5%', '15%', '30%', '100%'}, 'location', 'southeast', 'fontsize', d.FONTSIZE-2)
xlabel('time', 'FontSize', d.FONTSIZE)
ylabel('Correlation', 'FontSize', d.FONTSIZE)
title('Correlation - super matrix - random subset', 'FontSize', d.FONTSIZE)


% 2nd condition 
figure(2)
subplot(1,2,1)
plot(data.spatBlur.mean.basic,'linewidth',d.LW)
ylim([0 1])
legend({'1%', '5%', '15%', '30%', '100%'}, 'location', 'southeast', 'fontsize', d.FONTSIZE-2)
xlabel('time', 'FontSize', d.FONTSIZE)
ylabel('Correlation', 'FontSize', d.FONTSIZE)
title('Correlation - basic matrix - spatial blurring', 'FontSize', d.FONTSIZE)

% correlation with the superordinate matrix
subplot(1,2,2)
plot(data.spatBlur.mean.super,'linewidth',d.LW)
ylim([0 1])
legend({'1%', '5%', '15%', '30%', '100%'}, 'location', 'southeast', 'fontsize', d.FONTSIZE-2)
xlabel('time', 'FontSize', d.FONTSIZE)
ylabel('Correlation', 'FontSize', d.FONTSIZE)
title('Correlation - super matrix - spatial blurring', 'FontSize', d.FONTSIZE)
