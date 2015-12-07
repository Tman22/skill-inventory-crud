require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def create(num)
    num.times do |i|
      SkillInventory.create({ :title => "#{i+1} Title",
                              :details => "#{i+1} Details"})
    end
  end

  def test_it_creates_a_task
    create(1)

    skill = SkillInventory.all.last
    assert_equal "1 Title", skill.title
    assert_equal "1 Details", skill.details
  end

  def test_all_returns_every_skills
    create(3)
    skills = SkillInventory.all
    assert_equal 3, skills.count
    assert_equal "1 Title", skills.first.title
    assert_equal "3 Details", skills.last.details
  end
  #
  # def test_finds_skills
  #   SkillInventory.create({ :title       => "run",
  #                           :details => "fun"})
  #   SkillInventory.create({ :title       => "a title",
  #                           :details     => "a details"})
  #   SkillInventory.create({ :title       => "a title",
  #                           :details     => "woot"})
  #   assert_equal "run", SkillInventory.find(1).title
  #   assert_equal "woot", SkillInventory.find(3).details
  #   assert_equal 2, SkillInventory.find(2).id
  # end

  # def test_update_functions
  #   SkillInventory.create({ :title => "run",
  #                        :details => "fun"})
  #   param = { :title => "Maybe", :details => "Sweet"}
  #   SkillInventory.update(1, param)
  #
  #   assert_equal "Maybe", SkillInventory.all.first.title
  #   assert_equal "Sweet", SkillInventory.find(1).details
  # end

  # def test_delete_a_skill
  #   SkillInventory.create({ :title       => "run",
  #                        :details => "fun"})
  #   SkillInventory.create({ :title       => "a title",
  #                         :details => "a details"})
  #   SkillInventory.create({ :title => "a title",
  #                        :details => "woot"})
  #   SkillInventory.delete(1)
  #   skills = SkillInventory.all
  #   assert_equal 2, skills.count
  # end
end
