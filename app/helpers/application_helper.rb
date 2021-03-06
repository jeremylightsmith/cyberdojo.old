# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def chunk_array(array, pieces)
  len = array.length;
  mid = (len/pieces)
  chunks = []
  start = 0
  1.upto(pieces) do |i|
    last = start+mid
    last = last-1 unless len%pieces >= i
    chunks << array[start..last] || []
    start = last+1
  end
  chunks
end


def avatar_image(one)
   yield image_tag "avatars/#{one.downcase}.jpg", :class => 'avatar box', :title => "#{one.humanize}"
end

end
