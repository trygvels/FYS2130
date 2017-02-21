from scitools.std import *
def generell(b, k, m,x):
	F = 0.01
	omega = sqrt(k/m)*x
	tid = 50.0
	N = 20000
	dt = tid/N
	z = zeros(N)
	v = zeros(N)
	t = zeros(N)
	z[0] = 0
	v[0] = 0
	t[0] = 0
	def diffEq(zNow,vNow,tNow):
		aNow = (-b*vNow - k*zNow + F*cos(omega*tNow))/m
		return aNow



	def rk(zStart,vStart,tStart):
		a1 = diffEq(zStart,vStart,tStart)
		v1 = vStart

		zHalf1 = zStart+v1*dt/2.0	
		vHalf1 = vStart+a1*dt/2.0

		a2 = diffEq(zHalf1,vHalf1,tStart+dt/2.0)
		v2 = vHalf1
 	
		zHalf2 = zStart+v2*dt/2.0
		vHalf2 = vStart+a2*dt/2.0

		a3 = diffEq(zHalf2,vHalf2,tStart+dt/2.0)
		v3 = vHalf2
	
		zEnd = zStart+v3*dt
		vEnd = vStart+a3*dt
		
		a4 = diffEq(zEnd,vEnd,tStart+dt)
		v4 = vEnd

		aMiddle = 1.0/6.0*(a1+2*a2+2*a3+a4)
		vMiddle = 1.0/6.0*(v1+2*v2+2*v3+v4)
	
		zEnd = zStart + vMiddle*dt
		vEnd = vStart + aMiddle*dt
	
		return zEnd,vEnd

	for j in range(N-1):
		t[j+1] = j*dt
		z[j+1],v[j+1] =rk(z[j], v[j], t[j])
	return t, z, v

