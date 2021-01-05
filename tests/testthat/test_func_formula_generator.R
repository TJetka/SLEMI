# library(testthat)
# library(SLEMI)


#formula_generator
test_that("Check whethe formula generator shows a correct object",{
  expect_type(SLEMI:::func_formula_generator(signal="signal",
                                             response = "response",
                                             side_variables = NULL),"character")
  expect_type(SLEMI:::func_formula_generator(signal="signal",
                                             response = paste("response",1:10,sep="_"),
                                             side_variables = NULL),"character")
  expect_type(SLEMI:::func_formula_generator(signal="signal",
                                             response = "response",
                                             side_variables = "side_var"),"character")
  expect_type(SLEMI:::func_formula_generator(signal="signal",
                                             response = paste("response",1:10,sep="_"),
                                             side_variables = paste("sideVar",1:10,sep="_")),"character") 
  expect_length(SLEMI:::func_formula_generator(signal="signal",
                                             response = paste("response",1:10,sep="_"),
                                             side_variables = NULL),1) 
  expect_length(SLEMI:::func_formula_generator(signal="signal",
                                             response = paste("response",1:10,sep="_"),
                                             side_variables = paste("sideVar",1:10,sep="_")),1) 
})

