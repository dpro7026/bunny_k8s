class Producer

  def send_msg(channel, channel_name, content)
    queue = channel.queue(channel_name)
    channel.default_exchange.publish(content, routing_key: queue.name)
    puts "Sent msg #{content}"
  end

end
