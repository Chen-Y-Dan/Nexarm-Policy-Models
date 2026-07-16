# ACT v4 — Pick and Place

**Policy:** Action Chunking with Transformers (ACT)
**Training:** 100,000 steps
**Data:** 60 episodes, hand-collected via teleoperation
**Status:** ✅ Latest

## Training Parameters

| Parameter | Value |
|-----------|-------|
| Architecture | ACT (CVAE + Transformer) |
| Vision Backbone | ResNet-18 |
| Chunk Size | 100 |
| N Encoder Layers | 4 |
| N Heads | 8 |
| Use VAE | Yes |
| Batch Size | 32 |
| Training Steps | 100,000 |
| Optimizer | AdamW (lr=1e-5) |

## Data Collection

- **Task:** Put the object into the box
- **Episodes:** 60
- **Setup:** 4 positions × (10 consistent orientation + 5 varied orientation)
- **Cameras:** 2× USB (front + wrist) @ 640×480
- **Label:** `"put the object into the box"`

## Results

- **Rollout (RTX 5060 Laptop):** ~8-9 Hz
- **Rollout (RTX 5070 Ti Desktop):** 30 Hz (expected)
- **Behavior:** Accurate pick-and-place at trained positions; limited generalization to unseen positions

## Weights

Model weights are hosted on HuggingFace Hub (see `model_link.md`).

## Usage

```bash
python -m lerobot.scripts.lerobot_rollout \
  --config_path=examples/nexarm/inference.yaml \
  --policy.path=<path>/pretrained_model \
  --policy.use_amp=true
```
