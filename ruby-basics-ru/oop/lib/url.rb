# frozen_string_literal: true
require 'uri'
require 'forwardable'

# BEGIN
class Url
  def initialize(url_string)
    @url = URI(url_string)
    @query = @url.query
  end

  extend Forwardable
  def_delegators :@url, :scheme, :host, :port

  def query_params
    return {} unless @query

    @query.split('&').each_with_object({}) do |pair, params|
      (key, value) = pair.split '='
      params[key] = value
    end.transform_keys(&:to_sym)
  end

  def query_param(key, default = nil)
    query_params.fetch(key.to_sym, default)
  end


  include Comparable
  def ==(other)
    query_params == other.query_params &&
      @url.scheme == other.scheme &&
      @url.host == other.host &&
      @url.port == other.port
  end
end
# END
