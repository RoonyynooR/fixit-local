import 'package:flutter/material.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class CardModel {
  final String type;
  final String lastFour;
  final String expiry;
  final bool isDefault;

  CardModel({
    required this.type,
    required this.lastFour,
    required this.expiry,
    required this.isDefault,
  });
}

class TransactionModel {
  final String title;
  final String date;
  final String amount;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
  });
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Future<Map<String, dynamic>> fetchPaymentData() async {
    // Mock data - هنستبدلها بـ API حقيقي بعدين
    await Future.delayed(const Duration(milliseconds: 500));

    final cards = [
      CardModel(type: 'Visa', lastFour: '4242', expiry: '12/26', isDefault: true),
      CardModel(type: 'Mastercard', lastFour: '8801', expiry: '05/25', isDefault: false),
    ];

    final transactions = [
      TransactionModel(title: 'Kitchen Sink Repair', date: 'Oct 24, 2023', amount: '-\$145.00'),
      TransactionModel(title: 'Electrical Audit', date: 'Sep 12, 2023', amount: '-\$89.00'),
    ];

    return {'cards': cards, 'transactions': transactions};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchPaymentData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('حصل خطأ: ${snapshot.error}'));
            }

            final cards = snapshot.data!['cards'] as List<CardModel>;
            final transactions = snapshot.data!['transactions'] as List<TransactionModel>;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.maybePop(context),
                      icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
                      padding: EdgeInsets.zero,
                    ),
                    Text('Profile', style: TextStyles.body2.copyWith(color: AppColors.bodycolor)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Payment Methods', style: TextStyles.headline),
                const SizedBox(height: 6),
                Text(
                  'Manage how you pay for your local home repairs and services.',
                  style: TextStyles.body2.copyWith(color: AppColors.bodycolor),
                ),
                const SizedBox(height: 20),

                // Saved Cards
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saved Cards', style: TextStyles.title1),
                          Text('${cards.length} methods saved', style: TextStyles.caption2),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...cards.map((card) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _CardTile(card: card),
                          )),
                      const SizedBox(height: 4),
                      DottedAddCardButton(onTap: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Express Checkout
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Express Checkout', style: TextStyles.title1),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _ExpressCheckoutTile(
                              icon: Icons.apple,
                              title: 'Apple Pay',
                              subtitle: 'Linked to iCloud',
                              statusLabel: 'Enabled',
                              statusColor: AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ExpressCheckoutTile(
                              icon: Icons.g_mobiledata,
                              title: 'Google Pay',
                              subtitle: 'Not connected',
                              statusLabel: 'Setup',
                              statusColor: AppColors.bodycolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Secure Payments banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.titlecolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.shield_outlined, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Secure Payments',
                              style: TextStyles.title2.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Your payment information is encrypted and stored securely. FixIt Local never stores your full card number on our servers.',
                              style: TextStyles.caption2.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Recent Transactions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recent Transactions', style: TextStyles.title1),
                      const SizedBox(height: 12),
                      ...transactions.map((tx) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tx.title, style: TextStyles.body2),
                                    Text(tx.date, style: TextStyles.caption2),
                                  ],
                                ),
                                Text(
                                  tx.amount,
                                  style: TextStyles.body2.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 4),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text('View Billing History', style: TextStyles.body1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  final CardModel card;
  const _CardTile({required this.card});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.lightgrey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.credit_card,
            size: 18,
            color: card.type == 'Visa' ? AppColors.titlecolor : AppColors.redcolor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${card.type} ending in ${card.lastFour}', style: TextStyles.body2),
              Row(
                children: [
                  Text('Expires ${card.expiry}', style: TextStyles.caption2),
                  if (card.isDefault) ...[
                    Text(' • ', style: TextStyles.caption2),
                    Text(
                      'Default',
                      style: TextStyles.caption2.copyWith(color: AppColors.titlecolor),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined, size: 18, color: AppColors.bodycolor),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.redcolor),
        ),
      ],
    );
  }
}

class DottedAddCardButton extends StatelessWidget {
  final VoidCallback onTap;
  const DottedAddCardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightgrey1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle_outline, color: AppColors.titlecolor, size: 18),
            const SizedBox(width: 8),
            Text('Add New Card', style: TextStyles.body1),
          ],
        ),
      ),
    );
  }
}

class _ExpressCheckoutTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String statusLabel;
  final Color statusColor;

  const _ExpressCheckoutTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.statusLabel,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightgrey1),
      ),
      child: Column(
        children: [
          Icon(icon, size: 26, color: AppColors.blackColor),
          const SizedBox(height: 8),
          Text(title, style: TextStyles.body2),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyles.caption2),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              statusLabel,
              style: TextStyles.caption2.copyWith(color: statusColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}