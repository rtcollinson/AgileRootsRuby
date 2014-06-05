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
      if frame == 9
        if frame_score[1] == nil || frame_score[2] == nil
          return "X"
        else
          return frame_score[0] + frame_score[1] + frame_score[2]
        end
      elsif frame == 8
        if @game_frame[frame + 1][0] == nil || @game_frame[frame + 1][1] == nil
          return "X"
        else
          return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 1][1]
        end
      elsif @game_frame[frame + 1][0] == 10 && @game_frame[frame + 2][0] == 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 2][0]
      elsif @game_frame[frame + 1][0] == 10 && @game_frame[frame + 2][0] != nil && @game_frame[frame + 2][0] < 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 2][0]
      elsif @game_frame[frame + 1][0] != nil && @game_frame[frame + 1][0] < 10 && @game_frame[frame + 1][1] != nil && @game_frame[frame + 1][1] < 10
        return frame_score[0] + @game_frame[frame + 1][0] + @game_frame[frame + 1][1]
      end
      return "X"
    elsif frame == 9
      if frame_score[0] != nil && frame_score[1] != nil && frame_score[2] == nil && frame_score[0] + frame_score[1] == 10
        return "/"
      elsif frame_score[0] != nil && frame_score[1] != nil && frame_score[2] != nil && frame_score[0] + frame_score[1] == 10
        return frame_score[0] + frame_score[1] + frame_score[2]
      end
    elsif frame_score[0] != nil && frame_score[1] != nil && frame_score[0] < 10 && frame_score[0] + frame_score[1] == 10
      if @game_frame[frame + 1][0] != nil
        return frame_score[0] + frame_score[1] + @game_frame[frame + 1][0]
      end
      return "/"
    end
    (frame_score[0] == nil ? 0 : frame_score[0]) + (frame_score[1] == nil ? 0 : frame_score[1])
  end

  def total_score
    score = 0
    (0..9).each do |frame|
      temp = frame_score(frame)
      temp.is_a?(Fixnum) ? score = score + temp : score = score
    end
    score
  end

  def max_score
    score = 0
    (0..9).each do |frame|
      if @game_frame[frame][0] == nil
        score = score + 30
      elsif @game_frame[frame][0] == 10
        score = score + 30
      elsif @game_frame[frame][0] < 10 && @game_frame[frame][1] == nil
        score = score + 20
      elsif @game_frame[frame][0] + @game_frame[frame][1] == 10
        score = score + 20
      else
        score = score + frame_score(frame)
      end
    end
    score
  end
end

