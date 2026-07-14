# NexArm Policy Models

A collection of trained policy models for controlling the **NexArm** 6-DOF robotic arm to carry out basic tasks, ranging from pick and place to pushing objects, etc.

## Repository Structure

```
nexarm-policy-models/
├── dit_v3/         # DiT + Flow Matching policy
├── act_v3/         # ACT policy (current)
└── ...
```

## Policies Overview

| Policy | Method | Task | Training Data | HuggingFace Model |
|--------|--------|------|--------------|-------------------|
| `dit_v3` | DiT + Flow Matching | Pick and Place | 30 episodes, hand-collected | [CypherChen/nexarm_dit_v3](https://huggingface.co/CypherChen/nexarm_dit_v3) |
| `act_v3` | ACT | Pick and Place | 30 episodes, hand-collected | [CypherChen/nexarm_act_v3](https://huggingface.co/CypherChen/nexarm_act_v3) |

> Large model weights (`.safetensors`) are hosted on HuggingFace Hub due to GitHub file size limits. Each policy folder contains a `model_link.md` with the exact HF repository link.

## Training Details

### Hardware

- **Training GPU**: NVIDIA RTX 5070 Ti (16GB VRAM)
- **Inference GPU**: RTX 5070 Ti / RTX 5060 Laptop
- **CPU**: Intel Core (13th gen)
- **Camera**: 2x USB cameras (front + wrist) @ 640×480

### Data Collection

- **Tool**: LeRobot `lerobot_record` with NexArm teleoperation
- **Setup**: Leader arm (master) → Follower arm (slave)
- **Frames**: 640×480 @ 30fps, h264 encoding
- **Label**: `"put the object into the box"`

### Training Method

#### dit_v3 — DiT + Flow Matching

| Parameter | Value |
|-----------|-------|
| Architecture | Multi-task Diffusion Transformer |
| Objective | Flow Matching |
| ODE Integration Steps | 100 (training) / 30 (inference) |
| Horizon | 32 |
| N Action Steps | 24 |
| N Obs Steps | 2 |
| Vision Encoder | CLIP ViT-B/16 |
| Batch Size | 16 |
| Training Steps | 20,000 |
| Optimizer | Adam (lr=2e-5) |

#### act_v3 — ACT (Action Chunking with Transformers)

| Parameter | Value |
|-----------|-------|
| Architecture | ACT (CVAE + Transformer) |
| Chunk Size | 100 |
| N Action Steps | 100 |
| N Obs Steps | 1 |
| Batch Size | 32 |
| Training Steps | 100,000 |
| Optimizer | Adam (lr=1e-4) |

## Citation

If you use these models in your work, please cite:

```bibtex
@misc{nexarm-policy-models,
  author = {CypherChen},
  title = {NexArm Policy Models},
  year = {2026},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/CypherChen/nexarm-policy-models}}
}
```

## License

Apache 2.0
