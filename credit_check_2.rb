card_number = "6011797668868728"

split_card_number = card_number.chars.map { |num| num.to_i}

two_times_every_other = split_card_number.map.with_index do |num, index|
  if card_number.length == 16
    index.even? ? num * 2 : num
  else
    index.odd? ? num * 2 : num
  end
end

summed_numbers = two_times_every_other.map do |num|
  num > 9 ? num - 9 : num
end

results_summed = summed_numbers.inject(&:+) % 10
  puts "The number is valid!" if results_summed == 0
  puts "The number is invalid!" if results_summed !=0

# Valid: 5541808923795240, 4024007136512380, 6011797668867828
# Invalid: 5541801923795240, 4024007106512380, 6011797668868728
# AMEX valid: 342804633855673
# AMEX invalid: 342801633855673
