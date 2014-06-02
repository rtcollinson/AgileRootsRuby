require 'rspec'
require './bowling.rb'

describe BowlingScore do
  before :each do
    @bowling_score = BowlingScore.new
  end

  it "should create a bowling scorer object" do
    @bowling_score.should_not be_nil
  end

  it "should accept the result of a roll and return that score as last score" do
    @bowling_score.next_score(1).should be_true
    @bowling_score.last_score.should == 1
  end

  it "should accept a score of 2 and last score should be 2" do
    @bowling_score.next_score(2).should be_true
    @bowling_score.last_score.should == 2
  end

  it "Score for a single roll should not be more than 10" do
    @bowling_score.next_score(11).should be_false
  end

  it "should have a score of 0 for current frame" do
    @bowling_score.frame_score(0).should == 0
  end

  it "should return a 1 after the first '1' roll in a frame" do
    @bowling_score.next_score(1)
    @bowling_score.frame_score(0).should == 1
    @bowling_score.next_score(3)
    @bowling_score.frame_score(0).should == 4
    @bowling_score.next_score(5)
    @bowling_score.frame_score(1).should == 5
  end

  #public void BowlingScoreByFrame()
  #{
  #    BowlingScore curScore = new BowlingScore();
  #curScore.nextScore(1);
  #assertEquals("After one roll, current frame should be 1", 1, curScore.thisFrameScore());
  #curScore.nextScore(1);
  #assertEquals("Current frame should have a score of 2", 2, curScore.thisFrameScore());
  #BowlingScore strikeCase = new BowlingScore();
  #strikeCase.nextScore(10);
  #assertEquals("If 10 on first roll, then previous frame should show 10", 10, strikeCase.prevFrame());
  #
  #}
  #
  #@Test
  #public void ChangeFrame()
  #{
  #    BowlingScore curScore = new BowlingScore();
  #curScore.nextScore(10);
  #assertEquals("If strike then it should move to next frame",0,curScore.thisFrameScore());
  #}


end