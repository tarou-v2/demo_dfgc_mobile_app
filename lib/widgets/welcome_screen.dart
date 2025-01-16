import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.transparent, // 透明
                    Colors.redAccent, // 赤
                    Colors.transparent, // 透明
                  ],
                  stops: [0.0, _animation.value, 1.0],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop, // テキストの色にのみグラデーションを適用
              child: Text(
                'ようこそ、DeFiGeek Communityへ。',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // 文字色を白に設定
                  backgroundColor: Colors.transparent, // 背景色を透明に設定
                  shadows: _animation.value > 0.1
                      ? [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.redAccent.withOpacity(_animation.value), // 赤い影
                      offset: Offset(0, 0),
                    ),
                  ]
                      : [], // 光がない時は影を表示しない
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}