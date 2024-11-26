filename = '/Users/inayasiddiqui/Documents/NBAscoring.xlsx';
nbaData = readtable(filename);
disp(nbaData)

[~, maxId] = max(nbaData.SeasonPoints);
topScorer = nbaData.Player{maxId};
disp(['Top Scorer: ', topScorer]);
teamStats = varfun(@mean, nbaData, 'InputVariables',...
    {'GamesPlayed', 'Wins', 'SeasonPoints', 'x3Pointers', 'Steals', 'Assists', 'Blocks'},...
    'GroupingVariables','Team');
disp('Team-wise Average Stats:')

disp(teamStats);

% Visualize team-wise average points (SeasonPoints)
figure;
b = bar(categorical(teamStats.Team), teamStats.mean_SeasonPoints);
b.FaceColor = "#80B3FF"
title('Team-wise Average Season Points');
xlabel('Team');
ylabel('Average Season Points');
grid on;