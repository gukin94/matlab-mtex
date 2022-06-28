%% tidy up
close all
clear
clc

%% CONSTANTs
MTEX_FILE_PATH='/Users/gukin/Documents/MATLAB/mtex-5.3'; %CHANGE

%% Setup MTEX
addpath(MTEX_FILE_PATH);
startup_mtex

%% Load Example EBSD data
mtexdata titanium

cs=ebsd('Titanium').CS;
[grains.ebsd, grainId,ebsd.mis2mean]=calcGrains(ebsd('indexed'), 'angle', 10*degree);
% psi = calcKernel(grains('Titanium').meanorientaiton)


df_width = 5; % in degrees

% odf = calcDensity(ebsd(phase).orientations, 'halfwidth',odf_width*degree);
% odf = calcDensity(ebsd(phase).orientations);
odf = calcDensity(ebsd('indexed').orientations,'resolution',5*degree,'zero_Range');
h = Miller({0,0,1}, {1,0,0}, odf.CS); %plot the (001) and (100), i.e. basal and prism, plane ODFs

%%
figure;
% plotPDF(odf, h,'upper','projection','eangle','contourf');%Note you can plot ODFs with different projections & fix the colourscales
plotPDF(odf, h,'upper','projection','eangle');%Note you can plot ODFs with different projections & fix the colourscales
mtexColorbar;
f1 = gcf;
figSize = f1.Position
f1.Position(3:4) = [figSize(3)/2 figSize(4)/2]
