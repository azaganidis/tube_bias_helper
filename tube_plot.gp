TUBE_MAX=25 #WATT
LOAD=8.0 #KOHM
HT=385.0 #VOLT
BIAS=53.75
POWER_MARGIN=0.9 #PERCENT OF MAX DISSIPATION IN CLASS A
PowerLine(V)=TUBE_MAX*1000/V
b=2
L(x,y,z)=y*10*log(x)+z
LoadClassA(x)=-(x-HT)/(LOAD/2)+BIAS
LoadClassB(x)=-(x-HT)/(LOAD/4)
X_CROSS = -BIAS*LOAD/2+HT
Y_CROSS = LoadClassA(X_CROSS)
set size ratio 1
set xrange[0:HT]
YLIM=LoadClassB(HT)
set yrange[0:HT]
set fit quiet
fit L(x,a,b) "tube_curve_1" via a,b #DONT CHANGE THAT, USEFULL FOR POWER CALCULATION
fit L(x,a2,b2) "tube_curve_2" via a2,b2 #TO ADD MORE CURVES, DUPLICATE THIS LINE, CHANGING THE NAMES OF PARAMETERS a2,b2. ADD THEM ALSO TO THE FOLLOWING LINE
plot PowerLine(x), LoadClassA(x),LoadClassB(x), L(x,a,b), L(x,a2,b2)
Tmp1 = exp(-b/(10*a)+(2*HT)/(5*a*LOAD))
Vmin=5*a*LOAD/2*lambertw(2*Tmp1/(5*a*LOAD))
Imin=LoadClassB(Vmin)
print "Class AB crossover: ", X_CROSS, " V , ", Y_CROSS, " mA"
print "Power class A: ", (HT-X_CROSS)*Y_CROSS/2000," Watt"
print "Power class AB: ", (HT-Vmin)*Imin/2000," Watt"

print "Bias for A line under max dissipation: ", (sqrt(8000*LOAD*TUBE_MAX)-2*HT)/LOAD, " mA"
print "Bias for A line under max dissipation (with margin): ", (sqrt(8000*LOAD*TUBE_MAX*POWER_MARGIN)-2*HT)/LOAD, " mA"
print "HT+ voltage for B line under max dissipation: ", sqrt(1000*LOAD*TUBE_MAX)
