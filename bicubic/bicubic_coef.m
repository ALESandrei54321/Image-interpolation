function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    Aaux = [1  0  0  0; 
            0  0  1  0;
           -3  3 -2 -1;
            2 -2  1  1];
    TRAaux = Aaux';
    % TODO: Converte?te matricile intermediare la double.
    Aaux = double(Aaux);
    A = zeros(4, 4);
    A = double(A);
    
    A(1, 1) = f(y1, x1);
    A(1, 2) = f(y1, x2);
    A(2, 1) = f(y2, x1);
    A(2, 2) = f(y2, x2);
    
    A(1, 3) = Ix(y1, x1);
    A(1, 4) = Ix(y1, x2);
    A(2, 3) = Ix(y2, x1);
    A(2, 4) = Ix(y2, x2);
    
    A(3, 1) = Iy(y1, x1);
    A(3, 2) = Iy(y1, x2);
    A(4, 1) = Iy(y2, x1);
    A(4, 2) = Iy(y2, x2);
    
    A(3, 3) = Ixy(y1, x1);
    A(3, 4) = Ixy(y1, x2);
    A(4, 3) = Ixy(y2, x1);
    A(4, 4) = Ixy(y2, x2);
    
    A = A';
    
    % TODO: Calculeaz? matricea final?.
    A = Aaux * A * Aaux';
endfunction