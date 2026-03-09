import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool autoAcceptOrders = false;
  bool darkInvoices = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            'Tune notifications, operations, and billing defaults.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  title: const Text('Order Notifications'),
                  subtitle: const Text(
                    'Get instant alerts for new or cancelled orders.',
                  ),
                  value: notifications,
                  onChanged: (value) => setState(() => notifications = value),
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  title: const Text('Auto-Accept Repeat Orders'),
                  subtitle: const Text(
                    'Automatically accept repeat customer orders.',
                  ),
                  value: autoAcceptOrders,
                  onChanged: (value) =>
                      setState(() => autoAcceptOrders = value),
                ),
                const Divider(height: 1),
                SwitchListTile.adaptive(
                  title: const Text('Dark Invoice Mode'),
                  subtitle: const Text(
                    'Export invoices with dark accent style.',
                  ),
                  value: darkInvoices,
                  onChanged: (value) => setState(() => darkInvoices = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.security_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Last account security review completed 2 days ago.',
                    ),
                  ),
                  FilledButton(onPressed: () {}, child: const Text('Review')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
