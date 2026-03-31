import 'package:flutter/material.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class AgreementPartDPets extends StatelessWidget {
  const AgreementPartDPets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBulletPointText(
      items: [
        'The renter must seek consent from the rental provider before keeping a pet on the premises.',
        'The rental provider must not unreasonably refuse a request to keep a pet.',
      ],
    );
  }
}