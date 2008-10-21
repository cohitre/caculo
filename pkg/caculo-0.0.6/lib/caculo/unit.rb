module Test
  module Unit
    class TestCase
      def self.use_browsers *browsers
        @@browsers = browsers
      end

      def browsers &block
        for browser in @@browsers
          @@browser = Caculo::Browser.open browser
          @@browser.libraries = @@libraries
          yield @@browser
          @@browser.close
        end
      end

      def self.use_libraries *libraries
        @@libraries = libraries
      end

      def browser
        return @@browser
      end

      def get name
        browser.get name
      end

      def store name , object
        browser.store name , object
      end

      def visit url
        browser.visit url
      end

      def wait
        browser.wait
      end

      def assert_location url
        assert_equal url , browser.location
      end

      def back
        browser.back
      end

      def forward
        browser.forward
      end

    end
  end
end
