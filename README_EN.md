En/[中文](./README.md)

# Smart Search System

A Ruby-based intelligent search agent that leverages large language models and multi-tool integration to provide deep research capabilities. The system uses a three-stage process (pre-search, deep search, information synthesis) to generate high-quality search reports.

## 🌟 Core Features

- **Three-stage intelligent search flow**: Pre-search → Deep Search → Information Synthesis
- **Multi-tool integration**: Integrates various search and data acquisition tools
- **Large language model powered**: Based on advanced models like DeepSeek
- **Real-time interactive interface**: Command-line interaction experience
- **Automatic report generation**: Automatically generates Markdown reports after search completion
- **MCP protocol support**: Extends functionality through Model Context Protocol

## 🏗️ System Architecture

### Core Components

- [`search.rb`](search.rb): Main program entry point, provides interactive CLI
- [`agents/smart_search.rb`](agents/smart_search.rb): Core logic of intelligent search agent
- [`agents/workers/`](agents/workers/): Worker process definitions
  - [`pre_search.rb`](agents/workers/pre_search.rb): Pre-search phase
  - [`smart_search.rb`](agents/workers/smart_search.rb): Deep search phase
  - [`summary.rb`](agents/workers/summary.rb): Information synthesis phase
- [`agents/mcps/all.rb`](agents/mcps/all.rb): MCP server configuration
- [`config/agent.yml`](config/agent.yml): Agent configuration file

### Workflow

1. **Pre-search phase**: Analyze user query, develop search strategy
2. **Deep search phase**: Execute actual search, collect relevant information
3. **Information synthesis phase**: Integrate search results, generate final report

## 🚀 Quick Start

### Requirements

- Ruby 3.0+
- Bundler

### Installation

1. Clone the project
   ```bash
   git clone <repository-url>
   cd smart_search
   ```

2. Install dependencies
   ```bash
   bundle install
   ```

3. Run the system
   ```bash
   ruby search.rb
   ```

### Usage

After starting the system, you'll see an interactive prompt:
```
欢迎使用智慧搜索
您可以直接输入提问
或输入 'exit' 来退出程序。
> 
```

Simply enter your search query, and the system will automatically execute the three-stage search and generate a report.

## 🛠️ Technology Stack

- **Language**: Ruby
- **Core Frameworks**: SmartAgent, SmartPrompt
- **HTTP Client**: Built-in (via mcp-sdk.rb)
- **Data Storage**: PostgreSQL (via Sequel ORM)
- **Web Service**: Sinatra + Puma

## 📊 Project Structure

```
smart_search/
├── search.rb                 # Main program entry
├── Gemfile                   # Ruby dependency management
├── config/
│   ├── agent.yml            # Agent configuration
│   └── config.yml           # Engine configuration
├── agents/
│   ├── smart_search.rb      # Intelligent search agent
│   ├── workers/             # Worker processes
│   │   ├── pre_search.rb
│   │   ├── smart_search.rb
│   │   └── summary.rb
│   ├── templates/           # Prompt templates
│   ├── tools/               # Tool definitions
│   └── mcps/                # MCP server configuration
├── log/                     # Log files
└── reports/                 # Generated reports
```

## 🔧 Configuration

### Agent Configuration (config/agent.yml)

```yaml
logger_file: "./log/agent.log"      # Log file path
engine_config: "./config/config.yml" # Engine configuration file
agent_path: "./agents"              # Agent directory
tools_path: "./agents/tools"        # Tools directory
mcp_path: "./agents/mcps"           # MCP directory
```

### MCP Integration

The system integrates external tools and services through MCP (Model Context Protocol), configured in [`agents/mcps/all.rb`](agents/mcps/all.rb).

## 📈 Report Generation

After each search, the system automatically generates a Markdown report file with the naming format:
```
report_[timestamp].md
```

Reports contain:
- Search topic
- Detailed analysis
- Relevant data and information
- Conclusions and recommendations

## 🤝 Contributing

Issues and Pull Requests are welcome to help improve the system.

## 📄 License

MIT License