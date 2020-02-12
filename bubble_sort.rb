#OP => HanJosmer > https://github.com/HanJosmer/ruby_programming/blob/master/advanced_building_blocks/bubble_sort.rb
def bubble_sort(array)
    i = 0 # placeholder for anchor item
    while i < (array.length - 1) # reaches the end of the array
        left = array[i] # grab the first 
        right = array[i+1] # and second number
        if left > right
            swap_items(array, i, i+1) # switch smaller for bigger
            i = 0 # replace anchor
            redo
        end
        i += 1 # iterate through array 
    end
    return array
end

def swap_items(array, left, right)
    temp = array.slice!(left) # cut left (smaller number)
    array.insert(right, temp) # and replace with right (bigger number)
end

#OP => eng-monika > https://github.com/eng-monika/RUBY-PROJECT-Advanced-Building-Blocks---Bubble-Sort/blob/master/bubble_sort.rb
def bubble_sort_by(array)
    raise 'No block_given' unless block_given? # process if block
    len = array.length - 1 # from the end of the array
    len.step(1, -1) { |a| # step back
      (0...a).each do |i| # and to each
        test = yield(array[i], array[i + 1]) # combination (array[i] = left, array[i+1] = right)
        next unless test.positive? # from end to start, n, n-1 to 0
        temp = array[i] # [temp] = [left]
        array[i] = array[i + 1] # [left] = [right]
        array[i + 1] = temp # a [right] = [temp]
      end
    }
    array
  end
  
  

array = [4, 1, 78, 222, 6, 2]
block_array = ["hi", "hello", "hey", "yo", "four", "a"]
print "Your array is: #{bubble_sort(array)}\n"
print "Your block array is: #{bubble_sort_by(block_array) do |left,right| # this block sorts least to greatest length
    left.length - right.length
end}"
