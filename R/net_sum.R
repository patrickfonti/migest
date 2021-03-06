#' Extract Net Migration from an Origin-Destination Migration Flow Matrix.
#'
#' Sums each regions flows (from origin rows and destination columns) to obtain net migration sums.
#' 
#' @param m Matrix of origin-destination flows, where the first and second dimensions correspond to origin and destination respectively. 
#' @param region Integer value corresponding to the region that the net migration sum is desired. Will return sums for all regions by default.
#' 
#' @return Returns a numeric value of the sum of a single block.
#' @author Guy J. Abel
#' @seealso \code{\link{block_sum}}, \code{\link{sum_od}}
#' @export
#'
#' @examples
#' m <- matrix(data = 1:16, nrow = 4, ncol = 4)
#' net_sum(m)
net_sum <- function(m, region = 1:dim(m)[1]){
  row_tot <- apply(X = m, MARGIN = 1, FUN = sum, na.rm = TRUE)
  col_tot <- apply(X = m, MARGIN = 2, FUN = sum, na.rm = TRUE)
  net <- col_tot - row_tot
  if(is.null(region))
    region <- 1:min(length(row_tot),length(col_tot))
  n <- net[region]
  return(n)
}
