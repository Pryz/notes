``` ruby
class MethodLogger
  def log_method(klass, method_name)
    klass.class_eval do
      alias_method "#{method_name}_original", method_name
      define_method method_name do |*args, &block|
        puts "#{Time.now}: Called #{method_name}"
        send "#{method_name}_original", *args, &block
      end
    end
  end
end

class Hello
  def say_world
    puts "Hello world"
  end
end

# To use it
logger = MethodLogger.new
logger.log_method(Hello, :say_world)

Hello.new.say_world
```
