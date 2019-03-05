arr = [["a", "b"], ["c", "d"], ["e", "f"], ["g", "h"], ["i", "j"]]



new_arr = []

i = 0
arr.length.times do
    index = 0
    2.times do
     new_arr << arr[i][index]
     index += 1
   end
i += 1
end

p new_arr