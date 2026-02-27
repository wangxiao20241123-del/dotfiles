{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "NC AWS": {
      "npm": "@ai-sdk/anthropic",
      "name": "NC AWS",
      "options": {
        "baseURL": "https://code.newcli.com/claude/aws/v1",
        "apiKey": "__NC_AWS_API_KEY__"
      },
      "models": {
        "claude-opus-4-6": {
          "name": "claude-opus-4-6",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5": {
          "name": "claude-sonnet-4-5",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-20250929": {
          "name": "claude-sonnet-4-5-20250929",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-thinking": {
          "name": "claude-sonnet-4-5-thinking",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-20250929-thinking": {
          "name": "claude-sonnet-4-5-20250929-thinking",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-haiku-4-5-20251001": {
          "name": "claude-haiku-4-5-20251001",
          "limit": { "context": 200000, "output": 64000 }
        }
      }
    },
    "MC AWS": {
      "npm": "@ai-sdk/anthropic",
      "name": "MC AWS",
      "options": {
        "baseURL": "https://www.openclaudecode.cn/v1",
        "apiKey": "__MC_AWS_API_KEY__"
      },
      "models": {
        "claude-opus-4-6": {
          "name": "claude-opus-4-6",
          "limit": { "context": 200000, "output": 64000 }
        }
      }
    },
    "NC DROID": {
      "npm": "@ai-sdk/anthropic",
      "name": "NC DROID",
      "options": {
        "baseURL": "https://code.newcli.com/claude/droid/v1",
        "apiKey": "__NC_AWS_API_KEY__"
      },
      "models": {
        "claude-opus-4-5": {
          "name": "claude-opus-4-5",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-opus-4-5-20251101": {
          "name": "claude-opus-4-5-20251101",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5": {
          "name": "claude-sonnet-4-5",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-20250929": {
          "name": "claude-sonnet-4-5-20250929",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-haiku-4-5-20251001": {
          "name": "claude-haiku-4-5-20251001",
          "limit": { "context": 200000, "output": 64000 }
        }
      }
    },
    "NC Codex": {
      "npm": "@ai-sdk/openai",
      "name": "NCAPI Codex",
      "options": {
        "baseURL": "https://code.newcli.com/codex/v1",
        "apiKey": "__NC_AWS_API_KEY__"
      },
      "models": {
        "gpt-5.2": {
          "name": "gpt-5.2",
          "limit": { "context": 272000, "output": 128000 }
        },
        "gpt-5.2-codex": {
          "name": "gpt-5.2-codex",
          "limit": { "context": 272000, "output": 128000 }
        },
        "gpt-5.3-codex": {
          "name": "gpt-5.3-codex",
          "limit": { "context": 272000, "output": 128000 }
        }
      }
    },
    "RC Codex": {
      "npm": "@ai-sdk/openai",
      "name": "RC Codex",
      "options": {
        "baseURL": "https://right.codes/codex/v1",
        "apiKey": "__RC_CODEX_API_KEY__"
      },
      "models": {
        "gpt-5.3-codex": {
          "name": "gpt-5.3-codex",
          "limit": { "context": 272000, "output": 128000 }
        }
      }
    },
    "ZAI GLM": {
      "npm": "@ai-sdk/openai",
      "name": "ZAI GLM",
      "options": {
        "baseURL": "https://open.bigmodel.cn/api/paas/v4",
        "apiKey": "__ZAI_GLM_API_KEY__"
      },
      "models": {
        "glm-4.7": {
          "name": "glm-4.7",
          "limit": { "context": 200000, "output": 128000 }
        }
      }
    },
    "NCAPI AWS High": {
      "npm": "@ai-sdk/anthropic",
      "name": "NCAPI AWS High",
      "options": {
        "baseURL": "https://business.newcli.com/v1",
        "apiKey": "__NCAPI_AWS_HIGH_API_KEY__"
      },
      "models": {
        "claude-haiku-4-5-20251001": {
          "name": "claude-haiku-4-5-20251001",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-opus-4-5-20251101": {
          "name": "claude-opus-4-5-20251101",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-opus-4-5-20251101-thinking": {
          "name": "claude-opus-4-5-20251101-thinking",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-20250929": {
          "name": "claude-sonnet-4-5-20250929",
          "limit": { "context": 200000, "output": 64000 }
        },
        "claude-sonnet-4-5-20250929-thinking": {
          "name": "claude-sonnet-4-5-20250929-thinking",
          "limit": { "context": 200000, "output": 64000 }
        }
      }
    }
  },
  "small_model": "NC AWS/claude-haiku-4-5-20251001",
  "agent": {
    "title": {
      "model": "NC AWS/claude-haiku-4-5-20251001"
    },
    "compaction": {
      "model": "NC Codex/gpt-5.3-codex"
    }
  },
  "compaction": {
    "auto": true,
    "prune": true
  },
  "plugin": [
    "oh-my-opencode",
    "@different-ai/opencode-browser"
  ]
}
