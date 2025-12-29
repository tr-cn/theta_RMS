close all; clear; clc;
ax_linwidth = 2.5;
linewidth = 2;
fontsize = 50; labelfotnsize = 60;
fig = open('Pointing_Stability_Raw_2025_rads.fig');
fig.WindowState = "maximized";
fig.Units = "pixels";
% fig.Position
% fig.Position = [1,1,1920,1080];
ax = fig.Children;
ax.YLabel.String = "\theta (\circ)";
ax.YLabel.Interpreter = "tex";
ax.Children.XData = [1:14];
XData = ax.Children.XData;
ax.Children.YData = rad2deg([ax.Children.YData]);
YData = ax.Children.YData;
ax.XLabel.String = "Shot number";
% ax.XLabel = xlable;
ax.FontSize = fontsize;
ax.FontName = "Times New Roman";
ax.XLabel.FontSize = labelfotnsize;
ax.YLabel.FontSize = labelfotnsize;
ax.XLim = [1-0.4,14+0.4];
ax.YLim = [-(max(YData)+0.2),max(YData)+0.2];
ax.Box = "on";
ax.Layer = "top";
ax.YMinorTick = "on";
ax.LineWidth = ax_linwidth;
plt = ax.Children;
plt.LineWidth = linewidth;
plt.MarkerSize = 30;
plt.Marker = "o";
plt.MarkerFaceColor = [0.5,0.5,0.5];
plt.MarkerEdgeColor = [0,0,0];
rms_val = rms(YData);
% ax.Layer = "middel";
% ln = line (ax.XLim(1):ax.XLim(2),rms_val(ones(size(XData))));
% ln.LineWidth = 5; ln.LineStyle = "--";
% ln.Color = "red";
% txt = text (1,rms_val + 0.3,["RMS\{\theta\} = "+num2str(round(rms_val,2))+"^\circ"]);
% txt.FontName = "Times New Roman";
% txt.FontSize = 50;
% txt.Color = "red";
% exportgraphics(gcf,"theta_rms.pdf")
% hold on; fl = patch([XData,XData(end):-1:XData(1)],[linspace(rms_val,-rms_val,14),linspace(rms_val,-rms_val,14)],"red");
hold on;
fl = fill([linspace(ax.XLim(1),ax.XLim(end),14),linspace(ax.XLim(end),ax.XLim(1),14)],...
[-rms_val*ones(1,14),rms_val*ones(1,14)]...
,[0.9 0.9 1], 'EdgeColor','none'); % shaded error area
Children = [ax.Children(2);ax.Children(1)];
set(gca,"Children",Children)
exportgraphics(gcf,"theta_rms_band.emf")
exportgraphics(gcf,"theta_rms_band.pdf")
saveas(gcf,"theta_rms_band.fig")