import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Blood Request Accepted',
      'message': 'Rafi Ahmed has accepted your A+ blood request',
      'time': '2 mins ago',
      'read': false,
      'type': 'request',
    },
    {
      'title': 'Donation Reminder',
      'message': 'You\'re eligible to donate blood again after 3 months',
      'time': '1 day ago',
      'read': true,
      'type': 'reminder',
    },
    {
      'title': 'New Blood Donor',
      'message': '5 new O- donors available in your area',
      'time': '3 days ago',
      'read': true,
      'type': 'donor',
    },
    {
      'title': 'Campaign Update',
      'message': 'Blood donation camp at Dhaka Medical College tomorrow',
      'time': '1 week ago',
      'read': true,
      'type': 'campaign',
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () => _markAllAsRead(context),
            child: const Text(
              'Mark all as read',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder:
            (context, index) => _buildNotificationCard(notifications[index]),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    IconData icon;
    Color iconColor;

    switch (notification['type']) {
      case 'request':
        icon = Icons.bloodtype;
        iconColor = Colors.red;
        break;
      case 'reminder':
        icon = Icons.notifications_active;
        iconColor = Colors.orange;
        break;
      case 'donor':
        icon = Icons.people;
        iconColor = Colors.blue;
        break;
      case 'campaign':
        icon = Icons.campaign;
        iconColor = Colors.green;
        break;
      default:
        icon = Icons.notifications;
        iconColor = Colors.grey;
    }

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: notification['read'] ? Colors.white : Colors.red[50],
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _handleNotificationTap(notification),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            notification['read']
                                ? FontWeight.normal
                                : FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification['message'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification['time'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              if (!notification['read'])
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Handle notification tap based on type
    switch (notification['type']) {
      case 'request':
        // Navigate to request details
        break;
      case 'donor':
        // Navigate to donor list
        break;
      case 'campaign':
        // Show campaign details
        break;
    }
  }

  void _markAllAsRead(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications marked as read')),
    );
  }
}
