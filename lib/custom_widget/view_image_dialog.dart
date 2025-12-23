import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:product_cart_app/common_widget/shared_widgets.dart';
import 'package:product_cart_app/components/logger.dart';
import 'package:product_cart_app/theme/app_color.dart';
import 'package:product_cart_app/theme/app_ui_utils.dart';
import 'package:product_cart_app/theme/theme_extension.dart';
import 'package:pdfx/pdfx.dart';

class ViewFileDialog extends StatefulWidget {
  final String? imageUrl;
  final File? file;

  const ViewFileDialog({super.key, this.imageUrl, this.file});

  @override
  State<ViewFileDialog> createState() => _ViewFileDialogState();
}

class _ViewFileDialogState extends State<ViewFileDialog> {
  PdfController? _pdfController;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    initDocument();
  }

  @override
  void didUpdateWidget(covariant ViewFileDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.file?.path != widget.file?.path ||
        oldWidget.imageUrl != widget.imageUrl) {
      _disposeController();
      _error = null;
      initDocument();
    }
  }

  bool get _isPdfSource => _isPdfFromFile || _isPdfFromUrl;

  bool get _isPdfFromFile {
    final filePath = widget.file?.path;
    if (filePath == null) return false;
    return _isPdfPath(filePath);
  }

  bool get _isPdfFromUrl {
    final url = widget.imageUrl;
    if (url == null) return false;
    return _isPdfPath(url);
  }

  bool _isPdfPath(String value) {
    final uri = Uri.tryParse(value);
    final target = uri?.path.isNotEmpty == true ? uri!.path : value;
    return target.toLowerCase().endsWith('.pdf');
  }

  Future<void> initDocument() async {
    if (!_isPdfSource) {
      if (mounted) {
        setState(() {
          _isLoading = true;
          _error = null;
        });
        _disposeController();
      }
      return;
    }

    _disposeController();
    setState(() {
      _isLoading = false;
      _error = null;
    });

    try {
      final document = await _openPdfDocument();
      if (!mounted) {
        return;
      }

      setState(() {
        _pdfController = PdfController(
          document: Future.value(document),
        );
        _isLoading = false;
      });
    } catch (e) {
      logger.e('Error initializing PDF: $e');
      if (mounted) {
        setState(() {
          _error = 'Unable to load document';
          _isLoading = false;
        });
      }
    }
  }

  Future<PdfDocument> _openPdfDocument() async {
    if (_isPdfFromFile) {
      return PdfDocument.openFile(widget.file!.path);
    }

    final uri = Uri.tryParse(widget.imageUrl ?? '');
    if (uri == null || uri.scheme.isEmpty) {
      throw Exception('Invalid PDF URL');
    }

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to load PDF (${response.statusCode})');
    }

    return PdfDocument.openData(response.bodyBytes);
  }

  void _disposeController() {
    _pdfController?.dispose();
    _pdfController = null;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        insetPadding: EdgeInsets.only(left: 14.w, right: 14.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: context.padding.a20,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeightMax(context) * 0.7,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.w),
                    child: _buildPreview(),
                  ),
                ),
                context.gap.h20,
                NoSplashInkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: context.color.white,
                    child: const Icon(
                      Icons.close,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreview() {
    if (_isPdfSource) {
      if (_isLoading) {
        return Center(
          child: Container(
            color: context.color.white,
            height: screenHeightMax(context) * 0.1,
            width: screenWidthMax(context) * 0.5,
            child: loading(),
          ),
        );
      }

      if (_error != null || _pdfController == null) {
        return Center(
          child: Container(
            color: context.color.white,
            height: screenHeightMax(context) * 0.2,
            width: screenWidthMax(context) * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 48.w),
                context.gap.h8,
                Text(_error ?? "Unable to load file"),
              ],
            ),
          ),
        );
      }

      return PdfView(
        controller: _pdfController!,
        scrollDirection: Axis.vertical,
        backgroundDecoration: BoxDecoration(color: context.color.white),
        onDocumentLoaded: (document) => Center(
          child: Container(
            color: context.color.white,
            height: screenHeightMax(context) * 0.1,
            width: screenWidthMax(context) * 0.5,
            child: loading(),
          ),
        ),
        onDocumentError: (error) {
          logger.e('PDF Document Error: $error');
        },
      );
    }

    if (widget.file != null) {
      return Image.file(
        widget.file!,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.image_not_supported_rounded),
          );
        },
      );
    }

    if (widget.imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: widget.imageUrl!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Container(
            color: context.color.white,
            height: screenHeightMax(context) * 0.1,
            width: screenWidthMax(context) * 0.5,
            child: loading(),
          ),
        ),
        errorWidget: (context, url, error) =>
            const Icon(Icons.image_not_supported_rounded),
      );
    }

    return const Center(
      child: Icon(Icons.image_not_supported_rounded),
    );
  }
}
