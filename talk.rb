class Talk

  attr_reader :name, :minutes

  def initialize(name, minutes)
    @name = name
    @minutes = minutes
  end

  def to_s
    return "#{@name} #{@minutes} min"
  end
end