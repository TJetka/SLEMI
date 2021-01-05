# library(testthat)
# library(SLEMI)


#aux_x_log_y
test_that("Compute logarithm x*log(y) for different values",{
  expect_equal(SLEMI:::aux_x_log_y(0,0),0)
  expect_equal(SLEMI:::aux_x_log_y(10^3,10^3),3*10^3*log(10))
  expect_true(is.infinite(SLEMI:::aux_x_log_y(1,0)))
  expect_equal(SLEMI:::aux_x_log_y(0,0),0)
  expect_equal(SLEMI:::aux_x_log_y(10^-400,10^-400),0)
  expect_length(SLEMI:::aux_x_log_y(rep(1,100),rep(2,100)),100)
})


#aux_deleteNA_df
test_that("Remove NAs from a data.frame",{
  temp_df=data.frame(x=c(rnorm(10),NA,NA),y=c(NA,NA,rnorm(10)))
  expect_equal(nrow(SLEMI:::aux_deleteNA_df(temp_df)),8)
  expect_s3_class(SLEMI:::aux_deleteNA_df(data.table::as.data.table(temp_df)),
              "data.frame")
  expect_s3_class(SLEMI:::aux_deleteNA_df(data.table::as.data.table(temp_df)),
                  "data.table")
})

