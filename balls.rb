class Ball
    attr_reader :color
    def initialize(color)
        @color = color;
    end
end

class Bag

    def initialize(balls = nil)
        @balls = balls ? balls : fill
        @balls.shuffle!
    end
    
    def fill
        balls = []
        8.times do
            balls << Ball.new("red")
        end
        11.times do
            balls << Ball.new("yellow")
        end
        return balls
    end

    def add_ball(ball)
        @balls << ball
    end

    def remove_balls()
        removed = []
        removed << (@balls.delete_at rand(@balls.length))
        removed << (@balls.delete_at rand(@balls.length))
        return removed
    end

    def get_ball_colors
        @balls.each.with_index { |ball, index|
            puts "#{ball.color} - #{index}"
        }
    end

    def has_balls?
        return @balls.length > 0
    end
end

$yellow_count = 0
$red_count = 0

def do_the_thing
    bag = Bag.new()
    balls = []
    iterations = 0
    while bag.has_balls? do
        balls = bag.remove_balls
        balls.reject! {| ball | ball.nil?}
        break if balls.length == 1
        if balls[0].color == balls[1].color
            bag.add_ball(Ball.new("yellow"))
        else
            bag.add_ball(Ball.new("red"))
        end
        iterations += 1
    end
    
    $yellow_count += 1 if balls[0].color == "yellow"
    $red_count += 1 if balls[0].color == "red"
    return iterations
end

1_000.times do
    puts "Test took #{do_the_thing} iterations"
end

puts "Ran the test 1k times \n Last ball yellow : #{$yellow_count} \n Last ball red : #{$red_count}"

