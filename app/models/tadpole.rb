class Tadpole < ActiveRecord::Base
  belongs_to :frog
  belongs_to :pond

  def evolve
    Frog.create(name: name, color: color, pond: frog.pond)
    destroy
  end

end