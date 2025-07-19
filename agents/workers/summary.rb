SmartPrompt.define_worker :summary do
  use "SiliconFlow"
  model "Qwen/Qwen3-30B-A3B"
  #model "moonshotai/Kimi-K2-Instruct"
  #model "Qwen/Qwen3-8B"
  #use "deepseek"
  #model "deepseek-chat"
  sys_msg "你是一个搜索专家，能够根据搜索到的信息，给出最后的汇总报告。" # 并将报告内容，用工具`write_file`，写入文件`report.md`
  prompt :summarize, { text: params[:text] }
  send_msg
end
