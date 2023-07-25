function isequal_mod_fase(lim_ejes_modulo,lim_ejes_fase, eje_x, titulo, tam_letra, col, grosor, n, x, x_v)

    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.

    subplot(2,2,1);
    plot(n, abs(x), col, 'Linewidth', grosor);
    axis(lim_ejes_modulo);
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("|" + titulo + "| _a"); % Coloco t ??tulo para el gr ?afico.

    subplot(2,2,2);
    plot(n, angle(x), col, 'Linewidth', grosor);
    axis(lim_ejes_fase); 
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("\angle" + titulo + " _a"); % Coloco t ??tulo para el grafico.
    
    subplot(2,2,3);
    plot(n, abs(x_v), col, 'Linewidth', grosor);
    axis(lim_ejes_modulo); % L ??mites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("|" + titulo + "| _n"); % Coloco t ??tulo para el gr ?afico.

    subplot(2,2,4);
    plot(n, angle(x_v), col, 'Linewidth', grosor);
    axis(lim_ejes_fase); 
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("\angle" + titulo + "_n"); % Coloco t ??tulo para el grafico.
    
    
end