import 'package:amazon_admin_panel/features/account/services/account_services.dart';
import 'package:amazon_admin_panel/features/account/widgets/account_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Order', onTap: () {}),
            AccountButton(text: 'Turn Seller', onTap: () {}),
          ],
        ),
        Row(
          children: [
            AccountButton(text: 'Log Out', onTap: () {
              AccountServices().logOut(context);
            }),
            AccountButton(text: 'Your Wish List', onTap: () {}),
          ],
        )
      ],
    );
  }
}
