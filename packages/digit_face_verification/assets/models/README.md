# MobileFaceNet Model

Place the `mobilefacenet.tflite` file in this directory.

## Current Model: mobilefacenet_african_v2

Fine-tuned on FAGE_v2 (African Faces for Age-Invariant Recognition) dataset for
improved accuracy on African faces. See `training/finetune_mobilefacenet_african.ipynb`
for the fine-tuning notebook.

### How to generate
1. Upload `w600k_mbf.onnx` and `fage_v2.zip` to Google Drive (see `training/README.md`)
2. Open `training/finetune_mobilefacenet_african.ipynb` in Google Colab (T4 GPU)
3. Run all cells
4. Download the exported `mobilefacenet_african_v2.tflite`
5. Rename to `mobilefacenet.tflite` and place in this directory
6. Update `defaultThreshold` in `distance_metrics.dart` with the value from the notebook

### Model Details
- Architecture: MobileFaceNet with ArcFace loss
- Base model: WebFace600K (w600k_mbf via InsightFace)
- Fine-tuned on: FAGE_v2 African dataset (~5K images, 500 identities, 20 epochs)
- Input: 112x112x3 RGB image, normalized to [-1, 1] (NHWC)
- Output: 192-dimensional face embedding (Float32, L2-normalized)
- Size: ~5MB
- Version: `mobilefacenet_african_v2`

## Previous Model: mobilefacenet_v1

The original pre-trained model (not fine-tuned for African faces).

### Download
Get the pre-trained InsightFace MobileFaceNet model from:
https://github.com/nicegram/nicegram-android/raw/main/nicegram-features/src/main/assets/mobilefacenet.tflite

Or convert from InsightFace official repository:
https://github.com/deepinsight/insightface/tree/master/recognition/arcface_torch

### Model Details
- Architecture: MobileFaceNet with ArcFace loss
- Training data: MS1M-ArcFace (refined MS-Celeb-1M)
- Input: 112x112x3 RGB image, normalized to [-1, 1]
- Output: 192-dimensional face embedding (Float32)
- Size: ~5MB
- License: MIT
