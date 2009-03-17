module FFMpegCommand
  extend self
  
  @commands = []
  
  def <<(cmd)
    @commands << cmd
  end
  
  def add_at(cmd, pos)
    @commands.insert(pos, cmd)
  end
  
  def clear
    @commands.clear
  end
  
  def command(prefix="")
    returning prefix.to_s do |prefix|
      @commands.each do |command|
        prefix << " #{command}"
      end
    end
  end
end