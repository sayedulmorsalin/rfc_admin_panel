import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/dummy_data.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Compute a bounded table width to prevent Expanded from getting
    // unbounded constraints inside the horizontal SingleChildScrollView.
    // 40 = page padding (20×2), 32 = card padding (16×2).
    final tableWidth = (MediaQuery.sizeOf(context).width - 72).clamp(
      650.0,
      double.infinity,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Orders',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            'Monitor live order activity, status, and billing totals.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _FilterChip(label: 'All', selected: true),
              _FilterChip(label: 'Processing'),
              _FilterChip(label: 'Shipped'),
              _FilterChip(label: 'Delivered'),
              _FilterChip(label: 'Cancelled'),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: tableWidth,
                  child: Column(
                    children: [
                      const _HeaderRow(),
                      const Divider(height: 20),
                      ...dummyOrders.map((order) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  order.orderId,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(flex: 3, child: Text(order.customer)),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '\$${order.total.toStringAsFixed(2)}',
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: _StatusPill(status: order.status),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w700,
    );

    return Row(
      children: [
        Expanded(flex: 2, child: Text('Order', style: style)),
        Expanded(flex: 3, child: Text('Customer', style: style)),
        Expanded(flex: 2, child: Text('Total', style: style)),
        Expanded(flex: 2, child: Text('Status', style: style)),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.16)
            : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String status;

  const _StatusPill({required this.status});

  Color _color() {
    final normalized = status.toLowerCase();
    if (normalized.contains('deliver')) return const Color(0xFF15803D);
    if (normalized.contains('ship')) return const Color(0xFF0369A1);
    if (normalized.contains('cancel')) return const Color(0xFFB91C1C);
    if (normalized.contains('pending')) return const Color(0xFFB45309);
    return const Color(0xFF0F766E);
  }

  @override
  Widget build(BuildContext context) {
    final color = _color();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: TextStyle(fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}
