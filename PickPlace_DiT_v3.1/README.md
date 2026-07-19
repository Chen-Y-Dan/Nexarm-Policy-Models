# dit_v3 — DiT + Flow Matching

| | |
|---|---|
| **Method** | DiT + Flow Matching |
| **Task** | Pick and Place |
| **Training Data** | 30 episodes, hand-collected |
| **HuggingFace** | [CypherChen/nexarm_dit_v3](https://huggingface.co/CypherChen/nexarm_dit_v3) |

## Training Parameters

| Parameter | Value |
|-----------|-------|
| Architecture | Multi-task Diffusion Transformer |
| ODE Integration Steps | 100 (training) / 30 (inference) |
| Horizon | 32 |
| N Action Steps | 24 |
| N Obs Steps | 2 |
| Vision Encoder | CLIP ViT-B/16 |
| Batch Size | 16 |
| Training Steps | 20,000 |

## Notes

- Requires CLIP model files locally for inference
- ODE steps control speed vs quality: 30 for real-time, 15 for faster inference
