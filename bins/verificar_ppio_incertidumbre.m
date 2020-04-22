function void=verificar_ppio_incertidumbre(hh)
  var_x=dlmread('var_x.csv',','); %5x7 (tiempo x caso)
  var_p=dlmread('var_p.csv',','); %5x7
  prod=sqrt(var_x).*sqrt(var_p);
  dlmwrite('prod_varianzas_heisenberg.csv',prod,',');

  hh/2
end