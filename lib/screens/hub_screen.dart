import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/stacked_avatars.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user info
    final String fullName = 'John Doe';
    final String username = 'johndoe';
    final String profileImageUrl = 'https://randomuser.me/api/portraits/men/1.jpg';
    final int totalTables = 12;
    final int totalBuddies = 8;
    final double totalSpent = 245.75;

    // Mock active tables
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

    // Mock completed tables
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

    // Mock pending buddy requests
    final int pendingBuddyRequests = 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hub'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info section
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    Text(
                      '@$username',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Quick action: Add Buddy
                IconButton(
                  icon: const Icon(Icons.person_add),
                  tooltip: 'Add Buddy',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Quick stats section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatCard(label: 'Tables', value: '$totalTables'),
                _StatCard(label: 'Buddies', value: '$totalBuddies'),
                _StatCard(label: 'Spent', value: '\$${totalSpent.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 24),
            // Pending buddy requests banner
            if (pendingBuddyRequests > 0)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppTheme.accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person_add, color: AppTheme.accentColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'You have $pendingBuddyRequests pending buddy requests',
                        style: const TextStyle(color: AppTheme.textPrimary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
            // Quick action: Create Table
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create Table'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Recent Tables section
            const Text(
              'Recent Tables',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            // Active subsection (show up to 2 most recent)
            if (activeTables.isNotEmpty) ...[
              const Text(
                'Active',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              for (final table in activeTables.take(2))
                _TableCard(
                  name: table['name'],
                  total: table['total'],
                  participants: table['participants'],
                  isActive: true,
                ),
            ],
            // Completed subsection (show up to 2 most recent)
            if (completedTables.isNotEmpty) ...[
              const SizedBox(height: 10),
              const Text(
                'Completed',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              for (final table in completedTables.take(2))
                _TableCard(
                  name: table['name'],
                  total: table['total'],
                  participants: table['participants'],
                  isActive: false,
                  date: table['date'],
                ),
            ],
          ],
        ),
      ),
    );
  }
}

// Widget for quick stats
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for table cards (active and completed)
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