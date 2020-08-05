require_relative 'talk'

class LightningTalk < Talk

  def initialize(name)
    super(name, 5)
  end
end