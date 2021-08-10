using Interpolations

t = 0:.1:1
x = sin.(2π*t)
y = cos.(2π*t)
A = hcat(x,y)

itp = Interpolations.scale(interpolate(A, (BSpline(Cubic(Natural(OnGrid()))), NoInterp())), t, 1:2)

tfine = 0:.01:1
xs, ys = [itp(t,1) for t in tfine], [itp(t,2) for t in tfine]

using Plots

plot(x, y, label="knots", st=:scatter)
plot!(xs, ys, label="spline")