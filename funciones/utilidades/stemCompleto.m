function stemCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,n,x)
%stemCompleto([n(1) n(end) -1.5 1.5],'n','Amplitud','Señal de entrada x[n]',25,'m*-',1.5,n,h);
    % plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
    %
    % Realiza un gr ́afico de una SVIC de manera adecuada.
    % Ejemplo de uso:
    % t = -40:0.01:40;
    % xa = -2*sin(-0.2*t + 5/3*pi);
    % plotCompleto([t(1) t(end) -2 2],'t','f(t)','Se~nal f(t)',20,'r*-',1.5,t,xa)
    figure('units','normalized','outerposition',[0 0 1 1],'Name', titulo, 'NumberTitle', 'off'); % Creo y maximizo figura.
    stem(n, x, col, 'filled', 'Linewidth', grosor); % Grafico. Color (y marcador) y grosor.
    axis(lim_ejes);
    set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje y.
    title(titulo); % Coloco t ́ıtulo para el gr ́afico.
    % Nota: Lo de 'interpreter', 'Latex' es opcional...s ́olo modifica la
    % fuente. Pueden googlear Latex como editor de textos...
end
