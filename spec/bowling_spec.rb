require 'rspec'
require './bowling.rb'

describe BowlingScore do
  before :each do
    @bowling_score = BowlingScore.new
  end

  it "should create a bowling scorer object" do
    @bowling_score.should_not be_nil
  end

  it "should accept the result of a roll and return that score as the frame score" do
    @bowling_score.next_score(1).should be_true
    @bowling_score.frame_score(0).should == 1
  end

  it "should accept a score of 2 and frame score should be 2" do
    @bowling_score.next_score(2).should be_true
    @bowling_score.frame_score(0).should == 2
  end

  it "Score for a single roll should not be more than 10" do
    @bowling_score.next_score(11).should be_false
  end

  it "should have a score of 0 for current frame" do
    @bowling_score.frame_score(0).should == 0
  end

  it "should return the correct score for a frame under 10 pins" do
    @bowling_score.next_score(1)
    @bowling_score.frame_score(0).should == 1
    @bowling_score.next_score(3)
    @bowling_score.frame_score(0).should == 4
    @bowling_score.next_score(5)
    @bowling_score.frame_score(1).should == 5
    @bowling_score.next_score(3)
    @bowling_score.frame_score(1).should == 8
    @bowling_score.next_score(2)
    @bowling_score.next_score(4)
    @bowling_score.frame_score(2).should == 6
    @bowling_score.frame_score(1).should == 8
    @bowling_score.frame_score(0).should == 4
  end

  it "should switch frames when a strike is rolled" do
    @bowling_score.next_score(10)
    @bowling_score.frame_score(0).should == "X"
  end

  #it "should account for spares when all ten pins are down in a frame" do
  #  @bowling_score.next_score(10)
  #  @bowling_score.frame_score(0).should == 10
  #end

  it "if a frame other than the 10th adds to more than 10 even when individual rolls are less than 10, next_score returns false and doesn't change frame'" do
    @bowling_score.next_score(9).should be_true
    @bowling_score.next_score(8).should be_false
    @bowling_score.next_score(1).should be_true
    @bowling_score.frame_score(0).should == "/"
  end

  it "should not show a score for a strike frame until two more rolls have been scored, turkey" do
    @bowling_score.next_score(10)
    @bowling_score.frame_score(0).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(0).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(0).should == 30
  end

  it "should not show a score for a strike until two more rolls are scored, one strike , one not" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(3)
    @bowling_score.frame_score(0).should == 23
  end

  it "should not show a score for a strike until two more rolls are scored, neither strikes" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(5)
    @bowling_score.next_score(2)
    @bowling_score.frame_score(0).should == 17
  end

  it "should handle a strike plus a spare" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(5)
    @bowling_score.next_score(5)
    @bowling_score.frame_score(0).should == 20
  end

  it "should not score a spare until the next roll after the spare frame" do
    @bowling_score.next_score(1)
    @bowling_score.next_score(9)
    @bowling_score.frame_score(0).should == "/"
    @bowling_score.next_score(3)
    @bowling_score.frame_score(0).should == 13
  end

  it "should not score a spare until the next roll after the spare frame, 0 then 10" do
    @bowling_score.next_score(0)
    @bowling_score.next_score(10)
    @bowling_score.frame_score(0).should == "/"
    @bowling_score.next_score(3)
    @bowling_score.frame_score(0).should == 13
  end


end

describe "TenthFrame" do
  before :each do
    @bowling_score = BowlingScore.new
    # Fill the first 9 frames
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
  end

  it "should allow you to have three strikes in the 10th frame" do
    @bowling_score.next_score(10).should be_true
    @bowling_score.next_score(10).should be_true
    @bowling_score.next_score(10).should be_true
  end

  it "should handle a spare" do
    @bowling_score.next_score(5).should be_true
    @bowling_score.next_score(5).should be_true
    @bowling_score.next_score(5).should be_true
  end

  it "if two rolls < 10 dont allow a third roll" do
    @bowling_score.next_score(5).should be_true
    @bowling_score.next_score(4).should be_true
    @bowling_score.next_score(5).should be_false
  end

  it "should not allow the second roll to allow the frame to add to more than 10" do
    @bowling_score.next_score(5)
    @bowling_score.next_score(6).should be_false
    @bowling_score.next_score(5).should be_true
    @bowling_score.next_score(5).should be_true
  end


end