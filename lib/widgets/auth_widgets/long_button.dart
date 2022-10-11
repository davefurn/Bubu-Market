import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Color color;
  final VoidCallback func;
  final Widget child;
  const LongButton(
      {Key? key, required this.color, required this.func, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(
          Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      onPressed: func,
      child: child,
    );
  }
}
