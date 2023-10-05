require "active_support"

require "active_support/core_ext/array/wrap"
require "active_support/core_ext/hash/keys"
require "active_support/core_ext/object/blank"

begin
  # workaround for activesupport 7.0.0
  # c.f. https://github.com/rails/rails/issues/43851
  require "active_support/isolated_execution_state"
rescue LoadError # rubocop:disable Lint/SuppressedException
end
require "active_support/core_ext/time/calculations"

require "yaml"
require "hashie"
require "date"
require "json"
require "rubicure/version"
require "rubicure/concerns/util"
require "rubicure/concerns/gengou"
require "rubicure/series"
require "rubicure/girl"
require "rubicure/core"
require "rubicure/movie"
require "rubicure/cure"
require "rubicure/errors"
require "rubicure/cure_cosmo"
require "rubicure/cure_peace"
require "rubicure/cure_passion"
require "rubicure/cure_beat"
require "rubicure/cure_scarlet"
require "rubicure/cure_finale"

module Precure
  def self.method_missing(name, *args, &block)
    Rubicure::Core.instance.send(name, *args, &block)
  end

  def self.respond_to_missing?(name, include_private)
    Rubicure::Core.instance.respond_to_missing?(name, include_private)
  end
end

module Shiny
  # @return [Rubicure::Girl] Shiny luminous
  def self.luminous
    Rubicure::Girl.find(:luminous)
  end
end

module Milky
  # @return [Rubicure::Girl] Milky rose
  def self.rose
    Rubicure::Girl.find(:rose)
  end
end
