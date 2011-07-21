class Array
  def aspect_ratio
    width.to_f / height
  end

  def width
    self[0]
  end

  def height
    self[1]
  end
end
