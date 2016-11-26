=begin
                         E
           ____________________________
          |                            |
          |                            |
       ^  |                            |
       |  |                            |
   N   |  |                            |        S
     posy |                            |
          |                            |
          |                            |
          |____________________________|
          posx ----->
                        W

Plateau Size (Upper Cordinate, Lower Cordinate)
posx - Xaxis
posy - Yaxis

orientation - Robots Face(E,W,N,S)
=end
class Robot
  attr_accessor :upper_coordinate, :lower_coordinate,:posx,:posy,:orientation,:error
  INCREMENTS = {"N" => [0, 1], "E" => [1, 0], "S" => [0, -1], "W" => [-1, 0]}
  def initialize(upper_coordinate=0,lower_coordinate=0)
    @upper_coordinate = upper_coordinate
    @lower_coordinate = lower_coordinate
  end

  def setRobotPosition(position_xaxis,position_yaxis,orientation)
    # @error = "Invalid Positions/Orientation" unless position_xaxis.is_a?(Integer) || position_yaxis.is_a?(Integer) || INCREMENTS[orientation].nil?
    @posx = position_xaxis
    @posy = position_yaxis
    @orientation = orientation
    return @posx,@posy,@orientation
  end

  def moveRobot(instructions)
    if instructions.match(/[^LMR]/)
      return @error unless @error.nil?
      @error = "Invalid Instructions , Instruction should be only L , M , R"
    else
      instructions.scan(/./).each_with_index do |char,index|
        case char
          when "L"
            move_left
          when "R"
            move_right
          else
            @posx = @posx + INCREMENTS[@orientation][0]
            @posy = @posy + INCREMENTS[@orientation][1]
            if @posx > @lower_coordinate || @posy > @upper_coordinate || @posx < 0 || @posy < 0
              @error = "Cordinates Out of Bound in Instruction #{instructions[0...index]}"
              return @error
            end
        end
      end
    end
  end

  def getPosition
    puts @error
    return @error unless @error.nil?
    return @posx,@posy,@orientation
  end

  private

  def move_left
    robot_face = {"N" => "W", "E" => "N", "S" => "E", "W" => "S"}
    @orientation = robot_face[@orientation]
  end

  def move_right
    robot_face = {"N" => "E", "E" => "S", "S" => "W", "W" => "N"}
    @orientation = robot_face[@orientation]
  end
end

# robot = Robot.new(5,5)
# robot.setRobotPosition(1,2,"N")
# print robot.moveRobot("LMLMLMLMM")
# puts robot.getPosition
# #
#
#
# robot = Robot.new(5,5)
# robot.setRobotPosition(3,3,"E")
# robot.moveRobot("MMRMMRMRRM")
# puts robot.getPosition

