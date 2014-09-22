class AppDelegate

  class << self
    include CDQ

    def test
      cdq.contexts.new(NSPrivateQueueConcurrencyType) do
        @context = cdq.contexts.current
      end

      @context.performBlock -> do
        #  using the do/end notation doesn't work here :(
        # must be a rubymotion bug
        cdq.contexts.push(@context) {

          @context.save
        }
      end
    end
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true
  end


end
