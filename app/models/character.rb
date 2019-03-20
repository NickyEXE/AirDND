class Character < ApplicationRecord
  belongs_to :party
  before_validation :default_photo
  before_create :set_alive
  validate :level_appropriate
  validates :name, :char_class, :race, :party_id, presence: true

  def default_photo
    self.image_url ||= "https://cdn.pixabay.com/photo/2017/08/31/04/01/d20-2699387_960_720.png"
  end

  def level_appropriate
    if !self.level
      errors.add(:level, "must be included when creating your character.")
    elsif self.level.to_i < 1
      errors.add(:level, "must be a number greater than 0")
    elsif self.level.to_i > 20
      errors.add(:level, "must be less than or equal to 20 (You think you could find an epic level character in a dating service?)")
    end
  end

  def set_alive
    self.alive = true
  end

  def alive_reader
    if self.alive == false
      "#{self.name} has been SLAIN."
    end
  end

  def kill_button_prompt
    if self.alive == true
      "Kill #{self.name}."
    else
      "Hire our in-house lv. 5 cleric to revivify #{self.name}."
    end
  end

  def self.races
    ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk","Paladin","Ranger","Rogue", "Sorcerer","Warlock","Wizard"]
  end

  def mission
    self.party.mission
  end

end
