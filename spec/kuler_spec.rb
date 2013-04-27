# "Education is the kindling of a flame, not the filling of a vessel."
# ― Socrates


# make a random pixel banner for squarism posts

# go to kuler.adobe.com
# https://kuler-api.adobe.com/feeds/rss/get.cfm?timeSpan=30&listType=newest

# select a random color pallatte

# get the swatch hexcolors of the theme

# create a pixel banner 24 blocks wide png using the theme
# the png should be 580px (w) x 24px (h)
# the png should not have sequential repeating colors, otherwise it will not look like 24 squares.


# Once you are sick of debugging and testing in pry, move to small tests here
require 'kuler'

describe Kuler do
  it "gets a random swatch" do
    theme = subject.get_theme
    theme.keys.should include(:name)
    theme.keys.should include(:colors)
  end
end
