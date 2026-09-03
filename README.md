# MAT2007 - tutorial week 1
#Exercise 1
exercise1 <- function() {
    name <- "Lucia"
    print(name)
}
exercise1()

#Exercise 2
exercise2 <- function(x,y) {

#Addition
add <- x + y
print(paste("Addition:", add))
#Substraction
substract <- x - y
print(paste("Substraction:", substract))
#Multiplication
multiply <- x * y
print(paste("Multiplication:", multiply))
#Division
divide <- x / y
print(paste("Division:", divide))
}
exercise2(12, 5.7)

#Exercise 3
exercise3 <- function() {
#Define a list of five integers 
numbers <- list(1,2,3,4,5)
# a) append a number
numbers <- append(numbers, 6)
print(numbers)
#b) remove the last number 
numbers <- numbers[-length(numbers)]
print(numbers)
}
exercise3()


#Exercise 4
exercise4 <- function(a) {
   if (a %in% c(2,4,6,8,10)) {
   print("The_number_is_even")
   } else if (a %in% c(1,3,5,7,9)) {
   print("The_number_is_odd")
   }
}
exercise4(5)
