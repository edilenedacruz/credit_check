require 'pry'
class CreditCheck

  def card_length(card)
    if card.length == 16
      reg_cards(card)
    else
      amex_cards(card)
    end
  end

  def reg_cards(card)
    two_times = split_nums(card).map.with_index do |num, index|
      index.even? ? num * 2 : num
    end
    summed_numbers = two_times.map do |num|
      num > 9 ? num - 9 : num
    end
   total = summed_numbers.inject(&:+) % 10
      puts "The number is valid!" if total == 0
      puts "The number is invalid!" if total !=0
  end

  def split_nums(card)
    card.chars.map { |num| num.to_i}
  end

  def amex_cards(card)
    two_times = split_nums(card).map.with_index do |num, index|
      index.odd? ? num * 2 : num
    end
    summed_numbers = two_times.map do |num|
      num > 9 ? num - 9 : num
      end
      total = summed_numbers.inject(&:+) % 10
        puts "The AMEX number is valid!" if total == 0
        puts "The AMEX number is invalid!" if total !=0
      end

    end

  c = CreditCheck.new
  # card = "4024007136512380"
  card = "342804633855673" #amex
  puts c.card_length(card)

  # Valid: 5541808923795240, 4024007136512380, 6011797668867828
  # Invalid: 5541801923795240, 4024007106512380, 6011797668868728
  # AMEX valid: 342804633855673
  # AMEX invalid: 342801633855673