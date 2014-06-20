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
    expect(@bowling_score.next_score(1)).to eq(true)
    @bowling_score.frame_score(0).should == 1
  end

  it "should accept a score of 2 and frame score should be 2" do
    expect(@bowling_score.next_score(2)).to eq(true)
    @bowling_score.frame_score(0).should == 2
  end

  it "Score for a single roll should not be more than 10" do
    expect(@bowling_score.next_score(11)).to eq(false)
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

  it "if a frame other than the 10th adds to more than 10 even when individual rolls are less than 10, next_score returns false and doesn't change frame'" do
    expect(@bowling_score.next_score(9)).to eq(true)
    expect(@bowling_score.next_score(8)).to eq(false)
    expect(@bowling_score.next_score(1)).to eq(true)
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

  it "should handle the 9th frame strike scoring correctly" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.frame_score(8).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(8).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(8).should == 30
  end

  it "should handle a spare in the ninth frame" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(9)
    @bowling_score.next_score(1)
    @bowling_score.frame_score(8).should == "/"
    @bowling_score.next_score(3)
    @bowling_score.frame_score(8).should == 13

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
    expect(@bowling_score.next_score(10)).to eq(true)
    expect(@bowling_score.next_score(10)).to eq(true)
    expect(@bowling_score.next_score(10)).to eq(true)
  end

  it "should handle a spare" do
    expect(@bowling_score.next_score(5)).to eq(true)
    expect(@bowling_score.next_score(5)).to eq(true)
    expect(@bowling_score.next_score(5)).to eq(true)
  end

  it "if two rolls < 10 dont allow a third roll" do
    expect(@bowling_score.next_score(5)).to eq(true)
    expect(@bowling_score.next_score(4)).to eq(true)
    expect(@bowling_score.next_score(5)).to eq(false)
  end

  it "should not allow the second roll to allow the frame to add to more than 10" do
    @bowling_score.next_score(5)
    expect(@bowling_score.next_score(6)).to eq(false)
    expect(@bowling_score.next_score(5)).to eq(true)
    expect(@bowling_score.next_score(5)).to eq(true)
  end

  it "should not give a score on the tenth frame if the first two rolls are strikes" do
    @bowling_score.next_score(10)
    @bowling_score.frame_score(9).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(9).should == "X"
    @bowling_score.next_score(10)
    @bowling_score.frame_score(9).should == 30
  end

  it "should handle two strikes and a number" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(5)
    @bowling_score.frame_score(9).should == 25
  end

  it "should handle a strike and a spare" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(3)
    @bowling_score.next_score(7)
    @bowling_score.frame_score(9).should == 20
  end

  it "should handle a spare and a one number less than 10" do
    @bowling_score.next_score(7)
    @bowling_score.frame_score(9).should == 7
    @bowling_score.next_score(3)
    @bowling_score.frame_score(9).should == "/"
    @bowling_score.next_score(5)
    @bowling_score.frame_score(9).should == 15
  end

  it "should handle two rolls less than ten" do
    @bowling_score.next_score(1)
    @bowling_score.next_score(0)
    @bowling_score.frame_score(9).should == 1
  end

  it "should handle a spare and a 0" do
    @bowling_score.next_score(7)
    @bowling_score.frame_score(9).should == 7
    @bowling_score.next_score(3)
    @bowling_score.frame_score(9).should == "/"
    @bowling_score.next_score(0)
    @bowling_score.frame_score(9).should == 10
  end
end

describe "Score all the things" do

  before :each do
    @bowling_score = BowlingScore.new
    # Fill the first 9 frames

  end
  it "should score a perfect game as 300" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.total_score.should == 300
  end

  it "should handle an imperfect game with a spare in the first" do
    @bowling_score.next_score(7)
    @bowling_score.next_score(3)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.total_score.should == 290
  end

  it "should handle a perfectly crappy game" do
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.next_score(0)
    @bowling_score.total_score.should == 0
  end

  it "should show the total score after 5 frames" do
    @bowling_score.next_score(1)
    @bowling_score.next_score(2)
    @bowling_score.next_score(3)
    @bowling_score.next_score(4)
    @bowling_score.next_score(5)
    @bowling_score.next_score(4)
    @bowling_score.next_score(7)
    @bowling_score.next_score(1)
    @bowling_score.next_score(2)
    @bowling_score.next_score(4)
    @bowling_score.total_score.should == 33
  end
end

describe "Max Score" do
  before :each do
    @bowling_score = BowlingScore.new
  end

  it "should have a max score available after the first frame is filled" do
    @bowling_score.next_score(1)
    @bowling_score.next_score(2)
    @bowling_score.max_score.should == 273
  end

  it "gives the correct max score on the tenth frame" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.total_score.should == 240
    @bowling_score.max_score.should == 300
  end

  it "gives a correct max score if there is a spare in the first frame" do
    @bowling_score.next_score(1)
    @bowling_score.next_score(9)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.total_score.should == 230
    @bowling_score.max_score.should == 290
  end

  it "gives a correct max score when a strike in the first roll of tenth frame" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.max_score.should == 300
  end

  it "gives a correct max score when a spare in the first rolls of tenth frame" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(10)
    @bowling_score.next_score(9)
    @bowling_score.next_score(1)
    @bowling_score.max_score.should == 280
  end

  it "gives a correct max score when a spare in the first rolls of tenth frame" do
    @bowling_score.next_score(10)
    @bowling_score.next_score(3)
    @bowling_score.max_score.should == 280
  end
end