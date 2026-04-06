# Fine-tuning MobileFaceNet on African Faces

Fine-tune the MobileFaceNet model (pre-trained on WebFace600K) specifically on African faces from the FAGE_v2 dataset to improve verification accuracy for Nigerian field workers.

## Prerequisites

Before running the notebook, upload these files to Google Drive at `My Drive/mobilefacenet_african/`:

1. **`w600k_mbf.onnx`** — Pre-trained MobileFaceNet ONNX model
   - Download from: https://huggingface.co/WePrompt/buffalo_sc/resolve/main/w600k_mbf.onnx
   - Also available locally at: `training/models/w600k_mbf.onnx`

2. **`fage_v2.zip`** (or `archive.zip`) — FAGE_v2 African face dataset
   - Download from: https://www.kaggle.com/datasets/ajewoleolaitan/fage-dataset
   - 500 African identities x 10 images, CC BY 4.0

## Quick Start (Google Colab)

1. Upload prerequisites to Google Drive (see above)
2. Open `finetune_mobilefacenet_african.ipynb` in Google Colab
3. Select **Runtime > Change runtime type > T4 GPU**
4. Run all cells sequentially
5. Download the exported `mobilefacenet_african_v2.tflite` from the final cell

## What This Does

| Step | Description |
|------|-------------|
| Setup | Installs dependencies, mounts Google Drive |
| Pre-trained Model | Loads InsightFace MobileFaceNet ONNX from Drive, converts to PyTorch |
| Dataset | Loads FAGE_v2 African faces (~5K images, 500 identities), generates verification pairs |
| Fine-tuning | ArcFace loss, 20 epochs, cosine LR schedule on T4 GPU |
| Evaluation | ROC analysis on African verification pairs, reports accuracy/FAR/FRR |
| Export | PyTorch -> ONNX -> TFLite (112x112 NHWC input, 192-dim output) |

## Model Specifications

Must match the existing Flutter integration:

- **Input**: `[1, 112, 112, 3]` Float32, normalized to `[-1, 1]`
- **Output**: `[1, 192]` Float32, L2-normalized embeddings
- **File**: `mobilefacenet.tflite` (~5MB)
- **Architecture**: MobileFaceNet with ArcFace loss

## Deploying the Fine-tuned Model

After training completes:

1. Copy the exported `.tflite` file to:
   ```
   packages/digit_face_verification/assets/models/mobilefacenet.tflite
   ```

2. Update `distance_metrics.dart` with the optimal threshold printed by the notebook:
   ```dart
   static const double defaultThreshold = <value from notebook>;
   ```

3. Update model version in `face_embedding_model.dart` and `face_embedding_repository.dart`:
   ```dart
   this.modelVersion = 'mobilefacenet_african_v2'
   ```

4. Re-register all faces (embeddings from v1 are not compatible with v2)

## Target Metrics

- Verification accuracy >= 90% on FAGE African pairs
- FAR (False Accept Rate) < 1%
- Model size <= 5MB

## Local Development

```bash
pip install -r requirements.txt
jupyter notebook finetune_mobilefacenet_african.ipynb
```

Requires a CUDA-capable GPU for reasonable training time. Google Colab T4 is recommended.
