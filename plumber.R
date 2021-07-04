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
  multi_stocks <- tq_get('TCS.NS',
                         get = "stock.prices",
                         from = Sys.Date() - 720)
  lineplot <- multi_stocks %>% 
  ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close),
                     colour_up = "green", colour_down = "red", 
                     fill_up  = "green", fill_down  = "red") +
  labs(title = "TCS Line Chart", y = "Closing Price", x = "") + 
    geom_ma(ma_fun = SMA, n = 20, color = "darkblue", size = 1) +
    geom_ma(ma_fun = SMA, n = 200, color = "darkblue", size = 1) +
  theme_tq()
  print(lineplot)
}



