import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/dummy_data.dart';
import 'package:rfc_admin_panel/view/home/widgets/dashboard_card.dart';
import 'package:rfc_admin_panel/view/home/widgets/recent_orders_table.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = width > 1100
        ? (width - 340) / 4
        : width > 700
        ? (width - 120) / 2
        : width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeroBanner(width: width),
          const SizedBox(height: 18),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              SizedBox(
                width: cardWidth,
                height: 180,
                child: const DashboardCard(
                  title: 'Total Orders',
                  value: '1,284',
                  icon: Icons.local_mall_outlined,
                  delta: '+8.4% this week',
                  accentColor: Color(0xFF0F766E),
                ),
              ),
              SizedBox(
                width: cardWidth,
                height: 180,
                child: const DashboardCard(
                  title: 'Revenue',
                  value: '\$24,970',
                  icon: Icons.paid_outlined,
                  delta: '+11.9% this month',
                  accentColor: Color(0xFF0E7490),
                ),
              ),
              SizedBox(
                width: cardWidth,
                height: 180,
                child: const DashboardCard(
                  title: 'New Customers',
                  value: '86',
                  icon: Icons.group_outlined,
                  delta: '+5.1% this week',
                  accentColor: Color(0xFF9333EA),
                ),
              ),
              SizedBox(
                width: cardWidth,
                height: 180,
                child: const DashboardCard(
                  title: 'Pending Delivery',
                  value: '19',
                  icon: Icons.local_shipping_outlined,
                  delta: '3 need attention',
                  accentColor: Color(0xFFEA580C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          RecentOrdersTable(orders: dummyOrders.take(5).toList()),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  final double width;

  const _HeroBanner({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF134E4A), Color(0xFF0E7490)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0E7490).withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: width > 760
          ? const Row(
              children: [
                Expanded(child: _BannerText()),
                SizedBox(width: 12),
                _BannerBadge(),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_BannerText(), SizedBox(height: 14), _BannerBadge()],
            ),
    );
  }
}

class _BannerText extends StatelessWidget {
  const _BannerText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard Overview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Your operations are healthy today. Revenue and conversion are both trending up compared to last week.',
          style: TextStyle(
            color: Color(0xFFE2E8F0),
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _BannerBadge extends StatelessWidget {
  const _BannerBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fulfillment',
            style: TextStyle(
              color: Color(0xFFE2E8F0),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '94.8%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
