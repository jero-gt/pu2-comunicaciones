function mod_fase(lim_ejes_modulo,lim_ejes_fase, eje_x, titulo, tam_letra, col, grosor, n, x)

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.

    subplot(2,1,1);
    plot(n, abs(x), col, 'Linewidth', grosor);
    axis(lim_ejes_modulo);
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("|" + titulo + "|"); % Coloco t ??tulo para el gr ?afico.

    subplot(2,1,2);
    plot(n, angle(x), col, 'Linewidth', grosor);
    axis(lim_ejes_fase);
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("\angle" + titulo); % Coloco t ??tulo para el grafico.
    
end