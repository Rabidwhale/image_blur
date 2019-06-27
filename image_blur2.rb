class Image

  def initialize(array)
    @image = array
  end

  def blur_image
    @image.each_with_index do |row, x|
      row.each_with_index do |pixel, y|
        if pixel == 1
        mark_neighbors(x, y)
        end
      end
    end
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def mark_neighbors(x, y)
    # find top neighbor
    if x - 1 >= 0
      @image[x-1][y] = 1
    end
    # find right neighbor
    if y + 1 < @image[x].size
      @image[x][y + 1] = 1
    end
    #find bottom neighbor
    if x + 1 < @image.size
      @image[x + 1][y] = 1
    end
    #find last neighbor
    if y - 1 >= 0
      @image[x][y - 1] = 1
    end
  end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0]
])
image.blur_image
image.output_image