require 'spec_helper'
require_relative "../robot"

describe "Robot tests" do
  before(:all) do
    @robot = Robot.new(5,5)
  end

  describe "#new" do
    it "takes two parameters and returns a Robot object" do
      expect(@robot).to be_a Robot
    end
  end

  describe "#SetPosition" do
    it "sets the position" do
      expect(@robot.setRobotPosition(1,2,"N")).to eq([1,2,"N"])
    end
  end

  describe "#MoveRobotError" do
    it "throws error" do
      expect(@robot.moveRobot("LMMMML")).to eq("Cordinates Out of Bound in Instruction LM")
    end
  end

  describe "#MoveRobotSuccess" do
    it "Successfully Iterates" do
      expect(@robot.moveRobot("L")).to eq(["L"])
    end
  end

end

describe "GetResult " do
  before(:all) do
    @robot = Robot.new(5,5)
    @robot.setRobotPosition(1,2,"N")
    @robot.moveRobot("LMLMLMLMM")
  end

  describe "#Gets Position" do
    it "Successfully Iterates" do
      expect(@robot.getPosition).to eq([1,3,"N"])
    end
  end
end