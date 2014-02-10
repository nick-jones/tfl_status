require "thor"

module TflStatus
  class CLI < Thor
    VALID_LINES = %w(
      bakerloo central circle district docklands docklands
      hammersmithcity jubilee metropolitan northern
      piccadilly overground tube victoria waterloocity
    )

    package_name "TFL Status Checker"

    desc "check [<line-1> <line-2>..]", "Checks the status of TFL lines"
    def check(*lines)
      lines ||= "all"
      verify_lines(lines)
      TflStatus::Checker.run(lines)
    end

    default_task :check

    protected

    def verify_lines(lines)
      lines -= VALID_LINES
      raise Thor::Error, "Invalid lines supplied: '#{lines.join(",")}'." unless lines.length == 0
    end
  end
end
