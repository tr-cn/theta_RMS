close all; clc; clear;
open('theta_rms_band.fig');pause (1);ax_t = gca;  t_fig = gcf;
t_fig.WindowState = "maximized";
ax_t.FontSize = 46;
ax_t.YLabel.FontSize = 56;
ax_t.XLabel.FontSize = 56;


ax_t.Units = "normalized";  ax_n.Units = "normalized";
ax_t.YLabel.Units = "normalized";
ax_t.YLabel.VerticalAlignment = "top";
ax_t.YLabel.String =  '$\theta (\circ)$';
ax_t.YLabel.Interpreter = "latex";

ax_t.YLabel.Position(1) = -0.1732;


saveas(t_fig,'theta_rms_band_mod.fig')
saveas(t_fig,'theta_rms_band_mod.emf')

