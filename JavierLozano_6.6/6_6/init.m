% Adapted from https://www.ensta-bretagne.fr/jaulin/

close all; 
clear all; 
clc;

 
%size = get(0,'ScreenSize'); % full screen
figure%('Position',[0 0 size(3)/2 size(4)/2]);
hold
% set(gca,'FontSize',12);
xmin=0;
xmax=30;
ymin=-2.5;
ymax=2.5;

axis([xmin xmax ymin ymax]); 
axis ('square');
grid;


