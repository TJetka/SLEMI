# library(testthat)
# library(SLEMI)


#formula_generator
test_that("Check error conditions",{
  expect_equal(SLEMI:::func_input_checks(data = data.frame(signal=rnorm(100),response=rnorm(100) ),
                                         signal = "signal", response = "response",side_variables = NULL),"ok")
  expect_error(SLEMI:::func_input_checks(data = matrix(rep(1,9),3,3),signal = "signal",
                                         response = "response",side_variables = NULL))
  expect_error(SLEMI:::func_input_checks(data = data.frame(input=rnorm(100),response=rnorm(100)),
                                         signal = "signal",response = "response",side_variables = NULL))
  expect_error(SLEMI:::func_input_checks(data = data.frame(signal=rnorm(100),output=rnorm(100)),
                                         signal = "signal",
                                         response = "response",side_variables = NULL))
  expect_error(SLEMI:::func_input_checks(data = data.frame(input=rnorm(100),response=rnorm(100),xside=rexp(100)),
                                          signal = "signal",response = "response",side_variables = "side"))
  expect_error(SLEMI:::func_input_checks(data = data.frame(signal=c(NA,rnorm(100)),response=c(rnorm(100),NA) ),
                                         signal = "signal", response = "response",side_variables = NULL))
})
