require 'slack-notifier'
require_relative 'version'

class SlackReporter
  attr_accessor :name, :channel
  DEFAULTS = {
    webhook:  ENV["SLACK_WEBHOOK_URI"].freeze,
    channel:  '#feedback',
    name:     'user',
    followup: '_announcer'
  }

  def self.defaults(opts={})
    DEFAULTS.merge!(Hash[opts])
  end

  def initialize(item = nil, options={ channel: nil })
    @name = create_name(item)
    @channel  = options[:channel] || DEFAULTS[:channel]
    @notifier = Slack::Notifier.new DEFAULTS[:webhook], channel: @channel, username: @name
  end

  def call(allow = false)
    return unless allow || environmet_allows
    @notifier.ping yield
  end

  private

  def create_name(item)
    item = item.class unless item.class == Class || String
    string = (item || DEFAULTS[:name]).to_s.downcase
    return string if string.split.count > 1
    string + DEFAULTS[:followup]
  end

  def environmet_allows
    environment == 'production'
  end

  def environment
    if defined?(Rails)
      Rails.env
    elseif defined?(Hanami)
      Hanami.env
    else
      'production'
    end
  end
end
