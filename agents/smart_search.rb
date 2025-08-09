SmartAgent.define :smart_search do
  puts "第一阶段：预搜索"
  question = params[:text]
  result = call_worker(:pre_search, params, with_tools: true, with_history: true)
  if result.call_tools
    call_tools(result)
    params[:text] = "请输出一份搜索规划"
    result = call_worker(:pre_search, params, with_tools: true, with_history: true)
  end
  puts "搜索规划如下："
  puts result.content
  params[:text] = result.content
  puts "\n\n第二阶段：深入搜索"
  SmartAgent.prompt_engine.clear_history_messages
  result = call_worker(:smart_search, params, with_tools: true, with_history: true)
  if result.call_tools
    call_tools(result)
  end
  puts "\n\n第三阶段：汇总信息"
  params[:text] = question
  result = call_worker(:summary, params, with_tools: false, with_history: true)
  file_name = "reports/report_#{Time.now.to_i}.md"
  f = File.new(file_name, "w")
  f.puts(result.content)
  f.close
  puts "已经将报告写入：#{file_name}"
  result.content
  SmartAgent.prompt_engine.clear_history_messages
end
