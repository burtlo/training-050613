class Merchant

  def self.has_attached_image(*args)
    puts "PAPERCLIP IS MAKING SOMETHING WITH #{args}"
  end

  OPTIONS = { resize: "200>200", image: "50x50", truncate: true }

  def self.has_paperclip_thumbnail(thumbnail_name,options={})
    options = OPTIONS.merge(options)
    has_attached_image thumbnail_name, options
  end

  def self.has_paperclip_thumbnails(*names)
    names = names.uniq.sort
    names.each {|name| has_paperclip_thumbnail(name) }
  end

  # has_attached_image :small_image, OPTIONS
  # has_attached_image :large_image, OPTIONS

  has_paperclip_thumbnail :extra_large_image, resize: "300>300", image: "100x100"
  has_paperclip_thumbnails :small_image, :large_image

end

merchant = Merchant.new