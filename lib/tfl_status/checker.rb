module TflStatus
  class Checker
    def self.run(*lines)
      fetcher = TflStatus::Fetcher.new
      renderer = TflStatus::Renderer.new

      statuses = fetcher.retrieve(lines)
      renderer.display(statuses)
    end
  end
end
