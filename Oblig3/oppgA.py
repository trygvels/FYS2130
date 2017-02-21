from scitools.std import *
from Generell import *
from matplotlib.pyplot import *

t, z, v = generell(b=0.1, k = 10, m = 0.1)

#Vi regner dette analytisk for underkritisk demping
#Her er A initialbetingelsen for z = 0.1
A = 0.1
b = 0.1
m = 0.1
k = 10
omega = sqrt(k/m)
gamma = b/(2*m)
omega_ = sqrt(omega**2-gamma**2)
z_a = exp(-gamma*t)*A*cos(omega_*t)

# Vi plotter :)
subplot(2,1,1)
plot(t, z,'-r', t, z_a,'-b')
xlabel('Tid [s]')
ylabel('Hoyde [m]')
title('Numerisk losning og Analytisk losning av dempet svingning')
legend(['Numerisk losning', 'Analytisk losning'])


subplot(2,1,2)
plot(t,abs(z-z_a))
xlabel('Tid [s]')
ylabel('Forskjell i hoyde [m]')
title('Forskjell i analytisk og numerisk losning')
savefig('oppgA.png')
show()

