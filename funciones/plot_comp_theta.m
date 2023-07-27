function plot_comp_theta(titulo,vector, fp, n, Ts, y)
    fil=2;
    col=2;
    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off');
    sgtitle(titulo, 'FontWeight', 'bold');
    set(gca,'FontSize', 20); % Tama~no de letra para la leyenda y ejes.
    for i = 1:(length(vector))
        subplot(fil,col,i)
        yd = (cos(2*pi*fp*n*Ts + vector(i)))';
        z = y.*yd;
        plot(n, z);
        grid on;
        set(gca,'FontSize', 12); % Tama~no de letra para la leyenda y ejes.
        title("\alpha = (" + vector(i)/pi + ")\cdot\pi", 'FontWeight', 'normal');
    end
end