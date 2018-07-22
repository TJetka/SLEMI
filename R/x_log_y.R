#' Calculation of expression \eqn{x\cdot \log y}
#' 
#' @param x is a numeric vector
#' @param y is a numeric vector (the same length of x)
#' @return Function calculates the value of expression \eqn{x\cdot \log y} element-wise. 
#' The result is a numeric vector of the same length as x
#' @export
#' @examples 
#' x_log_y(1,2)
#' x_log_y(0,0)
#' x_log_y(1000,100)
#' @keywords internal
#'
x_log_y<-function(x,y){
  out=log(y^x)
  ids=is.infinite(out)
  out[ids]=x[ids]*log(y[ids])
  out
}