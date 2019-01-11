class Consumer

  def receive_msg(channel, channel_name)
    queue = channel.queue(channel_name)
    begin
      queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts "Received msg #{body}"
      end
    end
  end

end
