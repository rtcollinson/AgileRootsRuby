class BowlingScore

  def initialize
  @current_score = nil
  @game_frame = Array.new(10) {Array.new(2)}
  @frame = 0
  @roll = 0
  end

  def next_score score
    if score < 11
      @current_score = score
      if score == 10
        @game_frame[@frame][@roll] = @current_score
        @frame = @frame + 1
      elsif @roll == 0
        @game_frame[@frame][@roll] = @current_score
        @roll = 1
      elsif @roll == 1
        @game_frame[@frame][@roll] = @current_score
        @roll = 0
        @frame = @frame + 1

      else
        return false
      end
      return true
    end
    false
  end

  def last_score
    @current_score
  end

  def frame_score frame
    frame_score = @game_frame[frame]
    (frame_score[0] == nil ? 0 : frame_score[0]) + (frame_score[1] == nil ? 0 : frame_score[1])
  end

  def prev_frame
    previous_frame = @frame -1
    puts @game_frame[previous_frame].inspect
    0
  end


end

