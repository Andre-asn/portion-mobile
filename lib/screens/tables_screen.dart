import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../widgets/stacked_avatars.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock participant images for each table
    final List<List<String>> tableParticipants = [
      [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/women/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/women/4.jpg',
        'https://randomuser.me/api/portraits/men/5.jpg',
      ],
      [
        'https://randomuser.me/api/portraits/women/6.jpg',
        'https://randomuser.me/api/portraits/men/7.jpg',
        'https://randomuser.me/api/portraits/women/8.jpg',
      ],
      [
        'https://randomuser.me/api/portraits/men/9.jpg',
        'https://randomuser.me/api/portraits/women/10.jpg',
      ],
    ];

    final List<String> tableNames = ["Pizza Place", "Sushi Bar", "Burger Joint"];
    final List<double> tableTotals = [25.50, 30.75, 18.20];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tables'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Active Tables Section
            const Text(
              'Active Tables',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Placeholder count
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Stacked avatars on the left
                        StackedAvatars(
                          imageUrls: tableParticipants[index],
                          size: 36,
                        ),
                        const SizedBox(width: 16),
                        // Table info in the center
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tableNames[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${tableParticipants[index].length} participants • \$${tableTotals[index].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Arrow icon on the right
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.07),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                            color: AppTheme.textPrimary,
                            onPressed: () {
                              // TODO: Navigate to table details
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Open table ${index + 1} - Coming soon!'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 