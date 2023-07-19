#based on activepesel gem - coudn't use it because provided pesels are invalid
#original code at https://github.com/voytee/activepesel/

class PeselDecoder
  DELTA = {
    18 => 80,
    19 => 0,
    20 => 20,
    21 => 40,
    22 => 60,
  }.freeze

  attr_reader :date_of_birth,
              :sex

  def initialize(pesel)
    @date_of_birth = get_date_of_birth(pesel)
    @sex = get_sex(pesel)
  end

  private

  def get_century(pesel)
    case pesel[2..3].to_i
    when (81..92)
      18
    when (1..12)
      19
    when (21..32)
      20
    when (41..52)
      21
    when (61..72)
      22
    end
  end

  def year(pesel)
    pesel[0..1].to_i + (100 * get_century(pesel))
  end

  def month(pesel)
    pesel[2..3].to_i - DELTA[get_century(pesel)]
  end

  def day(pesel)
    pesel[4..5].to_i
  end

  def get_date_of_birth(pesel)
    begin
      Date.new(year(pesel), month(pesel), day(pesel))
    rescue ArgumentError
      nil
    end
  end

  def get_sex(pesel)
    pesel[9].to_i.even? ? "K" : "M"
  end
end
