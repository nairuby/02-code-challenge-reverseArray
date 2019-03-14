#!/bin/ruby
# Nairuby Code Challenge - Reverse Array
#
# Given an array:
# ["r", "e", "v", "e", "r", "s", "e", " ", "t", "h", "i", "s", " ", "a", "r", "r", "a", "y"]
#
# Return and print the reverse of that array:
# ["y", "a", "r", "r", "a", " ","s", "i", "h", "t", " ", "e", "s", "r", "e", "v", "e", "r"]
#
# Stipulation: Do not use Array.reverse
#
# BONUS:
# Given the same array, only reverse the 'words' in the array.
#
# ["r", "e", "v", "e", "r", "s", "e", " ", "t", "h", "i", "s", " ", "a", "r", "r", "a", "y"]
#
# Should then return:
# ["a", "r", "r", "a", "y", " ", "t", "h", "i", "s", " ", "r", "e", "v", "e", "r", "s", "e"]

arr = ["r", "e", "v", "e", "r", "s", "e", " ", "t", "h", "i", "s", " ", "a", "r", "r", "a", "y"]

# Traverse the array to the middle. In every iteration, perform in-place swapping of the value
# in the first half of the array with the value in the second half of the array at the equivalent
# position from the end.
#
# Complexity is n/2
# No extra memory allocation required
#
def reverseArray(arr)
  arr.each_with_index do |v, i|
    break if i >= arr.length/2+1

    arr[arr.length-i-1], arr[i] = arr[i], arr[arr.length-i-1]
  end

  arr
end

# Traverse the array from the end and stash the value encountered in a temporary array.
# Whenever a space value is encountered, prepend the temporary array to the output array
# and reset the temporary array.
#
# Complexity is n
# Extra memory allocation required n + m
#
def reverseWords(arr)
  output = []; temp  = []

  arr.each_with_index do |v, i|
    temp = [arr[arr.length-1-i]] + temp

    if arr[arr.length-1-i] == " " || i == arr.length-1
      output = temp + output; temp = []
    end
  end

  output
end

# Please note, to test either of the solution, you need to comment the below call of the
# other function call. Array are passed by value but the value is a reference to the location
# of the passed array.
printf("%s\n", arr)
printf("%s\n", reverseArray(arr.clone))
printf("%s\n", reverseWords(arr.clone))