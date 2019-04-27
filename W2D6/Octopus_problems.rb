
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"


def sluggish_octopus(arr)
    biggest = nil
    arr.each do |ele|
        arr.each do |ele2|
            biggest = ele if ele2 < ele || biggest == nil
        end
    end
    biggest
end

p sluggish_octopus(arr)


def dominant_octopus(arr)
    return arr.first if arr.length < 2

    pivot = arr.first


    left = arr[1..-1].select { |ele| ele.length < pivot.length }
    right = arr[1..-1].select { |ele| ele.length >= pivot.length }

   dominant_octopus(right)
end

p dominant_octopus(arr)


def clever_octopus(arr)
    arr.reduce { |a, el| a.length < el.length ? el : a }
end

p clever_octopus(arr)


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(move_dir, tiles)
    tiles.each_with_index do |ele, i|
        return i if ele == move_dir
    end
end


p slow_dance("up", tiles_array)
#> 0

p slow_dance("right-down", tiles_array)
#> 3


new_tiles_data_structure = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }

def fast_dance(move_dir, hash)
    hash[move_dir]
end

p fast_dance("up", new_tiles_data_structure)
#> 0

p fast_dance("right-down", new_tiles_data_structure)
#> 3