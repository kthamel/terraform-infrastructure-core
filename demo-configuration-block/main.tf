resource "random_string" "test-string" {
    length = 20
    special =  false
    lower = true
    upper = true 
    numeric = true
}