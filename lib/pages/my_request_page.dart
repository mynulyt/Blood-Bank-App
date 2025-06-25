import 'package:blood_bank/pages/request_blood_page.dart';
import 'package:flutter/material.dart';

class MyRequestsPage extends StatelessWidget {
  // Sample request data - replace with your actual data source
  final List<Map<String, dynamic>> requests = [
    {
      'id': '#REQ-1001',
      'bloodGroup': 'A+',
      'status': 'Completed',
      'date': '2023-06-15',
      'units': 2,
      'hospital': 'Dhaka Medical College',
      'donor': 'Rafi Ahmed',
      'donorContact': '+8801712345678',
    },
    {
      'id': '#REQ-1002',
      'bloodGroup': 'O-',
      'status': 'Pending',
      'date': '2023-06-20',
      'units': 1,
      'hospital': 'Apollo Hospital',
      'donor': 'Samiha Khan',
      'donorContact': '+8801812345678',
    },
    {
      'id': '#REQ-1003',
      'bloodGroup': 'B+',
      'status': 'Cancelled',
      'date': '2023-05-10',
      'units': 3,
      'hospital': 'Square Hospital',
      'donor': 'Tahsin Rahman',
      'donorContact': '+8801912345678',
    },
  ];

  MyRequestsPage({super.key});

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "My Blood Requests",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body:
          requests.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: requests.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder:
                    (context, index) => _buildRequestCard(requests[index]),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestBloodPage()),
            ),
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no_requests.png', // Add this asset to your project
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          const Text(
            "No Blood Requests Yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "You haven't made any blood requests yet. Tap the + button to request blood when needed.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    Color statusColor;
    switch (request['status']) {
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Cancelled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showRequestDetails(context!, request),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    request['id'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      request['status'],
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Text(
                      request['bloodGroup'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request['hospital'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${request['units']} unit(s) • ${request['date']}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (request['status'] == 'Pending') ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _cancelRequest(context!, request['id']),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Cancel Request",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showRequestDetails(BuildContext context, Map<String, dynamic> request) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      child: Text(
                        request['bloodGroup'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      request['id'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(
                          request['status'],
                        ).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        request['status'],
                        style: TextStyle(
                          color: _getStatusColor(request['status']),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildDetailItem(
                    Icons.local_hospital,
                    "Hospital:",
                    request['hospital'],
                  ),
                  _buildDetailItem(
                    Icons.calendar_today,
                    "Request Date:",
                    request['date'],
                  ),
                  _buildDetailItem(
                    Icons.bloodtype,
                    "Units Requested:",
                    "${request['units']} unit(s)",
                  ),
                  if (request['donor'] != null)
                    _buildDetailItem(Icons.person, "Donor:", request['donor']),
                  if (request['donorContact'] != null)
                    _buildDetailItem(
                      Icons.phone,
                      "Donor Contact:",
                      request['donorContact'],
                    ),
                  const SizedBox(height: 24),
                  if (request['status'] == 'Pending') ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            () =>
                                _contactDonor(context, request['donorContact']),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("CONTACT DONOR"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _cancelRequest(context, request['id']);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "CANCEL REQUEST",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.red, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Filter Requests"),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: true,
                        onSelected: (selected) {},
                      ),
                      FilterChip(
                        label: const Text('Completed'),
                        selected: false,
                        onSelected: (selected) {},
                      ),
                      FilterChip(
                        label: const Text('Pending'),
                        selected: false,
                        onSelected: (selected) {},
                      ),
                      FilterChip(
                        label: const Text('Cancelled'),
                        selected: false,
                        onSelected: (selected) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Time Period",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('Last 30 days'),
                        selected: true,
                        onSelected: (selected) {},
                      ),
                      FilterChip(
                        label: const Text('Last 6 months'),
                        selected: false,
                        onSelected: (selected) {},
                      ),
                      FilterChip(
                        label: const Text('All time'),
                        selected: false,
                        onSelected: (selected) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Apply Filters"),
              ),
            ],
          ),
    );
  }

  void _cancelRequest(BuildContext context, String requestId) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Cancel Request"),
            content: const Text(
              "Are you sure you want to cancel this blood request?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("No"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Request $requestId cancelled"),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: const Text(
                  "Yes, Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  void _contactDonor(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Contact Donor"),
            content: Text(
              "Would you like to call or message this donor at $phoneNumber?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement call functionality
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Redirecting to phone call..."),
                    ),
                  );
                },
                child: const Text("Call"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Implement message functionality
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Redirecting to messaging..."),
                    ),
                  );
                },
                child: const Text("Message"),
              ),
            ],
          ),
    );
  }
}
