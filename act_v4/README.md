# act_v4 — ACT

| | |
|---|---|
| **Method** | ACT (CVAE + Transformer) |
| **Task** | Put object into box |
| **Training Data** | 60 episodes, varied positions and orientations |
| **HuggingFace** | TBD (not yet uploaded) |

## Training Parameters

| Parameter | Value |
|-----------|-------|
| Chunk Size | 100 |
| N Action Steps | 100 |
| N Obs Steps | 1 |
| Batch Size | 32 |
| Training Steps | 100,000 (planned) |
| Learning Rate | 1e-5 |

## Notes

- Uses ResNet18 backbone (no external dependencies)
- Supports AMP (`--policy.use_amp=true`) for faster inference
