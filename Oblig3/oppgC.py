from scitools.std import *
from TvungenGenerell import *
from matplotlib.pyplot import *




t, z, v    = generell(b=0.04, k = 10, m = 0.1, x = 1)#omegaF = omega0
t1, z1, v1 = generell(b=0.04, k = 10, m = 0.1, x = 0.9)#omegaF = omega0*0.9



subplot(2,1,1)
title('Svingning med paatrykt harmonisk kraft')
xlabel('Tid [s]')
ylabel('Utslag [m]')
plot(t,z)


subplot(2,1,2)
plot(t1,z1)
xlabel('Tid [s]')
ylabel('Utslag [m]')

savefig('oppgC.png')
show()
