require "smart_prompt"
require "smart_agent"
require "readline"

engine = SmartAgent::Engine.new("./config/agent.yml")
agent = engine.build_agent(:smart_search, tools: [:read_file, :write_file], mcp_servers: [:all])

status = nil
agent.on_reasoning do |reasoning_content|
  if status != :reasoning
    print "开始推理: "
    status = :reasoning
  end
  print reasoning_content.dig("choices", 0, "delta", "reasoning_content")
  if reasoning_content.dig("choices", 0, "finish_reason") == "stop"
    print "\n"
    status = nil
  end
end

agent.on_content do |content|
  if status != :content
    print "开始回答： "
    status = :content
  end
  print content.dig("choices", 0, "delta", "content")
  if content.dig("choices", 0, "finish_reason") == "stop"
    print "\n"
    status = nil
  end
end

agent.on_tool_call do |msg|
  puts "工具调用： #{msg}"
end

class Interaction
  def initialize(agent)
    @agent = agent
  end

  def start
    puts "欢迎使用智慧搜索"
    puts "您可以直接输入提问"
    puts "或输入 'exit' 来退出程序。"

    loop do
      input = Readline.readline("> ", true)
      break if input.nil?
      case input
      when "exit"
        puts "感谢使用,再见!"
        break
      else
        @agent.please(input)
      end
    end
  end
end

Interaction.new(agent).start
