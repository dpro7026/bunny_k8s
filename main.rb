#!/usr/bin/env ruby
require 'bunny'
require './producer'
require './consumer'

CONFIG="amqp://guest:guest@rabbitmq:5672"

connection = Bunny.new(CONFIG)
connection.start
channel = connection.create_channel

# create 2 producers with different channels and 1 consumer
producer1 = Producer.new
producer1.send_msg(channel, 'Anime channel', 'Hi Pikachu!')
producer1.send_msg(channel, 'Sports channel', 'Hi Sports!')
consumer1 = Consumer.new
consumer1.receive_msg(channel, 'Anime channel')

connection.close
