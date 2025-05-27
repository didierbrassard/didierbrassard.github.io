#' @title Make formatted text
#'
#' @description Generate vertically-aligned equal sign for input parameters or values
#'
#' @param parm_list A character string containing the function parameters or values in a comma-separated format.
#' @param name The name of the function (default is `list`)
#'
#' @return This function does not return a value directly, but it prints and copies the formatted parameter call.
#'
#' @export
#' 
#' @examples
#' \dontrun{
#' # Hypothetical function with many input parameters
#' run_model_analysis <- function(y, Xmat, method = "glm", tol = 1e-6, penalization = "none", 
#'                               lambda = NULL, family = "gaussian", verbose = TRUE) {return(NULL)}
#'
#' # Create quoted list of parameters with `formals` and `names`
#' my_parameters <- names(formals(run_model_analysis))
#' 
#' make_ftext(
#'   parm_list = my_parameters,
#'   name = "run_model_analysis"
#' )
#' }
#' 
#'
#' @importFrom clipr write_clip

make_ftext<- function(parm_list, name="list"){
  
  # print first row of function call (i.e., its name)
  header_row <- paste0(name,"(")
  
  # generate symbol to add after each
  symbol <- c(" = ,")
  
  # generate list of parameters
  parm_list <- gsub("[=]","",parm_list)
  parms <- unlist(strsplit(parm_list, ","))
  nparms <- length(parms)
  
  # create data and derive values
  data <- data.frame(parms = parms)
  data$nchar <- nchar(data$parms) # get length
  data$max <- max(data$nchar) # derive maximum field length (i.e., max nchar )
  data$blanks <- data$max - data$nchar # calculate number of blank needed
  # correction for first, if uneven, in single-string
  if( (length(parm_list)==1) & (max(data$nchar) %% 2 ==0)){
    data[1,"blanks"] <-  data[1,"blanks"]-1
  }
  
  ## create particular symbol for last parameter or otherwise use <symbol>
  data$symbol <- NA
  data[nparms,]$symbol <- " = )"
  data$symbol <- ifelse(is.na(data$symbol),symbol,data$symbol)
  
  # generate each line of text, according to <nparms>
  generate_row_text <- function(index){
    paste0("\t",data[index,"parms"],
           paste0(replicate(data[index,"blanks"]," "),collapse=""),
           data[index,"symbol"], collapse="")
  }
  
  ## loop through each parameter
  l <- list()
  for (i in 1:nparms){
    l[[i]]<-generate_row_text(index = i)
  }
  parms_fmt <- do.call("rbind",l)
  
  # output list
  to_copy <- c(header_row, parms_fmt)
  cat(to_copy,sep="\n")
  
  # copy to clipboard
  clipr::write_clip(to_copy,breaks="\n")
}
