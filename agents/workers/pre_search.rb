SmartPrompt.define_worker :pre_search do
  #use "SiliconFlow"
  #model "moonshotai/Kimi-K2-Instruct"
  #model "deepseek-ai/DeepSeek-V3"
  use "deepseek"
  model "deepseek-chat"
  sys_msg "你是一个搜索专家，能够根据需要调用合适的搜索工具解决用户的问题。在调用工具时不要使用`company-search`！不要使用`scrape`！不要使用`sequentialthinking`！请输出完全正确的JSON格式！"
  prompt :pre_search, { text: params[:text] }
  response = send_msg
  response
end
