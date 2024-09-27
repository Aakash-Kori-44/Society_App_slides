import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<File> _mediaFiles = [];
  List<VideoPlayerController?> _videoControllers = [];
  final double _aspectRatio = 1.0;

 Future<void> _pickImageOrVideo(ImageSource source, {bool isVideo = false, bool multiImage = false}) async {
  if (multiImage) {
    if (isVideo) {
      // Picking multiple videos
      final pickedFiles = await MultiImagePicker.pickImages(
        maxImages: 10, // Adjust this number as needed
        enableCamera: false,
        selectedAssets: [], // If you want to preselect some items
      );
      setState(() {
        for (var pickedFile in pickedFiles) {
          final file = File(pickedFile.file.path);
          _mediaFiles.add(file);
          _videoControllers.add(
            VideoPlayerController.file(file)
              ..initialize().then((_) {
                setState(() {
                  _videoControllers.last!.play();
                });
              }),
          );
        }
      });
    } else {
      // Picking multiple images
      final pickedFiles = await ImagePicker().pickMultiImage();
      setState(() {
        for (var pickedFile in pickedFiles) {
          final file = File(pickedFile.path);
          _mediaFiles.add(file);
          _videoControllers.add(null);
        }
      });
    }
  } else {
    final pickedFile = isVideo
        ? await ImagePicker().pickVideo(source: source)
        : await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        final file = File(pickedFile.path);
        _mediaFiles.add(file);
        if (isVideo) {
          _videoControllers.add(
            VideoPlayerController.file(file)
              ..initialize().then((_) {
                setState(() {
                  _videoControllers.last!.play();
                });
              }),
          );
        } else {
          _videoControllers.add(null);
        }
      });
    }
  }
  Navigator.pop(context); // Dismiss the bottom sheet after picking media
}

  void _showMediaSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick Images'),
                onTap: () => _pickImageOrVideo(ImageSource.gallery, multiImage: true),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () => _pickImageOrVideo(ImageSource.camera, multiImage: false),
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: const Text('Pick Video'),
                onTap: () => _pickImageOrVideo(ImageSource.gallery, isVideo: true),
              ),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Record Video'),
                onTap: () => _pickImageOrVideo(ImageSource.camera, isVideo: true),
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeMedia(int index) {
    setState(() {
      if (_videoControllers[index] != null) {
        _videoControllers[index]!.pause();
        _videoControllers[index]!.dispose();
        _videoControllers.removeAt(index);
      }
      _mediaFiles.removeAt(index);
    });
  }

  Future<void> _saveMediaToGallery(dynamic mediaFile) async {
    String path;
    if (mediaFile is File) {
      path = mediaFile.path;
    } else if (mediaFile is String) {
      path = mediaFile;
    } else {
      return;
    }
    final result = await ImageGallerySaver.saveFile(path);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result['isSuccess'] ? 'Media saved!' : 'Failed to save media.'),
      ),
    );
  }

  void _showMediaDialog(File mediaFile, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaFile.path.endsWith('.mp4')
                  ? AspectRatio(
                      aspectRatio: _videoControllers[index]!.value.aspectRatio,
                      child: VideoPlayer(_videoControllers[index]!),
                    )
                  : InteractiveViewer(
                      boundaryMargin: EdgeInsets.all(10.0),
                      minScale: 0.1,
                      maxScale: 2.0,
                      constrained: true,
                      child: Image.file(
                        mediaFile,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _saveMediaToGallery(mediaFile);
                      Navigator.pop(context);
                    },
                    child: const Text('Save to Gallery'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Download Media'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _mediaFiles.isNotEmpty
                  ? GridView.builder(
                      itemCount: _mediaFiles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: _aspectRatio, // Maintain aspect ratio
                      ),
                      itemBuilder: (context, index) {
                        final mediaFile = _mediaFiles[index];
                        final isVideo = mediaFile.path.endsWith('.mp4');
                        return GestureDetector(
                          onTap: () => _showMediaDialog(mediaFile, index),
                          child: Stack(
                            children: <Widget>[
                              isVideo
                                  ? AspectRatio(
                                      aspectRatio: _aspectRatio,
                                      child: VideoPlayer(_videoControllers[index]!),
                                    )
                                  : Image.file(
                                      mediaFile,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _removeMedia(index),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No media uploaded yet',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _showMediaSourceActionSheet(context);
                },
                child: const Text('Upload Media'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

