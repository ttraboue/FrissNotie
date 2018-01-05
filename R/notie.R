#' NotieAlert
#'
#' @param message
#' @param style_number
#' @param duration
#' @param session
#' @export
NotieAlert <- function(message, style_number = 1, duration = 2, session = shiny::getDefaultReactiveDomain()){
  data = list(style_number = style_number, message = message, time_in_seconds = duration)
  session$sendCustomMessage(type = "FrissNotifyAlert", data)
}



#' addNotieToPage
#'
#' @return lstRet
#' @export
addNotieToPage <- function(){

  www    <- system.file('www', package='FrissNotie')

  msgFile1 <- paste0(www,"/notie.js")
  msgFile2 <- paste0(www,"/app.js")

  lstRet <- list(addMessageHandler(),singleton(includeScript(msgFile1)),singleton(includeScript(msgFile2)))

  return(lstRet)
}

