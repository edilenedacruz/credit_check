card_number = "6011797668868728"

split_card_number = card_number.chars.map { |num| num.to_i}

two_times_every_other = []
  split_card_number.each_with_index do |num, index|
    if index.even?
      two_times_every_other << num * 2
    else
      two_times_every_other << num
    end
  end

  summed_numbers = two_times_every_other.map do |num|
    if num > 9
      num - 9
    else
      num
    end
  end

results_summed = summed_numbers.inject(&:+)

  if results_summed % 10 == 0
    puts "The number is valid!"
  else
    puts "The number is invalid!"
  end
