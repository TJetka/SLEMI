# library(testthat)
# library(SLEMI)

# detach("package:SLEMI")

# func_sampling_functions
test_that("Check capacity algorithm - testing procedures",{
  
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
  
  seed_to_use <- 12345
  bootstrap_num <- 10
  bootstrap_frac <- 0.8 
  overfitting_num <- 10 
  training_frac <- 0.6 
  cores_num=1
  
  tempoutput  <- SLEMI::capacity_logreg_main(
    dataRaw = tempdata, 
    signal = signal_name,
    response = response_name, 
    output_path = NULL,
    testing = TRUE,
    plot_width = 10 ,
    plot_height = 8,
    TestingSeed = seed_to_use,
    testing_cores = cores_num,
    boot_num = bootstrap_num,
    boot_prob = bootstrap_frac,
    traintest_num = overfitting_num,
    partition_trainfrac = training_frac
  )
  
  expect_equal(names(tempoutput), c("regression","model","p_opt","cc","testing","testing_pv","time","params" ))
  expect_true(tempoutput$cc>=0)
  expect_equal(round(sum(tempoutput$p_opt),digits=8),1)
  expect_true(all(sapply(tempoutput$testing$bootstrap,function(x) x$cc)>0))
  expect_true(all(sapply(tempoutput$testing$traintest,function(x) x$cc)>0))
})
