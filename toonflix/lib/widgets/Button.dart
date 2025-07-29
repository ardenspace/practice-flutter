import 'package:flutter/material.dart';

// 버튼을 재사용 가능한 컴포넌트로 만들고 싶다!
// 버튼 배경색과 타이틀을 가져오고 다른 건 똑같게 하고 싶다!

class Button extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final Color textColor;
  final double marginLeft;

  const Button({
    super.key,
    required this.buttonText,
    required this.bgColor,
    required this.textColor,
    required this.marginLeft,
  });

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.only(left: marginLeft),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor, fontSize: 22),
        ),
      ),
    ));
  }
}
