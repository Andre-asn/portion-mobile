import 'package:flutter/material.dart';
import '../utils/theme.dart';

class BuddiesScreen extends StatelessWidget {
  const BuddiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data: names, usernames, and emails (for future search)
    final names = ['Alex Johnson', 'Sarah Chen', 'Mike Rodriguez', 'Emma Wilson', 'David Kim'];
    final usernames = ['alexj', 'sarahc', 'miker', 'emmaw', 'davidk'];
    final emails = ['alex@email.com', 'sarah@email.com', 'mike@email.com', 'emma@email.com', 'david@email.com'];
    // In the future, you can add phone numbers here too

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Buddies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // TODO: Navigate to add buddy screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add new buddy - Coming soon!'),
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
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search buddies by name, username, phone, or email...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Buddies List
            const Text(
              'My Buddies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                        child: Text(
                          names[index].split(' ').map((e) => e[0]).join(''),
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      title: Text(
                        names[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      // Show username instead of email
                      subtitle: Text(
                        '@${usernames[index]}',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == 'remove') {
                            // TODO: Implement remove buddy
                          }
                        },
                        itemBuilder: (context) => [
                          // Only show Remove Buddy option now
                          const PopupMenuItem(
                            value: 'remove',
                            child: Row(
                              children: [
                                Icon(Icons.person_remove, color: AppTheme.errorColor),
                                SizedBox(width: 8),
                                Text('Remove Buddy', style: TextStyle(color: AppTheme.errorColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // TODO: Navigate to buddy profile
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('View ${names[index]} profile - Coming soon!'),
                          ),
                        );
                      },
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