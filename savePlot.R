savePlot <- function(filename) {
  # save the plot in the required width and height
  dev.copy(png, file=filename, width=480, height=480)
  
  # close the device
  dev.off()
}