function plotFiltros(Filtro_obj,f, fs,ejes,titulo)
[num, den] = tf(Filtro_obj);
h= freqz(num, den,f , fs);
plotCompleto(ejes,'f [Hz]', '', titulo, 20, 'b', 1, f, abs(h));
end
