import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class GoogleLoginButton extends StatelessWidget {
  final void Function()? onTap;
  const GoogleLoginButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 320,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              AssetsUtils.instance.google,
              height: 24,
              width: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 52),
              child: Text(
                '구글이메일로 로그인하기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
