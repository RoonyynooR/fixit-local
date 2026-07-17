import 'package:flutter/material.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';

class BookingModel {
  final String name;
  final String service;
  final String time;
  final String date;
  final String distance;
  final bool isNext;

  BookingModel({
    required this.name,
    required this.service,
    required this.time,
    required this.date,
    required this.distance,
    required this.isNext,
  });
}

class ProviderDashboardPage extends StatefulWidget {
  const ProviderDashboardPage({super.key});

  @override
  State<ProviderDashboardPage> createState() => _ProviderDashboardPageState();
}

class _ProviderDashboardPageState extends State<ProviderDashboardPage> {
  bool isAcceptingJobs = true;

  Future<List<BookingModel>> fetchBookings() async {
    // Mock data - هنستبدلها بـ API حقيقي بعدين
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BookingModel(
        name: 'Sarah Jenkins',
        service: 'Plumbing',
        time: '09:30 AM',
        date: 'Today, Oct 24',
        distance: '2.4 miles away',
        isNext: true,
      ),
      BookingModel(
        name: 'Arthur Miller',
        service: 'Electrical Repair',
        time: '1:00 PM',
        date: '',
        distance: '',
        isNext: false,
      ),
      BookingModel(
        name: 'Elena Rodriguez',
        service: 'HVAC Maintenance',
        time: '3:30 PM',
        date: '',
        distance: '',
        isNext: false,
      ),
      BookingModel(
        name: 'Marcus Chen',
        service: 'General Handyman',
        time: '5:00 PM',
        date: '',
        distance: '',
        isNext: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      body: SafeArea(
        child: FutureBuilder<List<BookingModel>>(
          future: fetchBookings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('حصل خطأ: ${snapshot.error}'));
            }

            final bookings = snapshot.data ?? [];

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('PROVIDER DASHBOARD', style: TextStyles.caption2.copyWith(color: AppColors.titlecolor)),
                const SizedBox(height: 8),
                Text('Manage Your Day', style: TextStyles.headline),
                const SizedBox(height: 4),
                Text(
                  'You have ${bookings.length} bookings scheduled for today.',
                  style: TextStyles.body2.copyWith(color: AppColors.bodycolor),
                ),
                const SizedBox(height: 16),

                // Accepting Jobs toggle
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Accepting Jobs', style: TextStyles.title1),
                            Text(
                              'Offline mode hides you from search',
                              style: TextStyles.caption2,
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: isAcceptingJobs,
                        activeColor: AppColors.titlecolor,
                        onChanged: (value) {
                          setState(() {
                            isAcceptingJobs = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Upcoming Bookings header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming Bookings', style: TextStyles.title1),
                    Text('View Calendar', style: TextStyles.body1),
                  ],
                ),
                const SizedBox(height: 12),

                // Bookings list
                ...bookings.map((booking) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _BookingCard(booking: booking),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final BookingModel booking;
  const _BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: booking.isNext
            ? Border.all(color: AppColors.titlecolor, width: 1.5)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (booking.isNext)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.titlecolor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'NEXT UP',
                style: TextStyles.caption2.copyWith(color: Colors.white),
              ),
            ),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.lightgrey,
                child: Text(booking.name[0]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(booking.name, style: TextStyles.title1),
                    if (booking.distance.isNotEmpty)
                      Text(booking.distance, style: TextStyles.caption2),
                  ],
                ),
              ),
              if (!booking.isNext) const Icon(Icons.chevron_right),
            ],
          ),
          if (booking.isNext) ...[
            const SizedBox(height: 12),
            Text(booking.time, style: TextStyles.title.copyWith(color: AppColors.titlecolor)),
            Text(booking.date, style: TextStyles.caption2),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.titlecolor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Start Navigation', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: const Text('Message'),
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 4),
            Text('${booking.service} • ${booking.time}', style: TextStyles.caption2),
          ],
        ],
      ),
    );
  }
}