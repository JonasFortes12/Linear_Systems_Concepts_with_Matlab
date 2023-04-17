% Creatting a periodic square wave.
% Parameters:
%   A -> Amplitude
%   w0 -> Frequency (Rad per Sec)
%   rho -> Work Cycle
%   t -> time sampling
%

A = 1;
w0 = 10*pi;
rho = 0.5;
t = 0:0.001:1;
squareWave = A*square(w0*t + rho);
plot(t, squareWave);