%% Time-streaching
close all
clear all
clc

out = load('handel.mat');
y = out.y;
Fs = out.Fs;
n = length(y);
t = (0:(n-1))/Fs;

a = input('Podaj ile razy chcesz przyspieszyć dźwięk a: ');
fprintf('Wartość zmiennej a: %f\n', a);

Fs2 = a*Fs; % aby zmodyfikować dźwięk zmieniamy wartość a
t2 = (0:(n-1))/Fs2;

Y = fft(y);
N = length(Y);
df = Fs/N;
df2 = Fs2/N;
f_vec = (0:(N-1))*df; 
f_vec2 = (0:(N-1))*df2; 
Y_amp = abs(Y); 
Y_amp_norm = abs(Y)/N*2; Y_amp_norm(1)=Y_amp_norm(1)/2;

figure()
plot(t,y,t2,y)
xlabel('Time [s]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny','Dźwięk zmodyfikowany'); 
ylim([-1 1])
grid on 

figure()
subplot(2,1,1)
plot(f_vec,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

subplot(2,1,2)
plot(f_vec2,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk zmodyfikowany'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

sound(y,Fs2)

%% Time-streaching (modyfikacja za pomocą ilości Hz)
close all
clear all
clc

out = load('handel.mat');
y = out.y;
Fs = out.Fs;
n = length(y);
t = (0:(n-1))/Fs;

a = input('Podaj ilość Hz o jaką chcesz przesunąć dźwięk a: ');
fprintf('Wartość zmiennej a: %f\n', a);

Fs2 = a + Fs; % aby zmodyfikować dźwięk zmieniamy wartość a
t2 = (0:(n-1))/Fs2;

Y = fft(y);
N = length(Y);
df = Fs/N;
df2 = Fs2/N;
f_vec = (0:(N-1))*df; 
f_vec2 = (0:(N-1))*df2; 
Y_amp = abs(Y); 
Y_amp_norm = abs(Y)/N*2; Y_amp_norm(1)=Y_amp_norm(1)/2;

figure()
plot(t,y,t2,y)
xlabel('Time [s]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny','Dźwięk zmodyfikowany'); 
ylim([-1 1])
grid on 

figure()
subplot(2,1,1)
plot(f_vec,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

subplot(2,1,2)
plot(f_vec2,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk zmodyfikowany'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

sound(y,Fs2)

%% Pitch-Scaling (modyfikacja za pomocą liczby półtonów)
close all
clear all
clc

out = load('handel.mat');
y = out.y;
Fs = out.Fs;
n = length(y);
t = (0:(n-1))/Fs;

n = input('Podaj o ile półtonów chcesz przesunąć dźwięk n: ');
fprintf('Wartość zmiennej n: %f\n', n);

yq = shiftPitch(y, n); % czy mozna podac hz 

Y = fft(y);
Yq = fft(yq);
N = length(Y);
Nq = length(Yq);
df = Fs/N;
dfq = Fs/Nq;
f_vec = (0:(N-1))*df; 
f_vecq = (0:(Nq-1))*dfq; 
Y_amp = abs(Y); 
Y_amp_norm = abs(Y)/N*2; Y_amp_norm(1)=Y_amp_norm(1)/2;
Y_ampq = abs(Yq); 
Y_amp_normq = abs(Yq)/Nq*2; Y_amp_normq(1)=Y_amp_normq(1)/2;

figure()
plot(t,y,t,yq)
xlabel('Time [s]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny','Dźwięk zmodyfikowany'); 
ylim([-1 1])
grid on 

figure()
subplot(2,1,1)
plot(f_vec,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

subplot(2,1,2)
plot(f_vecq,Y_amp_normq) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk zmodyfikowany'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

sound(yq,Fs)

%% Pitch-Scaling (modyfikacja za pomocą ilości Hz)
close all
clear all
clc

out = load('handel.mat');
y = out.y;
Fs = out.Fs;
n = length(y);
t = (0:(n-1))/Fs;

a = input('Podaj ilość Hz o jaką chcesz przesunąć dźwięk a: ');
fprintf('Wartość zmiennej a: %f\n', a);

Fs2 = Fs + a;
n = 12 * log2(Fs2/ Fs);
yq = shiftPitch(y, n); % czy mozna podac hz 

Y = fft(y);
Yq = fft(yq);
N = length(Y);
Nq = length(Yq);
df = Fs/N;
dfq = Fs/Nq;
f_vec = (0:(N-1))*df; 
f_vecq = (0:(Nq-1))*dfq; 
Y_amp = abs(Y); 
Y_amp_norm = abs(Y)/N*2; Y_amp_norm(1)=Y_amp_norm(1)/2;
Y_ampq = abs(Yq); 
Y_amp_normq = abs(Yq)/Nq*2; Y_amp_normq(1)=Y_amp_normq(1)/2;

figure()
plot(t,y,t,yq)
xlabel('Time [s]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny','Dźwięk zmodyfikowany'); 
ylim([-1 1])
grid on 

figure()
subplot(2,1,1)
plot(f_vec,Y_amp_norm) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk oryginalny'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

subplot(2,1,2)
plot(f_vecq,Y_amp_normq) 
xlabel('Frequency [Hz]'); 
ylabel('Amplitude [a.u.]'); 
legend('Dźwięk zmodyfikowany'); 
xlim([0 Fs/2]);
ylim([0 0.025])
grid on

sound(yq,Fs)
