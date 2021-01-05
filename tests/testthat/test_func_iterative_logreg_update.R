#library(testthat)
#library(SLEMI)

# detach("package:SLEMI")

# iterative_logreg_update
test_that("Check iterative step in the algorithm",{
  n=10
  prob_lr=matrix(c(runif(3*3*n)+0.1),3*n,3)
  prob_lr=t(apply(prob_lr,1,function(x) x/sum(x)))
  p0=rep(1/3,3)
  cell_id=list(input_1=c(rep(TRUE,n),rep(FALSE,2*n)),
               input_2=c(rep(FALSE,n),rep(TRUE,n),rep(FALSE,n)),
               input_3=c(rep(FALSE,2*n),rep(TRUE,n)))
  signal_levels=c("input_1","input_2","input_3")
  colnames(prob_lr)=signal_levels
  prob_lr=data.frame(prob_lr)
  cc_maxit=n
  
  expect_equal(names(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p0, cell_id = cell_id,
                                       signal_levels = signal_levels,cc_maxit = cc_maxit)),c("p_opt","MI_opt"))
  expect_equal(sum(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p0, cell_id = cell_id,
                                                          signal_levels = signal_levels,cc_maxit = cc_maxit)$p_opt),1)
  expect_true(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p0, cell_id = cell_id,
                                                        signal_levels = signal_levels,cc_maxit = cc_maxit)$MI_opt>=0)
  
  prob_lr1=matrix(c(runif(3*3*n)),3*n,3)
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr1, p0 = p0, cell_id = cell_id,
                                                   signal_levels = signal_levels,cc_maxit = cc_maxit))
  signal_levels1=c("input_1","input_2","input_4")
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p0, cell_id = cell_id,
                                                    signal_levels = signal_levels1,cc_maxit = cc_maxit))
  cc_maxit1=2
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p0, cell_id = cell_id,
                                                    signal_levels = signal_levels,cc_maxit = cc_maxit1))
  p01=c(0,0,0)
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p01, cell_id = cell_id,
                                                    signal_levels = signal_levels,cc_maxit = cc_maxit))
  p01=c(-1,0.5,0.5)
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p01, cell_id = cell_id,
                                                    signal_levels = signal_levels,cc_maxit = cc_maxit))
  p01=runif(4)
  expect_error(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p01, cell_id = cell_id,
                                                    signal_levels = signal_levels,cc_maxit = cc_maxit))
  p01=runif(3)
  expect_warning(SLEMI:::func_iterative_logreg_update(prob_lr = prob_lr, p0 = p01, cell_id = cell_id,
                                                    signal_levels = signal_levels,cc_maxit = cc_maxit))
})

