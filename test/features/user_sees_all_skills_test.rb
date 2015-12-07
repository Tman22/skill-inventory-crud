require_relative '../test_helper'

class UserSeesAllSkillsTest < FeatureTest

  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :title => "#{i+1} Title",
                              :details => "#{i+1} Details"})
    end
  end

  def test_user_sees_index_of_Skills
    create_skills(2)
    # execution
    visit "/"
    click_link "Skill list"
    # assertions
    within "h3:first" do
      assert_equal "/skills", current_path
      assert page.has_link? "1 Title"
    end
    within "h3:last" do
      assert page.has_link? "2 Title"
    end
    # teardown
  end

  def test_user_can_delete_skills
    create_skills(1)
    visit '/skills'
    click_button('delete')
    refute page.has_content?("1 Title")
  end

  # def test_user_can_delete_two_skills
  #   create_skills(3)
  #   visit 'skills'
  #   # save_and_open_page
  #   within ("#buttons-") do
  #     click_button('delete')
  #   end
  #   assert_equal 2, SkillInventory.all.count
  # end

  def test_creates_new_class
    visit '/'
    click_link("Add Skills")
    fill_in("first_name2", with: "BATMAN")
    fill_in("textarea1", with: "ROAR")
    click_button("create")

    skill = SkillInventory.all.last

    assert_equal "/skills", current_path
    click_link "BATMAN"
    assert_equal "/skills/#{skill.id}", current_path
    within "#skill" do
      assert page.has_content?("BATMAN")
    end
  end

  def test_users_can_edit_a_class
    create_skills(1)
    visit '/skills'
    click_link 'Edit'
    fill_in "name_edit", with: "BATMAN"
    fill_in "details_edit", with: "ROAR"

    skill = SkillInventory.all.first

    click_button "submit"
    assert_equal "/skills/#{skill.id}", current_path
    within "#skill" do
      assert page.has_content?("BATMAN")
    end
  end
end
