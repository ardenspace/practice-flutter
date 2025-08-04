import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final double order;

  final _blackColor = const Color(0xFF1F2123);
  final double _offsetValue;
  final bool isInverted;
  // 여기서 _를 넣어주는 이유는 private 을 뜻하기 때문

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.order,
  }) : _offsetValue = -20 * order,
       isInverted = order % 2 != 0;
  // offsetValue와 order에 따른 isInverted 값을 생성자 내에서 동적으로 설정

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _offsetValue),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : const Color(0xFF1F2123),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withValues(alpha: 0.7),
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.5,
                child: Transform.translate(
                  offset: const Offset(-5, 15),
                  child: Icon(
                    icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
