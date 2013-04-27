# Pixel Ribbon Generator
Generates a small pixel ribbon to put at the top of squarism.com blog posts.

### Use it

* `git clone this repo`
* `bundle`
* `./pixel_ribbon.rb`

It will create or use a directory called `./img` relative to this project.  You'll find a generated PNG in there.

### How it works
It goes to Kuler.com's RSS feed and grabs a random theme.  It generates a PNG using ChunkyPNG.  If you run it many times you might cap out at 20 images in `./img`.  I don't write blog posts that often so it wasn't in my use case to go past the Kuler 20 theme limit.  ;)