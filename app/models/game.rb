require 'parser'

class Game < ActiveRecord::Base
  belongs_to :winner, :class_name => 'User'
  belongs_to :loser, :class_name => 'User'

  validates :winner_id, :loser_id, :presence => true
  validates :winner_score, :loser_score, :presence => true
  validates :played_date, :presence => true

  def self.parse phrase
    new Parser.parse phrase
  end

  def self.parse! phrase
    parse(phrase).save!
  end

  protected

  # allow submission of a string to the winner and loser setter
  [:winner, :loser].each do |attribute|
    define_method "#{attribute}=" do |value|
      value = User.find_or_create_by_name value unless value.respond_to? :name
      super(value)
    end
  end
end
