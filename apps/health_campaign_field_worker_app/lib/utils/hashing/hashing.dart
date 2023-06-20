import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

void main() {
  String imagePath1 = "path/to/image1.jpg";
  String imagePath2 = "path/to/image2.jpg";

  generatePerceptualHash(imagePath1).then((hash1) {
    generatePerceptualHash(imagePath2).then((hash2) {
      double similarity = compareHashes(hash1, hash2);
      print("Similarity between the images: $similarity");
    }).catchError((error) {
      print("Error generating hash for image 2: $error");
    });
  }).catchError((error) {
    print("Error generating hash for image 1: $error");
  });
}

Future<String> generatePerceptualHash(String imagePath) async {
  img.Image? image = await loadImage(imagePath);
  int width = 1256;
  int height = 1256;
  img.Image resizedImage = img.copyResize(image!, width: width, height: height);
  img.Image grayscaleImage = convertToGrayscale(resizedImage);
  String hash = generateHash(grayscaleImage);

  return hash;
}

double compareHashes(String hash1, String hash2) {
  int hammingDistance = calculateHammingDistance(hash1, hash2);
  double similarity = 1.0 - (hammingDistance / hash1.length);

  return similarity;
}

Future<img.Image?> loadImage(String imagePath) async {
  File file = File(imagePath);
  Uint8List bytes = await file.readAsBytes();
  img.Image? image = img.decodeImage(bytes);

  return image;
}

img.Image convertToGrayscale(img.Image image) {
  int width = image.width;
  int height = image.height;
  img.Image grayscaleImage = img.Image(width, height);

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int pixel = image.getPixel(x, y);
      double grayValue = img.getRed(pixel) * 0.299 +
          img.getGreen(pixel) * 0.587 +
          img.getBlue(pixel) * 0.114;
      int grayscalePixel =
          img.getColor(grayValue.toInt(), grayValue.toInt(), grayValue.toInt());
      grayscaleImage.setPixel(x, y, grayscalePixel);
    }
  }

  return grayscaleImage;
}

String generateHash(img.Image image) {
  StringBuffer hashBuilder = StringBuffer();
  int width = image.width;
  int height = image.height;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int pixel = image.getPixel(x, y);
      int grayValue = img.getRed(pixel);
      if (grayValue >= 128) {
        hashBuilder.write('1');
      } else {
        hashBuilder.write('0');
      }
    }
  }

  return hashBuilder.toString();
}

int calculateHammingDistance(String hash1, String hash2) {
  int distance = 0;
  for (int i = 0; i < hash1.length; i++) {
    if (hash1[i] != hash2[i]) {
      distance++;
    }
  }

  return distance;
}
