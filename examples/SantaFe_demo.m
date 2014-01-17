%% The SantaFe example
%
% Simulate a set of pole figures for the SantaFe standard ODF, estimate
% an ODF and compare it to the inital SantaFe ODF.

%% Open in Editor
%

%% Simulate pole figures

% get crystal and specimen symmetry
cs = get(SantaFe,'CS');
ss = get(SantaFe,'SS');

% crystal directions
h = [Miller(1,0,0,cs),Miller(1,1,0,cs),Miller(1,1,1,cs),Miller(2,1,1,cs)];

% specimen directions
r = equispacedS2Grid('resolution',5*degree,'antipodal');

% pole figures
pf = calcPoleFigure(SantaFe,h,r);

% add some noise
pf = noisepf(pf,100);

% plot them
close; figure('position',[100,100,800,300])
plot(pf)


%% ODF Estimation with Ghost Correction
rec = calcODF(pf)

%% ODF Estimation without Ghost Correction

rec2 = calcODF(pf,'NoGhostCorrection')

%% Error analysis

% calculate RP error
calcError(rec,SantaFe)

% difference plot between meassured and recalculated pole figures
close; figure('position',[100,100,800,300])
plotDiff(pf,rec)
 
%% Plot estimated pole figures

plotpdf(rec,get(pf,'Miller'),'antipodal')

%% Plot estimated ODF (Ghost Corrected)

close; figure('position',[46 171 752 486]);
plot(rec,'alpha','sections',18,'resolution',5*degree,...
  'projection','plain','contourf','FontSize',10,'silent')
mtexColorMap white2black


%% Plot odf

close; figure('position',[46 171 752 486]);
plot(SantaFe,'alpha','sections',18,...
  'projection','plain','contourf','FontSize',10,'silent')
mtexColorMap white2black
   
%% Plot Fourier Coefficients

%%
close all;
% true ODF
plotFourier(SantaFe,'bandwidth',32)
% keep plot for adding the next plots
hold all

% With ghost correction:
plotFourier(rec,'bandwidth',32)

% Without ghost correction:
plotFourier(rec2,'bandwidth',32)

legend({'true ODF','with ghost correction','without ghost correction'})
% next plot command overwrites plot
hold off
