require "thor"

module TflStatus
  class CLI < Thor
    ValidLineArguments = [
      "bakerloo", "central", "circle", "district", "docklands",
      "docklands", "hammersmithcity", "jubilee", "metropolitan",
      "northern", "piccadilly", "overground", "tube", "victoria",
      "waterloocity"
    ]

    package_name "TFL Status Checker"

    desc "all", "Checks the status of all TFL lines"
    def all
      TflStatus::Checker.run("all")
    end

    desc "line LINE_NAME", "Checks the status of a TFL line, by name"
    def line(name, *names)
      lines = names.push(name)
      verify_lines(lines)
      TflStatus::Checker.run(lines)
    end

    default_task :all

    protected

    def verify_lines(lines)
      lines -= ValidLineArguments
      raise Thor::Error, "Invalid lines supplied: '#{lines.join(",")}'." unless lines.length == 0
    end
  end
end
