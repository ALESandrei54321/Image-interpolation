function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    c_ang = cos(rotation_angle);
    s_ang = sin(rotation_angle);

    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    %R = double(R);
    A = zeros(4, 1);
    % TODO: Calculeaza matricea de transformare.
    T = [c_ang -s_ang; s_ang c_ang];

    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    T = inv(T);
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            v_p = T * [x; y];
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
             xp = v_p(1) + 1;
             yp = v_p(2) + 1;
            
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            
            if xp > n || xp < 1 || yp > m || yp < 1
              R(y + 1, x + 1) = 0;
              continue;
            endif

            % TODO: Afla punctele ce înconjoara(xp, yp).
            
            x1 = floor(xp);
            y1 = floor(yp);
            x2 = x1 + 1;
            y2 = y1 + 1;
            

            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.
            AUX = [1 y1 x1 x1*y1;
                   1 y1 x2 x2*y1;
                   1 y2 x1 x1*y2;
                   1 y2 x2 x2*y2];
            AUX = PR_Inv(AUX);
            IAUX = [I(y1, x1) I(y1, x2) I(y2, x1) I(y2, x2)]';
            
            IAUX = double(IAUX);
            
            A = AUX * IAUX;
            a0 = A(1);
            a1 = A(2);
            a2 = A(3);
            a3 = A(4);
            
            
            R(y + 1, x + 1) = a0 + a1*(yp) + a2*(xp) + a3*(xp)*(yp);

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
        
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction
