require "colorize"

module TflStatus
  class Renderer
    LineColours = {
      "bakerloo" => :light_red,
      "central" => :red,
      "circle" => :yellow,
      "district" => :green,
      "docklands" => :cyan,
      "hammersmithcity" => :light_magenta,
      "jubilee" => :light_black,
      "metropolitan" => :magenta,
      "northern" => :black,
      "overground" => :yellow,
      "piccadilly" => :blue,
      "victoria" => :light_blue,
      "waterloocity" => :light_cyan
    }

    def display(statuses)
      lines = statuses["lines"];
      pad_size_name = locate_longest(lines, "name").length + 1
      pad_size_status = locate_longest(lines, "status").length + 1

      lines.each { |line|
        display_line(line, pad_size_name, pad_size_status)
      }
    end

    def display_line(line, pad_size_name, pad_size_status)
      name = " " + line["name"].ljust(pad_size_name)
      status = " " + line["status"].capitalize.ljust(pad_size_status)

      name_coloured = name.colorize(build_name_colorize_profile(line))
      status_coloured = status.colorize(build_status_colorize_profile(line))

      puts "#{name_coloured}#{status_coloured}"
    end

    def build_name_colorize_profile(line)
      id = line["id"]
      
      profile = {}
      profile[:color] = :white
      profile[:background] = LineColours[id]
      profile[:mode] = :bold

      profile
    end

    def build_status_colorize_profile(line)
      profile = {}
      profile[:background] = :white

      if line["status"] == "good service"
        profile[:color] = :black
      else
        profile[:color] = :blue
        profile[:mode] = :bold
      end

      profile
    end

    def locate_longest(lines, field)
      lines.max_by{|line| line[field].length}[field]
    end
  end
end
