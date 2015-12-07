require 'yaml/store'
class SkillInventory

  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.create(skill)
    database.from(:skills).insert(title: skill[:title], details: skill[:details])
  end

  # def self.raw_data
  #   database.transaction do
  #     database['skills'] || []
  #   end
  # end

  def self.all
    raw_data = database.from(:skills).to_a
    raw_data.map { |data| Skill.new(data)}
  end

  # def self.raw_skill(id)
  #   raw_data.find { |skill| skill["id"] == id }
  # end

  def self.find(id)
    data = database.from(:skills).where(id: id).to_a.first
    Skill.new(data)
  end

  def self.update(id, param)
    database.from(:skills).where(id: id).update(param)
  end


  def self.delete(id)
    database.from(:skills).where(id: id).delete
  end

end
