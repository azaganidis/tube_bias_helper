# tube_bias_helper
A tool to aid on the selection of bias for push-pull tube amplifiers.

To use the only dependency is gnuplot, a free multiplatform software. You can get it at http://www.gnuplot.info/download.html
The script runs with the command 
  gnuplot -p tube_plot.gp
and plots the load curves, maximum dissipation curves and plate characteristics.
It also estimates the bias in mA to keep the class A load line under the max dissipation, the HT voltage to keep the class B load line under the max dissipation, the power of the amplifier in class A and in class B.

The plate characteristics are not included, but only Ug1 is used to calculate the power, so they are mostly for visualization. It is easy to add characteristics for a particular tube, and it will be described in the wiki. If you make the effort to add characteristics for a tube, please share it.
