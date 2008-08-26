module Caculo
  class JQueryObject
    attr_accessor :javascript
    
    def self.method_missing name , *params
      obj = JQueryObject.new("")
      obj.javascript = "jQuery.#{name}(#{params.join(" , ").to_js} , function(content){ jQuery(document.body).append( content );   } )"
      obj
    end
    
    def self.to_param obj
      if obj.is_a? String
        return obj.to_js
      elsif obj.is_a? Array
        return obj.collect{|o| self.to_param( o ) }.join(" , ")
      else
        return obj.to_s
      end
    end
    
    def initialize selector=nil
      if selector.nil?
        @javascript = "window.jQuery(window.document)"      
      elsif selector.kind_of?( String )
        @javascript = "window.jQuery(#{selector.to_js})"
      else
        @javascript = "window.jQuery(#{selector})"
      end

      def method_missing name , *params
        obj = JQueryObject.new( "" )

        js_parameters = JQueryObject.to_param( params )

        obj.javascript = "#{@javascript}.#{name.to_s}( #{js_parameters} )"
        return obj
      end

      def to_s
        return @javascript
      end
    end
  end
end
