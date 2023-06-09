import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:ween_blaqe/urls_of_project/localhost_urls.dart';

Future<void> uploadImages(List<XFile> imageFiles) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse(ServerLocalDiv.uploadImages),
  );

  for (var imageFile in imageFiles) {
    var stream = http.ByteStream(
      imageFile.openRead().cast(),
    ); // Convert the file to byte stream.
    var length = await imageFile.length(); // get image size
    var multipartFile = http.MultipartFile(
      'images', // ? or images[]. To you really need to label the parameter with a array definition at the end ?
      stream, //File as a stream
      length, //File size
      filename: imageFile.path.split('/').last, //File name without path.
    );
    request.files.add(multipartFile);
  }

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Images uploaded successfully');
  } else {
    print('Error uploading images: ${response.reasonPhrase}');
  }}