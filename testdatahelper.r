b.testdata <- function(){
        dfx <- data.frame(
                group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
                sex = sample(c("M", "F"), size = 29, replace = TRUE),
                age = runif(n = 29, min = 18, max = 54)
        )
        print(dfx)
        return (dfx)
}