---
layout: default
title: Artificial intelligence (AI)
---
# Artificial intelligence (AI)

## Cloud AI platforms
- [ChatGPT](https://chatgpt.com/)
- [Claude (Anthropic)](https://claude.com/)
- [Copilot](https://copilot.microsoft.com)
- [DeepSeek](https://chat.deepseek.com/)
- [Gemini](https://gemini.google.com)
- [NotebookLM](https://notebooklm.google.com/)
- [STORM](https://storm.genie.stanford.edu/)
  - For creating scientific summaries


## Local AI platforms
- [Box](https://github.com/jegly/Box)
  - An improved fork of
    [Google AI Edge Gallery](https://play.google.com/store/apps/details?id=com.google.ai.edge.gallery)
  - Supports [Android AICore](https://play.google.com/store/apps/details?id=com.google.android.aicore)
    and therefore TPU acceleration for Gemini Nano on Google Pixel devices
- [LiteLLM](https://www.litellm.ai/)
- [llama.cpp](https://github.com/ggml-org/llama.cpp)
- [LM Studio](https://lmstudio.ai/)
- [Nanoclaw](https://nanoclaw.dev/)
- [Ollama](https://ollama.com/)
- [OpenClaw](https://openclaw.ai/)


## Utilities
- [Aider](https://aider.chat/)
- [Cline](https://github.com/cline/cline)
- [OpenHands](https://openhands.dev/)


## Hardware
The VRAM limits the size of LLM models that can be run on the hardware,
and the memory bandwidth limits the speed of LLM inference.
[Geizhals list of GPUs with >= 24 GB VRAM](https://geizhals.eu/?cat=gra16_512&xf=132_24576&sort=p#productlist)

### Individual GPU models
- [AMD Radeon RX 7900 XTX](https://www.amd.com/en/products/graphics/desktops/radeon/7000-series/amd-radeon-rx-7900xtx.html): 24 GB,
  [hinta.fi](https://hinta.fi/haku?q=Radeon+RX+7900+XTX&l=1&o=4&fc=5&fg=1)
- [Nvidia DGX Spark](https://www.nvidia.com/en-eu/products/workstations/dgx-spark/)
- [Nvidia RTX 3090](https://www.nvidia.com/en-eu/geforce/graphics-cards/30-series/rtx-3090-3090ti/): 24 GB
- [Nvidia RTX 4090](https://www.nvidia.com/en-eu/geforce/graphics-cards/40-series/rtx-4090/): 24 GB,
  [hinta.fi](https://hinta.fi/haku?q=RTX+4090&l=1&o=4&fc=5&fg=1)
- [Nvidia RTX 5090](https://www.nvidia.com/en-eu/geforce/graphics-cards/50-series/rtx-5090/): 32 GB,
  [hinta.fi](https://hinta.fi/haku?q=RTX+5090&l=1&o=4&fc=5&fg=1)


## Security
AI tools are vulnerable to the data they are given.
E.g. [Microsoft Copilot can follow instructions hidden in an incoming email](https://disobey.fi/2025/profile/disobey2025-331-living-off-microsoft-copilot),
if given access to your email inbox.
This can result in exfiltration of sensitive data.


## Some interesting articles
- [Viewpoint: When Will AI Exceed Human Performance? Evidence from AI Experts](http://jair.org/index.php/jair/article/view/11222) (2018)
- [Large Language Models Can Self-Improve](http://arxiv.org/abs/2210.11610) (2022)
- [Sparks of Artificial General Intelligence: Early experiments with GPT-4](https://arxiv.org/abs/2303.12712) (2023)
- [RoboCat: A Self-Improving Generalist Agent for Robotic Manipulation](http://arxiv.org/abs/2306.11706) (2023)
- [Communicative Agents for Software Development](http://arxiv.org/abs/2307.07924) (2023)
- [The carbon emissions of writing and illustrating are lower for AI than for humans](https://www.nature.com/articles/s41598-024-54271-x) (2024)
- [Enabling Language Models to Implicitly Learn Self-Improvement](http://arxiv.org/abs/2310.00898) (2024)
