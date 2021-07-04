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

#* Return the sum of two numbers
#* @png
#* @get /ma
function(){
  stockPrice <- tq_get('TCS.NS',
                         get = "stock.prices",
                         from = Sys.Date() - 365)
  moving <- stockPrice %>% 
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(ma_fun = SMA, n = 20, color = "darkblue", size = 1)
  
  moving
}



