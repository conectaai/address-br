require "conecta_address_br"

require 'i18n'
require 'set' # Fixes a bug in i18n 0.6.11

I18n.load_path += Dir[File.join(mydir, 'locales', '**/*.yml')]
I18n.reload! if I18n.backend.initialized?

module ConectaAddressBr
  class Config
    @locale = nil

    class << self
      attr_writer :locale

      def locale
        @locale || I18n.locale
      end

      def own_locale
        @locale
      end
    end
end

class Base
  def regexify(reg)
    reg = reg.source if reg.respond_to?(:source) # Handle either a Regexp or a String that looks like a Regexp
    reg
      .gsub(%r{^\/?\^?}, '').gsub(%r{\$?\/?$}, '') # Ditch the anchors
      .gsub(/\{(\d+)\}/, '{\1,\1}').gsub(/\?/, '{0,1}') # All {2} become {2,2} and ? become {0,1}
      .gsub(/(\[[^\]]+\])\{(\d+),(\d+)\}/) { |_match| Regexp.last_match(1) * sample(Array(Range.new(Regexp.last_match(2).to_i, Regexp.last_match(3).to_i))) }                # [12]{1,2} becomes [12] or [12][12]
      .gsub(/(\([^\)]+\))\{(\d+),(\d+)\}/) { |_match| Regexp.last_match(1) * sample(Array(Range.new(Regexp.last_match(2).to_i, Regexp.last_match(3).to_i))) }                # (12|34){1,2} becomes (12|34) or (12|34)(12|34)
      .gsub(/(\\?.)\{(\d+),(\d+)\}/) { |_match| Regexp.last_match(1) * sample(Array(Range.new(Regexp.last_match(2).to_i, Regexp.last_match(3).to_i))) }                      # A{1,2} becomes A or AA or \d{3} becomes \d\d\d
      .gsub(/\((.*?)\)/) { |match| sample(match.gsub(/[\(\)]/, '').split('|')) } # (this|that) becomes 'this' or 'that'
      .gsub(/\[([^\]]+)\]/) { |match| match.gsub(/(\w\-\w)/) { |range| sample(Array(Range.new(*range.split('-')))) } } # All A-Z inside of [] become C (or X, or whatever)
      .gsub(/\[([^\]]+)\]/) { |_match| sample(Regexp.last_match(1).split('')) } # All [ABC] become B (or A or C)
      .gsub('\d') { |_match| sample(Numbers) }
      .gsub('\w') { |_match| sample(Letters) }
  end

  def fetch(keys)
    fetched = translate("faker.#{key}")
    fetched = fetched.last if fetched.size <= 1
    if !fetched.respond_to?(:sample) && fetched.match(%r{^\/}) && fetched.match(%r{\/$}) # A regex
      regexify(fetched)
    else
      fetched
    end
  end
end
