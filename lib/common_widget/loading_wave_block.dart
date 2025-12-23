import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoadingWaveBlocks extends StatefulWidget {
  final int blockCount;
  final double blockWidth;
  final double blockHeight;
  final Color blockColor;
  final double spacing;
  
  const LoadingWaveBlocks({
    super.key,
    this.blockCount = 5,
    this.blockWidth = 5,
    this.blockHeight = 10,
    this.blockColor = Colors.white,
    this.spacing = 8,
  });

  @override
  State<LoadingWaveBlocks> createState() => _LoadingWaveBlocksState();
}

class _LoadingWaveBlocksState extends State<LoadingWaveBlocks>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.blockCount, (index) {
            final delay = index / widget.blockCount;
            final animValue = (_controller.value + delay) % 1.0;
            final scale = 0.4 + (math.sin(animValue * 2 * math.pi) * 0.6);
            
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: Transform.scale(
                scaleY: scale,
                child: Container(
                  width: widget.blockWidth,
                  height: widget.blockHeight,
                  decoration: BoxDecoration(
                    color: widget.blockColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}