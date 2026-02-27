# Fine-tuning MobileFaceNet on African Faces

Fine-tune the MobileFaceNet model (pre-trained on MS1M-ArcFace) specifically on African faces from the RFW dataset to improve verification accuracy for Nigerian field workers.

## Quick Start (Google Colab)

1. Open `finetune_mobilefacenet_african.ipynb` in Google Colab
2. Select **Runtime > Change runtime type > T4 GPU**
3. Run all cells sequentially
4. Download the exported `mobilefacenet_african_v2.tflite` from the final cell

## What This Does

| Step | Description |
|------|-------------|
| Setup | Installs dependencies, mounts Google Drive |
| Pre-trained Model | Downloads InsightFace MobileFaceNet ONNX, converts to PyTorch |
| Dataset | Downloads RFW African subset (~10K pairs), prepares DataLoaders |
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

- Verification accuracy >= 90% on RFW African pairs
- FAR (False Accept Rate) < 1%
- Model size <= 5MB

## Local Development

```bash
pip install -r requirements.txt
jupyter notebook finetune_mobilefacenet_african.ipynb
```

Requires a CUDA-capable GPU for reasonable training time. Google Colab T4 is recommended.
