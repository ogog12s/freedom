# 共有資源のアクセスを制御できる
# スレッドセーフにしないといけない

class MasterBall
  @instance = nil
  @mutex = Mutex.new

  def self.instance
    return @instance if @instance

    @mutex.synchronize do
      @instance ||= new(false)
    end

    @instance
  end

  def throw
    unless @is_used
      puts 'マスターボールを投げた！'
      @is_used = true
    else
      puts 'マスターボールが、、、ない'
    end
  end

  private

  def initialize(is_used)
    @is_used = is_used
  end
end


threads = []

5.times do
  threads << Thread.new do
    MasterBall.instance.throw
  end
end

threads.each(&:join)
# マスターボールを投げた！
# マスターボールが、、、ない
# マスターボールが、、、ない
# マスターボールが、、、ない
# マスターボールが、、、ない
