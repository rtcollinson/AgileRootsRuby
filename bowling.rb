class BowlingScore

  def initialize
    @game_frame = Array.new(10) { Array.new(3) }
    @frame = 0
    @roll = 0
  end

  def next_score score
    if score < 11
      if @frame == 9
        if @roll < 2 && score < 11
          if @game_frame[@frame][0] != nil && @game_frame[@frame][0] + score < 11
            @game_frame[@frame][@roll] = score
            @roll = @roll + 1
            return true
          elsif @game_frame[@frame][0] == nil || @game_frame[@frame][0] == 10
            @game_frame[@frame][@roll] = score
            @roll = @roll + 1
            return true
          end
        elsif @roll == 2 && @game_frame[@frame][0] != nil && @game_frame[@frame][1] != nil &&  @game_frame[@frame][0] + @game_frame[@frame][1] > 9
          @game_frame[@frame][@roll] = score
          return true
        end
        return false
      end
      unless @roll == 1 && @game_frame[@frame][0] + score > 10
        if score == 10 && @roll == 0
          @game_frame[@frame][@roll] = score
          @frame = @frame + 1
        elsif @roll == 0
          @game_frame[@frame][@roll] = score
          @roll = 1
        elsif @roll == 1
          @game_frame[@frame][@roll] = score
          @roll = 0
          @frame = @frame + 1
        else
          return false
        end
        return true
      end
    end
    false
  end

  def frame_score frame
    frame_score = @game_frame[frame]
    if frame_score[0] == 10
      if @game_frame[frame + 1][0] == 10 && @game_frame[frame + 2][0] == 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 2][0]
      elsif @game_frame[frame + 1][0] == 10 && @game_frame[frame + 2][0] != nil && @game_frame[frame + 2][0] < 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 2][0]
      elsif @game_frame[frame + 1][0] != nil && @game_frame[frame + 1][0] < 10 && @game_frame[frame + 1][1] != nil && @game_frame[frame + 1][1] < 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 1][1]
      end
      return "X"
    elsif frame_score[0] != nil && frame_score[1] != nil && frame_score[0] < 10 && frame_score[0] + frame_score[1] == 10
      if @game_frame[frame + 1][0] != nil
        return frame_score[0] + frame_score[1] + @game_frame[frame + 1][0]
      end
      return "/"
    end
    (frame_score[0] == nil ? 0 : frame_score[0]) + (frame_score[1] == nil ? 0 : frame_score[1])
  end

  def prev_frame
    previous_frame = @frame -1
    puts @game_frame[previous_frame].inspect
    0
  end


end

