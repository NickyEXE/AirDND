class Party < ApplicationRecord
  has_many :characters


  def self.alignment_printer
    ["Good", "Neutral", "Evil"]
  end

  def self.unemployed_id
    self.all.find_by(mission: "Unemployed").id
  end

  def unemployer
    self.characters.each do |character|
      character.update(party_id: self.class.unemployed_id)
    end
  end

  def self.unemployed_characters
    self.find(self.unemployed_id).characters
  end

  def self.tinderable_characters
    self.unemployed_characters.select do |character|
      character.alive
    end
  end

  def self.dead_and_unemployed_characters
    self.unemployed_characters.select do |character|
      !character.alive
    end
  end
end
