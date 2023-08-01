function plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
    % plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
    %
    % Realiza un gr Ì?afico de una SVIC de manera adecuada.
    % Ejemplo de uso:
    % t = -40:0.01:40;
    % xa = -2*sin(-0.2*t + 5/3*pi);
    % plotCompleto([t(1) t(end) -2 2],'t','f(t)','Se~nal f(t)',20,'r*-',1.5,t,xa)
    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.
    plot(t,x,col,'Linewidth',grosor); % Grafico. Color (y marcador) y grosor.
    axis(lim_ejes); 
    %grid on; % L Ì?Ä±mites de los ejes. Grilla.
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje y.
    title(titulo); % Coloco t Ì?Ä±tulo para el gr Ì?afico.
    % Nota: Lo de 'interpreter', 'Latex' es opcional...s Ì?olo modifica la
    % fuente. Pueden googlear Latex como editor de textos...
end
