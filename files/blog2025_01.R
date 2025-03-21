#' @title Make Titles for Codes
#'
#' @description Generate heading or title as comments to organize R script
#'
#' @param title The text that will be used as the heading
#' @param total_width The total width of the heading, including the symbol characters and spaces. The default is 75.
#' @param left_aligned A logical value indicating whether the title should be left-aligned within the heading (TRUE) or centered (FALSE). The default is FALSE.
#' @param blank_line The number of blank lines to be added before and after the heading. The default is 0.
#' @param symbol The symbol character used to create the heading. The default is <*>.
#'
#' @return An R comment message with the title that is also copied to clipboard.
#'
#' @examples #make_title("Introducing: the <make_title> function",blank_line=1)
#'
#' @importFrom clipr write_clip
#' @export

make_title <- function(title,total_width=75,left_aligned=FALSE,blank_line=0,symbol='*'){
  
  # output n stars, title width + half, n blanks
  n_stars <- total_width-2
  title_width <- nchar(title)
  
  # Hard stop if title too long
  if(title_width > (total_width-5)) {
    new_try <- title_width+5
    message(paste("ERROR: Current title is too large to fit with a <total_width> of",total_width))
    message(paste("Tip: Try a <total_width> of",new_try,"instead"))
    stop()
  }
  
  title_width_half <- title_width/2
  n_blanks <- total_width-4
  
  # find heading center
  heading_center <-  floor(n_blanks/2)
  
  # calculate blanks to the right and to the left of title
  left_blanks <- ifelse(left_aligned==FALSE,heading_center-title_width_half,0)
  right_blanks <-
    ifelse(left_aligned==FALSE,
           ifelse(title_width %% 2 == 0, # +/- 1 depending on even/uneven title length
                  n_blanks - (left_blanks+title_width)-1,
                  n_blanks - (left_blanks+title_width))+1,
           n_blanks - (left_blanks+title_width))
  
  # make vector of blanks
  symbol_vector <- paste0(replicate(n_blanks,symbol),collapse="")
  blank_vector <-  paste0(replicate(n_blanks," "),collapse="")
  left_blanks_vector <- paste0(replicate(left_blanks," "),collapse="")
  right_blanks_vector <- paste0(replicate(right_blanks," "),collapse="")
  
  # Create heading
  row1 <- paste0('# ',symbol_vector,' #')
  row2 <- paste0('# ',left_blanks_vector,title,right_blanks_vector,' #')
  row3 <- paste0('# ',symbol_vector,' #')
  row0 <- paste0('# ',blank_vector,' #')
  
  # Output heading
  message(row1)
  if(blank_line>0) message(row0)
  message(row2)
  if(blank_line>0) message(row0)
  message(row3)
  
  # copy to clipboard
  if(blank_line>0) {
    to_copy <- c(row1,rep(row0,blank_line), row2,rep(row0,blank_line), row3)
    clipr::write_clip(to_copy,breaks="\n")
  } else {
    to_copy <- c(row1,row2,row3)
    clipr::write_clip(to_copy,breaks="\n")
  } # end of copy to clipboard
  
}

