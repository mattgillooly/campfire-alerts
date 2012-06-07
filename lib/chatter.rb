class Chatter

  class_attribute :delivery_method
  class_attribute :subdomain
  class_attribute :token
  class_attribute :room_name

  class_attribute :deliveries
  self.deliveries = []

  def room
    return @room if @room

    campfire = Tinder::Campfire.new(subdomain, token: token)
    @room = campfire.find_room_by_name(room_name)
  end

  def post_link(link)
    if delivery_method == :test
      self.deliveries << link
    else
      room.speak link
    end
  end

end
