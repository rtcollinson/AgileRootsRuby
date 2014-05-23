class BowlingScore

  @current_score = nil
  @current_frame = [-1, -1]
  @game_frame = Array.new
  @game_frame << @current_frame
  @frame = 0

  def next_score score

    if score < 11
      @current_score = score
      if score == 10
        @current_frame[0] = @current_score
        @game_frame[@frame] << @current_frame
        change_frame

      elsif @current_frame[0] < 0
        @current_frame[0] = @current_score
        @game_frame[frame] << @current_frame

      elsif @current_frame[0] > -1 && @current_frame[1] < 0
        @current_frame[1] = @current_score
        @game_frame[frame] << @current_frame

      else
        return false
      end
      return true
    end
    return false
  end

  def last_score
    return @current_score
  end

  def this_frame_score
    frame_score = @game_frame[@frame]
    if frame_score[0] + frame_score[1] == -2
      return 0
    elsif frame_score[0] > -1 && frame_score[1] < 0
      return frame_score[1]
    else
      return frame_score[0] + frame_score[1]
    end
  end

  def changeFrame
    @frame = @frame + 1
    @current_frame[0] = -1
    @current_frame[1] = -1
    @gameFrame[@frame] << @current_frame
  end

  def prev_frame
    previous_frame = @frame -1
    puts @game_frame[previous_frame].inspect
    return 0
  end


end

