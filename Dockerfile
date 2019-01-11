FROM ruby:alpine
RUN apk update && apk add --update build-base
RUN gem install bunny
RUN mkdir /bunny_on_k8s
COPY . /bunny_on_k8s
WORKDIR /bunny_on_k8s
CMD "ruby main.rb"
