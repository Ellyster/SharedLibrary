module BooksHelper
  def image_from_amazon(amazon_id, big: false)
    return image_tag "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg", size: "96x160" unless big
    return image_tag "http://images.amazon.com/images/P/#{amazon_id}.jpg", size: "168x280" if big
  end
end
