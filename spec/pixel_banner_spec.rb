require 'pixel_banner'

describe PixelBanner do

  let(:theme) do
    {
      name: "Ocean Breeze",
      swatch: ["4B89BF", "97BF3F", "85A63F", "403013", "F2F2F2"]
    }
  end

  it "creates an pixel banner from a swatch" do
    banner = subject.pixel_banner(theme[:swatch])
    banner.should respond_to(:save)
  end

  # it "should generate a colorful pixel banner" do
  #   banner = subject.pixel_banner(theme[:swatch])
  #   banner.grayscale.palette.first.should_not == banner.palette.first
  # end

  it "should save the banner to a png", :focus do
    banner = subject.pixel_banner(theme[:swatch])
    subject.save banner, theme[:name]
  end

end