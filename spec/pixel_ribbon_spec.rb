require 'pixel_ribbon'

describe PixelRibbon do

  let(:theme) do
    {
      name: "Ocean Breeze",
      colors: ["4B89BF", "97BF3F", "85A63F", "403013", "F2F2F2"]
    }
  end

  it "creates an pixel ribbon from a swatch" do
    ribbon = subject.pixel_ribbon(theme)
    File.exists?("./img/pixel-ribbon_#{theme[:name]}.png").should be true
  end

  it "should generate a colorful pixel ribbon" do
    subject.pixel_ribbon(theme)
    subject.canvas.grayscale.palette.first.should_not == subject.canvas.palette.first
  end

end