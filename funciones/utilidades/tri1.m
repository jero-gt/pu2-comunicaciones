function h = tri1(t)
    % TRI1 se~nal del ejercicio 2 de la Pr ́actica 1
    h = (t+1).*(t >= -1 & t < 1) + (-t+3).*(t >= 1 & t < 3);
end
