require 'rspec'
require './bowling.rb'

describe BowlingScore do
  before(:each) do
    @bowling_score = BowlingScore.new
  end

  it "should create a bowling scorer object" do
    @bowling_score.should_not be_nil
  end

  it "Score should accept the result of a roll" do
    @bowling_score.next_score(1).should be_true
  end
  #public class BowlingScoreTest{
  #  @Test
  #  public void BowlingScoreExists()
  #  {
  #      BowlingScore curScore = new BowlingScore();
  #  assertNotNull("It should create a bowling scorer object", curScore);
  #}
  #
  #@Test
  #public void BowlingScoreAcceptsScores()
  #{
  #    BowlingScore curScore = new BowlingScore();
  #assertTrue("Score should accept the result of a roll", curScore.nextScore(1));
  #assertEquals("Last score should equal 1", 1, curScore.lastScore());
  #assertTrue("Score should accept a 2", curScore.nextScore(2));
  #assertEquals("Last score should equal 2", 2, curScore.lastScore());
  #assertFalse("Score for a single roll should not be more than 10", curScore.nextScore(11));
  #}
  #
  #@Test
  #public void BowlingScoreByFrame()
  #{
  #    BowlingScore curScore = new BowlingScore();
  #assertEquals("Current frame should have a score of 0", 0, curScore.thisFrameScore());
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