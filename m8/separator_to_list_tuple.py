#!/usr/bin/python
# 2. Write python program, which will accept comma-separated numbers, and then it should write tuple and list of them:
# Enter numbers: 1, 2, 7, 43, 9
# Output:
# List: [‘1’, ‘2’, ‘7’, ‘43’, ‘9’]
# Tuple: (‘1’, ‘2’, ‘7’, ‘43’, ‘9’) 

numbers = input("Enter numbers by comma: ")
numbers = list(numbers)
var_list = []
var_tuple = ()

for x in numbers:
     if x.isnumeric():
         var_list.append(x)

print (var_list)
print (type(var_list))
var_tuple = tuple(var_list)
print (var_tuple)
print (type(var_tuple))
