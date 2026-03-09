import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedMonth = '2026-03';

  final List<String> _months = [
    '2025-10',
    '2025-11',
    '2025-12',
    '2026-01',
    '2026-02',
    '2026-03',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          // Today's Logins
          const Text(
            "Today's Logins",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFDCEEFD),
              border: Border.all(color: const Color(0xFF42A5F5), width: 3),
            ),
            child: const Center(
              child: Text(
                '54',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1565C0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Month selector
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Month: ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              DropdownButton<String>(
                value: _selectedMonth,
                underline: Container(height: 1, color: Colors.grey.shade400),
                items: _months
                    .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _selectedMonth = v);
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Stat cards row
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Total Customers',
                  value: '3,853',
                  icon: Icons.people_alt_outlined,
                  borderColor: const Color(0xFF42A5F5),
                  iconColor: const Color(0xFF1565C0),
                  bgColor: const Color(0xFFE3F2FD),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _StatCard(
                  label: 'Total Orders',
                  value: '10,466',
                  icon: Icons.shopping_bag_outlined,
                  borderColor: const Color(0xFF66BB6A),
                  iconColor: const Color(0xFF2E7D32),
                  bgColor: const Color(0xFFE8F5E9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Action buttons grid
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _ActionButton(
                label: 'Orders',
                icon: Icons.check_circle_outline,
                color: Color(0xFFF57C00),
                bgColor: Color(0xFFFFF3E0),
              ),
              _ActionButton(
                label: 'Shipping',
                icon: Icons.local_shipping_outlined,
                color: Color(0xFF1565C0),
                bgColor: Color(0xFFE8EAF6),
                badge: 93,
              ),
              _ActionButton(
                label: 'Delivered',
                icon: Icons.inventory_2_outlined,
                color: Color(0xFF212121),
                bgColor: Color(0xFFEEEEEE),
                badge: 19,
              ),
              _ActionButton(
                label: 'Add Product',
                icon: Icons.add_circle_outline,
                color: Color(0xFFF57C00),
                bgColor: Color(0xFFFFF3E0),
              ),
              _ActionButton(
                label: 'Update Banner',
                icon: Icons.image_outlined,
                color: Color(0xFF1565C0),
                bgColor: Color(0xFFE3F0FF),
              ),
              _ActionButton(
                label: 'Flash Sale',
                icon: Icons.bolt,
                color: Color(0xFF6A1B9A),
                bgColor: Color(0xFFF3E5F5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color borderColor;
  final Color iconColor;
  final Color bgColor;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.borderColor,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        children: [
          Icon(icon, size: 34, color: iconColor),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: iconColor,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final int? badge;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.bgColor,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: color.withValues(alpha: 0.35),
                    width: 1.5,
                  ),
                ),
                child: Icon(icon, size: 38, color: color),
              ),
              if (badge != null)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$badge',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
