require 'rubygems'
require 'rbosa'


module Caculo
  class Safari < Browser

    def page_loaded?
      result = @application.do_javascript( 'document.readyState' , @window.document )
      return result == "complete"
    end

    def initialize
      super
      @application = OSA.app('safari')
      # puts @application
      @application.make(OSA::Safari::Document)      
      @window = @application.windows[-1]
      
      @application.do_javascript( 'window.location=\'about:config\'' , @window.document )      
      wait_until { page_loaded? }
    end

    def send_command( cmd )       
      @application.do_javascript( cmd , @window.document ).to_s
    end

    def location= url
      @window.document.url = url
    end

    def location
      @window.document.url
    end

    def current_window
      "window"
    end

  end
end