module Traceur
  module Config
    @compile_to = :amd

    class << self
      attr_accessor :compile_to

      def prefix_patterns
        @prefix_patterns ||= []
      end

      def add_prefix_pattern(pattern, prefix)
        prefix_patterns << [pattern, prefix]
      end

      def lookup_prefix(path)
        _, prefix = prefix_patterns.detect {|pattern, prefix| pattern =~ path }
        prefix
      end

      def compiler_options
        @compiler_options ||= {}
      end
    end
  end
end
