function [X_shift, f] = fft_kit(x,fs)
    X=fft(x);
   
    N=length(X);
    % Si N es par
    if(mod(N,2)==0)
        f = (-fs/2 : (fs/N) : ((N-1)/N)*(fs/2));
    else
    % Si N es impar
        f = (((N-1)/N)*(-fs/(2)) : (fs/N) : ((N-1)/N)*(fs/2));
    end

    X_shift = fftshift(X);
end