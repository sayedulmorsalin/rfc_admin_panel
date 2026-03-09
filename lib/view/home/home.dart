import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/view/home/pages/catalog_page.dart';
import 'package:rfc_admin_panel/view/home/pages/dashboard_page.dart';
import 'package:rfc_admin_panel/view/home/pages/orders_page.dart';
import 'package:rfc_admin_panel/view/home/pages/settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<_NavItem> _items = const [
    _NavItem('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
    _NavItem('Orders', Icons.receipt_long_outlined, Icons.receipt_long),
    _NavItem('Catalog', Icons.inventory_2_outlined, Icons.inventory_2),
    _NavItem('Settings', Icons.settings_outlined, Icons.settings),
  ];

  final List<Widget> _pages = const [
    DashboardPage(),
    OrdersPage(),
    CatalogPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final bool useRail = width >= 920;

    return Scaffold(
      appBar: AppBar(
        title: Text(_items[_selectedIndex].title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8FBFB), Color(0xFFF2F6F6)],
          ),
        ),
        child: useRail
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: NavigationRail(
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() => _selectedIndex = index);
                      },
                      labelType: NavigationRailLabelType.all,
                      minWidth: 74,
                      destinations: _items
                          .map(
                            (item) => NavigationRailDestination(
                              icon: Icon(item.icon),
                              selectedIcon: Icon(item.selectedIcon),
                              label: Text(item.title),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(child: _pages[_selectedIndex]),
                ],
              )
            : _pages[_selectedIndex],
      ),
      bottomNavigationBar: useRail
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              destinations: _items
                  .map(
                    (item) => NavigationDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.selectedIcon),
                      label: item.title,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const _NavItem(this.title, this.icon, this.selectedIcon);
}
