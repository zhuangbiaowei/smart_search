[En](./README_EN.md)/中文

# 智慧搜索系统 (Smart Search System)

智慧搜索系统是一个基于 Ruby 构建的智能搜索代理，利用大语言模型和多工具集成来提供深度研究能力。该系统通过三阶段流程（预搜索、深度搜索、信息汇总）生成高质量的搜索报告。

## 🌟 核心特性

- **三阶段智能搜索流程**：预搜索 → 深度搜索 → 信息汇总
- **多工具集成**：集成多种搜索和数据获取工具
- **大语言模型驱动**：基于 DeepSeek 等先进模型
- **实时交互式界面**：命令行交互体验
- **自动报告生成**：搜索完成后自动生成 Markdown 格式报告
- **MCP 协议支持**：通过 Model Context Protocol 扩展功能

## 🏗️ 系统架构

### 核心组件

- [`search.rb`](search.rb): 主程序入口，提供交互式命令行界面
- [`agents/smart_search.rb`](agents/smart_search.rb): 智能搜索代理的核心逻辑
- [`agents/workers/`](agents/workers/): 工作进程定义
  - [`pre_search.rb`](agents/workers/pre_search.rb): 预搜索阶段
  - [`smart_search.rb`](agents/workers/smart_search.rb): 深度搜索阶段
  - [`summary.rb`](agents/workers/summary.rb): 信息汇总阶段
- [`agents/mcps/all.rb`](agents/mcps/all.rb): MCP 服务器配置
- [`config/agent.yml`](config/agent.yml): 代理配置文件

### 工作流程

1. **预搜索阶段**：分析用户查询，制定搜索策略
2. **深度搜索阶段**：执行实际搜索，收集相关信息
3. **信息汇总阶段**：整合搜索结果，生成最终报告

## 🚀 快速开始

### 环境要求

- Ruby 3.0+
- Bundler

### 安装步骤

1. 克隆项目
   ```bash
   git clone <repository-url>
   cd smart_search
   ```

2. 安装依赖
   ```bash
   bundle install
   ```

3. 运行系统
   ```bash
   ruby search.rb
   ```

### 使用方法

启动系统后，您将看到交互式提示符：
```
欢迎使用智慧搜索
您可以直接输入提问
或输入 'exit' 来退出程序。
> 
```

直接输入您的搜索查询，系统将自动执行三阶段搜索并生成报告。

## 🛠️ 技术栈

- **语言**: Ruby
- **核心框架**: SmartAgent, SmartPrompt
- **HTTP 客户端**: 内置 (通过 mcp-sdk.rb)
- **数据存储**: PostgreSQL (通过 Sequel ORM)
- **Web 服务**: Sinatra + Puma

## 📊 项目结构

```
smart_search/
├── search.rb                 # 主程序入口
├── Gemfile                   # Ruby 依赖管理
├── config/
│   ├── agent.yml            # 代理配置
│   └── config.yml           # 引擎配置
├── agents/
│   ├── smart_search.rb      # 智能搜索代理
│   ├── workers/             # 工作进程
│   │   ├── pre_search.rb
│   │   ├── smart_search.rb
│   │   └── summary.rb
│   ├── templates/           # 提示模板
│   ├── tools/               # 工具定义
│   └── mcps/                # MCP 服务器配置
├── log/                     # 日志文件
└── reports/                 # 生成的报告
```

## 🔧 配置说明

### 代理配置 (config/agent.yml)

```yaml
logger_file: "./log/agent.log"      # 日志文件路径
engine_config: "./config/config.yml" # 引擎配置文件
agent_path: "./agents"              # 代理目录
tools_path: "./agents/tools"        # 工具目录
mcp_path: "./agents/mcps"           # MCP 目录
```

### MCP 集成

系统通过 MCP (Model Context Protocol) 集成外部工具和服务，配置在 [`agents/mcps/all.rb`](agents/mcps/all.rb) 中定义。

## 📈 报告生成

每次搜索完成后，系统会自动生成 Markdown 格式的报告文件，命名格式为：
```
report_[timestamp].md
```

报告包含：
- 搜索主题
- 详细分析
- 相关数据和信息
- 结论和建议

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 来帮助改进系统。

## 📄 许可证

MIT License