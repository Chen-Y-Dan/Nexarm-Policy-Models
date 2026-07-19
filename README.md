# NexArm Policy Models

A collection of trained policy models for controlling the **NexArm** 6-DOF robotic arm to carry out basic tasks, ranging from pick and place to pushing objects, etc.

## Repository Structure

```
nexarm-policy-models/
├── dit_v3/         # DiT + Flow Matching policy
└── act_v4/         # ACT policy
```

## Policies Overview

| Policy | Method | Task | Training Data | HuggingFace Model |
|--------|--------|------|--------------|-------------------|
| `dit_v3` | DiT + Flow Matching | Pick and Place | 30 episodes | [CypherChen/nexarm_dit_v3](https://huggingface.co/CypherChen/nexarm_dit_v3) |
| `act_v4` | ACT | Put object into box | 60 episodes, varied positions | — |

> Model weights (`.safetensors`) are hosted on HuggingFace Hub. Each policy folder contains a README with training details.

## Hardware

- **Training**: NVIDIA RTX 5070 Ti (16GB VRAM)
- **Cameras**: 2× USB (front + wrist) @ 640×480

## License

Apache 2.0
