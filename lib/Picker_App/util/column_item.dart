import 'package:flutter/cupertino.dart';

class ColumItem extends StatelessWidget {
  final String label;
  final String image;
  const ColumItem({super.key,required this.label,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(image,height: 20),
          Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
