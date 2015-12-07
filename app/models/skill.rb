class Skill
  attr_reader :title, :id, :details

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @details = data[:details]
  end
  def image_path
    d = Dir.glob(File.join(APP_ROOT,"app", "public", "images", "*.jpg")).sample
    d.split("public").last
  end

end
