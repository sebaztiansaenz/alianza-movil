// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({
    super.key,
    this.width,
    this.height,
    this.url,
  });

  final double? width;
  final double? height;
  final String? url;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    if (widget.url != null && widget.url!.isNotEmpty) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));

      _controller!.initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });

          // Configurar para loop infinito
          _controller!.setLooping(true);

          // Reproducir automáticamente
          _controller!.play();
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            _hasError = true;
          });
        }
        print('Error initializing video: $error');
      });
    }
  }

  @override
  void didUpdateWidget(Video oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Si la URL cambió, reinicializar el video
    if (oldWidget.url != widget.url) {
      _disposeController();
      _initializeVideo();
    }
  }

  void _disposeController() {
    _controller?.dispose();
    _controller = null;
    _isInitialized = false;
    _hasError = false;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _buildVideoContent(),
    );
  }

  Widget _buildVideoContent() {
    // Si hay error, mostrar contenedor vacío
    if (_hasError) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white54,
            size: 48,
          ),
        ),
      );
    }

    // Si no está inicializado, mostrar loading
    if (!_isInitialized || _controller == null) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white54,
          ),
        ),
      );
    }

    // Obtener el aspect ratio del video
    final videoAspectRatio = _controller!.value.aspectRatio;

    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.cover, // Esto hace el "zoom" para ocupar máximo espacio
          child: SizedBox(
            width: _controller!.value.size.width,
            height: _controller!.value.size.height,
            child: VideoPlayer(_controller!),
          ),
        ),
      ),
    );
  }
}
