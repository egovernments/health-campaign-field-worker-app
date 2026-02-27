# MobileFaceNet Model

Place the `mobilefacenet.tflite` file in this directory.

## Current Model: mobilefacenet_african_v2

Fine-tuned on RFW (Racial Faces in the Wild) African subset for improved accuracy
on African faces. See `training/finetune_mobilefacenet_african.ipynb` for the
fine-tuning notebook.

### How to generate
1. Open `training/finetune_mobilefacenet_african.ipynb` in Google Colab (T4 GPU)
2. Run all cells
3. Download the exported `mobilefacenet_african_v2.tflite`
4. Rename to `mobilefacenet.tflite` and place in this directory
5. Update `defaultThreshold` in `distance_metrics.dart` with the value from the notebook

### Model Details
- Architecture: MobileFaceNet with ArcFace loss
- Base model: MS1M-ArcFace (refined MS-Celeb-1M)
- Fine-tuned on: RFW African subset (~10K pairs, 20 epochs)
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
