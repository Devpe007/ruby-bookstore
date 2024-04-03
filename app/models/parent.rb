class Parent
    attr_accessor :child
    delegate :love, to: :child, prefix: true

    def initialize(child)
        @child = child
    end
end

class Child
    def love
        puts "meus pais me amam!"
    end
end