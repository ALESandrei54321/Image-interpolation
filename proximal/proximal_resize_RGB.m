function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    RED = img(:,:, 1);
    % TODO: Extrage canalul verde al imaginii.
    GREEN = img(:,:, 2);
    % TODO: Extrage canalul albastru al imaginii.
    BLUE = img(:,:, 3);
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    RED = proximal_resize(RED, p, q);
    GREEN = proximal_resize(GREEN, p, q);
    BLUE = proximal_resize(BLUE, p, q);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out(:,:, 1) = RED;
    out(:,:, 2) = GREEN;
    out(:,:, 3) = BLUE;
endfunction
