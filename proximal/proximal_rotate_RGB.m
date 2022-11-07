function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    RED = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    GREEN = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    BLUE = img(:, :, 3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    
    RED_fin = proximal_rotate(RED, rotation_angle); 
    GREEN_fin = proximal_rotate(GREEN, rotation_angle); 
    BLUE_fin = proximal_rotate(BLUE, rotation_angle); 
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    
    out(:, :, 1) = RED_fin;
    out(:, :, 2) = GREEN_fin;
    out(:, :, 3) = BLUE_fin;
endfunction