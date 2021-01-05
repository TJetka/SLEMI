#library(testthat)
#library(SLEMI)

# detach("package:SLEMI")

# func_sampling_functions
test_that("Check sampling functions",{
  n=100
  xdata=data.frame(response=rnorm(3*n),signal=c(rep("input_1",n),rep("input_2",n),rep("input_3",n)))
  prob=0.8
  dataDiv=xdata$signal
  
  expect_s3_class(SLEMI:::sampling_bootstrap(data=xdata,prob = prob,dataDiv = dataDiv),"data.frame")
  expect_error(SLEMI:::sampling_bootstrap(data=xdata,prob = 1.2,dataDiv = dataDiv))
  expect_error(SLEMI:::sampling_bootstrap(data=xdata,prob = 1.2,dataDiv = "signal"))
  expect_error(SLEMI:::sampling_bootstrap(data=xdata,prob = 0.001,dataDiv = dataDiv))
})