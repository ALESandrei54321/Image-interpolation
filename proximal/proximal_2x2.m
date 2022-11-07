function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
        
    x_int = 1:STEP:2;
    y_int = 1:STEP:2;
    
    
    % Se afl? num?rul de puncte.
    n = length(x_int);
    
    
    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.

    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    
    res = zeros(n);
  
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            if (x_int(i) < 1.5)
               if (y_int(j) < 1.5)
                 close = f(1, 1);
               endif
               if (y_int(j) >= 1.5)
                 close = f(1, 2);
               endif
            endif
            
            if (x_int(i) >= 1.5)
               if (y_int(j) < 1.5)
                 close = f(2, 1);
               endif
               if (y_int(j) >= 1.5)
                 close = f(2, 2);
               endif
            endif
              
            
           
            % TODO: Calculeaza pixelul din imaginea finala.
            res(i, j) = close;
    
        endfor
    endfor
    out = res;

endfunction