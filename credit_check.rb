require 'pry'
class CreditCheck
  def card_length(card)
    if card.length == 16
      reg_cards(card)
    else
      amex_cards(card)
    end
  end

  def split_nums(card)
    card.chars.map { |num| num.to_i}
  end

  def reg_cards(card)
    two_times = split_nums(card).map.with_index { |num, index| index.even? ? num * 2 : num }
    summed_numbers = two_times.map { |num| num > 9 ? num - 9 : num }
    total(summed_numbers)
  end

  def amex_cards(card)
    two_times = split_nums(card).map.with_index { |num, index| index.odd? ? num * 2 : num }
    summed_numbers = two_times.map { |num| num > 9 ? num - 9 : num }
    total(summed_numbers)
  end

  def total(summed_numbers)
    new_total = summed_numbers.inject(&:+) % 10
    if new_total == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

  c = CreditCheck.new
  card = "342801633855673"
  c.card_length(card)

  # Valid: 5541808923795240, 4024007136512380, 6011797668867828
  # Invalid: 5541801923795240, 4024007106512380, 6011797668868728
  # AMEX valid: 342804633855673
  # AMEX invalid: 342801633855673
