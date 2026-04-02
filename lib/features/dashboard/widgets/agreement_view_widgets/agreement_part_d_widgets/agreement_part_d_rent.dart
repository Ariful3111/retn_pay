import 'package:flutter/material.dart';
import 'package:renter_pay/shared/widgets/custom_text/custom_bullet_point_text.dart';

class AgreementPartDRent extends StatelessWidget {
  const AgreementPartDRent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBulletPointText(
      items: [
        'The rental provider must give the renter at least 60 days’ written notice of a proposed rent increase.',
        'Rent cannot be increased more than once every 12 months. ',
        'If the rental provider or agent does not provide a receipt for rent, the renter may request a receipt.',
        'The rental provider must not increase the rent under a fixed term agreement unless the agreement provides for an increase.',
      ],
    );
  }
}
