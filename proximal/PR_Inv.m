function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  [m, n] = size(A);
  Q = zeros(m, n);
  R = zeros(n, n);
  
  %calculul matrticelor QR din Gram-Schmidt
  for j=1:n
    for k=1:j-1
      R(k,j) = Q(:,k)'*A(:,j);
    endfor
    aux = A(:, j) - Q(:, 1:j-1) * R(1:j-1,j);
    R(j, j) = norm(aux);
    Q(:, j) = aux/R(j,j);
  endfor


  C = Q';
  %AX=I <=> RX = Q'
  %rezolvarea sistemului RX = C
  X = zeros(n, m);
  
   for i = n:-1:1
     for j = 1:n
       X(i, j) = C(i,j);
       for k = i+1:n
         X(i,j) = X(i,j) - R(i, k) * X(k, j);
       endfor
       X(i,j) = X(i,j)/R(i,i);
       
     endfor
   endfor
  
  B = X;
  
endfunction