from scitools.std import *
from Generell import *
from matplotlib.pyplot import *

# Vi loser omega = sqrt(k/m) og gamma = b/(2m)
# gamma = omega gir kritisk demping. Vi faar det ved k = 2 og b = 10
# gamma > omega gir overkritisk demping. vi velger b = 16 og k = 10
# gamma < omega gir underkritisk demping. Vi velger b = 0.1 og k = 10
# generell(b,k,m)

t1, z1, v1 = generell(2,10, 0.1)     #Kritisk
t2, z2, v2 = generell(16,10, 0.1)    #Overkritisk
t3, z3, v3 = generell(0.1,10, 0.1)   #Underkritisk

plot(t1, z1, t2, z2, t3, z3)
legend(['Kritisk demping', 'Overkritisk demping', 'Underkritisk demping'])
xlabel('Tid [s]')
ylabel('Hoyde [m]')
title('Numerisk losning av dempet svingning')
savefig('oppgB.png')
show()


