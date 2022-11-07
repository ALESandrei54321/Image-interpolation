function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    RED = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    GREEN = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    BLUE = img(:, :, 3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    
    RED_fin = proximal_2x2(RED, STEP); 
    GREEN_fin = proximal_2x2(GREEN, STEP); 
    BLUE_fin = proximal_2x2(BLUE, STEP); 
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    
    out(:, :, 1) = RED_fin;
    out(:, :, 2) = GREEN_fin;
    out(:, :, 3) = BLUE_fin;
endfunction
