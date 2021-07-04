# plumber.R

#* @preempt __first__
#* @get /
function(req, res) {
  res$status <- 302
  res$setHeader("Location", "./__docs__/")
  res$body <- "Redirecting..."
  res
}

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param stock Add Stock in .NS format
#* @post /stock
function(stock){
  multi_stocks <- tq_get(stock,
                         get = "stock.prices",
                         from = Sys.Date() - 365)
  multi_stocks
}
