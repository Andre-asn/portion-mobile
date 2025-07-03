import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/stacked_avatars.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  // Mock data for demonstration
  final List<Map<String, dynamic>> activeTables = [
    {
      'name': 'Pizza Place',
      'total': 25.50,
      'participants': [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/women/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
      ],
    },
    {
      'name': 'Sushi Bar',
      'total': 30.75,
      'participants': [
        'https://randomuser.me/api/portraits/women/4.jpg',
        'https://randomuser.me/api/portraits/men/5.jpg',
      ],
    },
  ];
  final List<Map<String, dynamic>> completedTables = [
    {
      'name': 'Burger Joint',
      'total': 18.20,
      'date': '2024-06-01',
      'participants': [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/women/2.jpg',
      ],
    },
    {
      'name': 'Taco Night',
      'total': 22.10,
      'date': '2024-05-28',
      'participants': [
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/women/4.jpg',
      ],
    },
  ];

  String searchQuery = '';
  // Example filter state (expand as needed)
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    // Filtered lists based on search and filter (for now, just search by name)
    final filteredActive = activeTables.where((table) => table['name'].toLowerCase().contains(searchQuery.toLowerCase())).toList();
    final filteredCompleted = completedTables.where((table) => table['name'].toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
        actions: [
          // Filter button
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
            onPressed: () {
              // TODO: Show filter dialog/menu
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Filter Tables'),
                  content: const Text('Filter options coming soon!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search tables...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 24),
            // Active Tables section
            const Text(
              'Active Tables',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            if (filteredActive.isEmpty)
              const Text('No active tables.'),
            for (final table in filteredActive)
              _TableCard(
                name: table['name'],
                total: table['total'],
                participants: table['participants'],
                isActive: true,
              ),
            const SizedBox(height: 32),
            // Completed Tables section
            const Text(
              'Completed Tables',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            if (filteredCompleted.isEmpty)
              const Text('No completed tables.'),
            for (final table in filteredCompleted)
              _TableCard(
                name: table['name'],
                total: table['total'],
                participants: table['participants'],
                isActive: false,
                date: table['date'],
              ),
          ],
        ),
      ),
      // Floating action button to create a table
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create table screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create new table - Coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Create Table',
      ),
    );
  }
}

// Table card widget (reuse from hub for consistency)
class _TableCard extends StatelessWidget {
  final String name;
  final double total;
  final List<String> participants;
  final bool isActive;
  final String? date;
  const _TableCard({
    required this.name,
    required this.total,
    required this.participants,
    required this.isActive,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.backgroundColor : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          StackedAvatars(imageUrls: participants, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${total.toStringAsFixed(2)}' + (date != null ? ' • $date' : ''),
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isActive ? Icons.arrow_forward_ios_rounded : Icons.check_circle,
            color: isActive ? AppTheme.primaryColor : Colors.green,
            size: 20,
          ),
        ],
      ),
    );
  }
} 