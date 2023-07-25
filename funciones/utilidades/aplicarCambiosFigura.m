function aplicarCambiosFigura(figura)
    % Cambiar la fuente a Times New Roman
    set(findall(figura, 'Type', 'text'), 'FontName', 'Liberation Serif');

    % Cambiar los colores a blanco y negro
    set(figura, 'Color', 'w');
    ax = findall(figura, 'Type', 'axes');
    set(ax, 'XColor', 'k', 'YColor', 'k');
    set(ax, 'Color', 'none');
    set(findall(ax, 'Type', 'line'), 'Color', 'k');
    set(findall(ax, 'Type', 'text'), 'Color', 'k');
    set(findall(ax, 'Type', 'patch'), 'FaceColor', 'w', 'EdgeColor', 'k');
    set(findall(ax, 'Type', 'surface'), 'EdgeColor', 'k');
    set(findall(ax, 'Type', 'image'), 'CDataMapping', 'scaled');

    % Desactivar la cuadrícula (grid)
    set(ax, 'GridLineStyle', 'none');

    % Refrescar la figura para aplicar los cambios
    refreshdata(figura);
    drawnow;
end

