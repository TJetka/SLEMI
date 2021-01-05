# library(testthat)
# library(SLEMI)

# detach("package:SLEMI")

# func_sampling_functions
test_that("Check capacity algorithm - main",{
  
  n_sample <- c(100) 
  dist_sd  <- 1 
  input_num <- 4
  xx <- signif(c(0, exp( seq( from = log(0.01), to = log(100),
            length.out = input_num-1))),   digits = 2) 
  example_means <- 10*(xx/(1+xx)) 
  example_sds <- rep(dist_sd, input_num)
  tempdata <-  data.frame(signal = c(t(replicate(n_sample, xx))),
      output = c(matrix(rnorm(n = input_num*n_sample, mean = example_means,sd = example_sds),
        ncol = input_num,byrow = TRUE)))
  tempdata$signal <-  factor(x = tempdata$signal,levels = sort(unique(tempdata$signal)))
  signal_name <- "signal"
  response_name <- "output"
  
  tempoutput  <- SLEMI::capacity_logreg_main(
      dataRaw = tempdata, 
      signal = signal_name,
      response = response_name, 
      output_path = NULL)
  
  expect_equal(names(tempoutput), c("regression","model","p_opt","cc","time","params" ))
  expect_true(tempoutput$cc>=0)
  expect_equal(round(sum(tempoutput$p_opt),digits=8),1)
})

