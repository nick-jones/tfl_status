module TflStatus
  class Checker
    def self.run(*lines, show_reasons)
      fetcher = TflStatus::Fetcher.new
      renderer = TflStatus::Renderer.new

      statuses = fetcher.retrieve(lines)
      renderer.display(statuses, show_reasons)
    end
  end
end
