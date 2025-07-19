SmartAgent::Tool.define :read_file do
  desc "读取指定路径的文本文件，返回其内容"
  param_define :path, "要读取文件的相对路径", :string
  tool_proc do
    path = input_params["path"]
    content = File.read(path)
    "成功读取文件 #{path}，内容如下：\n#{content}"
  rescue => e
    "读取文件 #{path} 时出错：#{e.message}"
  end
end
