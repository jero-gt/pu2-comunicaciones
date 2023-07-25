function plot_comp_MF(lim_ejes_modulo,lim_ejes_fase, eje_x, titulo, tam_letra, grosor, n, x, x_v)

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.

    subplot(2,1,1);
    hold on;
    plot(n, abs(x_v), 'r-', 'Linewidth', grosor);
    plot(n, abs(x), 'b--', 'Linewidth', 2);
    axis(lim_ejes_modulo);
    xlabel(eje_x);
    % Agregar título del eje x en la esquina inferior derecha
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    legend('Numérica', 'Analítica');
    title("|" + titulo + "|"); % Coloco t ??tulo para el gr ?afico.

    subplot(2,1,2);
    hold on;
    plot(n, angle(x_v), 'r-', 'Linewidth', grosor);
    plot(n, angle(x), 'b--', 'Linewidth', 2);
    axis(lim_ejes_fase);
    xlabel(eje_x);
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    legend('Numérica', 'Analítica');
    title("\angle" + titulo); % Coloco t ??tulo para el grafico.
    
end
