DATA_SECTION
  init_int n
  init_matrix data(1,n,1,2)
  vector S(1,n)
  !! S = column(data,1);
  vector R(1,n)
  !! R = column(data,2);

PARAMETER_SECTION
  init_number Rmax
  init_number Smax
  init_number logSigma
  sdreport_number sigma
  vector Rfit(1,n)
  number RSS
  objective_function_value f

PROCEDURE_SECTION
  Rfit = Rmax * elem_prod(S/Smax, exp(1-S/Smax));
  RSS = sum(square(log(R)-log(Rfit)));
  sigma = exp(logSigma);
  f = 0.5*n*log(2.0*M_PI) + n*logSigma + RSS/(2.0*square(sigma));