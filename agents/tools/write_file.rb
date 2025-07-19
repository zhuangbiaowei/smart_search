SmartAgent::Tool.define :write_file do
  desc "将给定内容写入指定路径的文件（若文件已存在则覆盖）"
  param_define :path, "要写入文件的相对路径", :string
  param_define :content, "要写入的文本内容", :string
  tool_proc do
    path = input_params["path"]
    content = input_params["content"]
    File.write(path, content)
    "已成功将内容写入文件 #{path}"
  rescue => e
    "写入文件 #{path} 时出错：#{e.message}"
  end
end
