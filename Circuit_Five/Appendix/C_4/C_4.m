pkg load signal;
num = 10;
den=[1 2.12 10];
w=0:0.01:10;
g=freqs(num,den,w);
mag=abs(g);
plot(w,mag);
xlabel('Frequency - rad/s');
ylabel('Magnitude');
