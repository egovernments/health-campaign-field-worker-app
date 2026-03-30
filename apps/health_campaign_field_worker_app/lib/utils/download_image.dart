import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:typed_data';

class DownloadImage {
  static Future<Uint8List?> getImageBytesFromUrl(String imageUrl) async {
    try {
      // Fetch the image data from the network
      final http.Response response = await http.get(Uri.parse(imageUrl));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Return the bodyBytes as Uint8List
        return response.bodyBytes;
      } else {
        // Handle non-200 status codes (e.g., 404 Not Found)
        print('Failed to load image: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle network errors
      print('Error fetching image bytes: $e');
      return null;
    }
  }

  static Future<String> downloadSignature(String signatureFileStoreId) async {
    String downloadUrl =
        "https://bauchi-hcm-uat.digit.org/filestore/v1/files/id?tenantId=ba&fileStoreId=$signatureFileStoreId";
    Uint8List? signatureBytes =
        await DownloadImage.getImageBytesFromUrl(downloadUrl);
    String signatureBase64 = base64Encode(signatureBytes!);
    return signatureBase64;
  }
}
