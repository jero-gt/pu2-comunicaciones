function stemComplejo(lim_ejes,lim_ejes_modulo,lim_ejes_fase, eje_x, titulo, tam_letra, col, grosor, n, x)
    % plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
    %
    % Realiza un gr ́afico de una SVIC de manera adecuada.
    % Ejemplo de uso:
    % t = -40:0.01:40;
    % xa = -2*sin(-0.2*t + 5/3*pi);
    % plotCompleto([t(1) t(end) -2 2],'t','f(t)','Se~nal f(t)',20,'r*-',1.5,t,xa)
    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.


    subplot(2,1,1);
    stem3(n,real(x),imag(x),col,'Linewidth',grosor); % Grafico. Color (y marcador) y grosor.
    axis(lim_ejes); grid on; % L ́ımites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel("Real",'Interpreter','Latex'); % Nombro el eje y.
    zlabel("Imag",'Interpreter','Latex'); % Nombro el eje y.
    title(titulo); % Coloco t ́ıtulo para el gr ́afico.
    % Nota: Lo de 'interpreter', 'Latex' es opcional...s ́olo modifica la
    % fuente. Pueden googlear Latex como editor de textos...
    
    subplot(2,2,3);
    stem(n, abs(x), col, 'Linewidth', grosor);
    axis(lim_ejes_modulo); grid on; % L ́ımites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("Modulo"); % Coloco t ́ıtulo para el gr ́afico.

    subplot(2,2,4);
    stem(n, angle(x), col, 'Linewidth', grosor);
    axis(lim_ejes_fase); 
    grid on; % L ́ımites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    title("Fase"); % Coloco t ́ıtulo para el gr ́afico.
end
