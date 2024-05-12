import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class animatedButton extends StatelessWidget {
  const animatedButton({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _btnAnimationController.isActive = true;
      },
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset("assets/RiveAssets/button.riv" ,
              controllers: [
                _btnAnimationController
              ],
            ),
            const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(width: 8),
                  Text("Begin the journey", style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
