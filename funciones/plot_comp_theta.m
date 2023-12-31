function plot_comp_theta(opcion,titulo,vector, fp, n, Ts, y)
    fil=2;
    col=2;
    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off');
    sgtitle(titulo, 'FontWeight', 'bold');
    set(gca,'FontSize', 20); % Tama~no de letra para la leyenda y ejes.
    if opcion == 1
        for i = 1:(length(vector))
            subplot(fil,col,i)
            yd = (cos(2*pi*fp*n*Ts + vector(i)))';
            z = y.*yd;
            plot(n.*Ts, z);
            %grid on;
            set(gca,'FontSize', 12); % Tama~no de letra para la leyenda y ejes.
            title("\alpha = (" + vector(i)/pi + ")\cdot\pi", 'FontWeight', 'normal');
        end
    
    else
        for i = 1:(length(vector))
            subplot(fil,col,i)
            yd = (cos(2*pi*fp*n*Ts + vector(i)))';
            z = y.*yd;
            [Z_s, f] = fft_kit(z,1/Ts);
            plot(f, abs(Z_s));
            axis([-1/(2*Ts) 1/(2*Ts) 0 (max(abs(Z_s))*1.1)]);
            xticks([-16000, -8000, 0, 8000, 16000]);
            xticklabels({'-16', '-8', '0', '8', '16'})
            %xticks([-22050, -16000, -8000, 0, 8000, 16000, 22050]);
            %xticklabels({'-22.05', '-16', '-8', '0', '8', '16', '22.05'})
            %grid on;
            set(gca,'FontSize', 12); % Tama~no de letra para la leyenda y ejes.
            title("\alpha = (" + vector(i)/pi + ")\cdot\pi", 'FontWeight', 'normal');
        end
    end
end
