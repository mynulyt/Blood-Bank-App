import 'package:blood_bank/models/donar_model.dart';
import 'package:blood_bank/widgets/doner_card.dart';
import 'package:flutter/material.dart';

class DonorListPage extends StatefulWidget {
  const DonorListPage({super.key});

  @override
  State<DonorListPage> createState() => _DonorListPageState();
}

class _DonorListPageState extends State<DonorListPage> {
  final List<DonorModel> allDonors = [
    DonorModel(
      name: 'Rafi Ahmed',
      bloodGroup: 'A+',
      location: 'Dhaka',
      lastDonation: '3 months ago',
      availability: 'Available',
      phone: '+8801712345678',
      donations: 5,
    ),
    DonorModel(
      name: 'Samiha Khan',
      bloodGroup: 'O-',
      location: 'Chittagong',
      lastDonation: '1 month ago',
      availability: 'Available',
      phone: '+8801812345678',
      donations: 3,
    ),
    DonorModel(
      name: 'Tahsin Rahman',
      bloodGroup: 'B+',
      location: 'Sylhet',
      lastDonation: '2 weeks ago',
      availability: 'Not available until next month',
      phone: '+8801912345678',
      donations: 7,
    ),
    DonorModel(
      name: 'Nadia Islam',
      bloodGroup: 'AB-',
      location: 'Khulna',
      lastDonation: '6 months ago',
      availability: 'Available',
      phone: '+8801612345678',
      donations: 2,
    ),
  ];

  List<DonorModel> filteredDonors = [];
  String? selectedBloodGroup;
  String? selectedLocation;
  bool showAvailableOnly = false;

  @override
  void initState() {
    super.initState();
    filteredDonors = allDonors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Available Donors",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Blood Group Filter Chips
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: selectedBloodGroup == null,
                  onSelected: (selected) {
                    setState(() {
                      selectedBloodGroup = null;
                      _applyFilters();
                    });
                  },
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('A+'),
                  selected: selectedBloodGroup == 'A+',
                  onSelected: (selected) {
                    setState(() {
                      selectedBloodGroup = selected ? 'A+' : null;
                      _applyFilters();
                    });
                  },
                  backgroundColor: Colors.red[50],
                  selectedColor: Colors.red[100],
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('B+'),
                  selected: selectedBloodGroup == 'B+',
                  onSelected: (selected) {
                    setState(() {
                      selectedBloodGroup = selected ? 'B+' : null;
                      _applyFilters();
                    });
                  },
                  backgroundColor: Colors.red[50],
                  selectedColor: Colors.red[100],
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('O-'),
                  selected: selectedBloodGroup == 'O-',
                  onSelected: (selected) {
                    setState(() {
                      selectedBloodGroup = selected ? 'O-' : null;
                      _applyFilters();
                    });
                  },
                  backgroundColor: Colors.red[50],
                  selectedColor: Colors.red[100],
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('AB+'),
                  selected: selectedBloodGroup == 'AB+',
                  onSelected: (selected) {
                    setState(() {
                      selectedBloodGroup = selected ? 'AB+' : null;
                      _applyFilters();
                    });
                  },
                  backgroundColor: Colors.red[50],
                  selectedColor: Colors.red[100],
                ),
              ],
            ),
          ),

          // Donor Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  "${filteredDonors.length} donors found",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Spacer(),
                const Text(
                  "Nearby first",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),

          // Donor List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: filteredDonors.length,
              itemBuilder: (context, index) {
                return DonorCard(donor: filteredDonors[index]);
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEmergencyDialog(context),
        icon: const Icon(Icons.emergency, color: Colors.white),
        label: const Text("Emergency", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        elevation: 4,
      ),
    );
  }

  void _applyFilters() {
    setState(() {
      filteredDonors =
          allDonors.where((donor) {
            final bloodGroupMatch =
                selectedBloodGroup == null ||
                donor.bloodGroup == selectedBloodGroup;
            final locationMatch =
                selectedLocation == null || donor.location == selectedLocation;
            final availabilityMatch =
                !showAvailableOnly || donor.availability == 'Available';

            return bloodGroupMatch && locationMatch && availabilityMatch;
          }).toList();
    });
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Search Donors"),
            content: TextField(
              decoration: InputDecoration(
                hintText: "Search by name or location",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  filteredDonors =
                      allDonors
                          .where(
                            (donor) =>
                                donor.name.toLowerCase().contains(
                                  query.toLowerCase(),
                                ) ||
                                donor.location.toLowerCase().contains(
                                  query.toLowerCase(),
                                ),
                          )
                          .toList();
                });
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    filteredDonors = allDonors;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Search"),
              ),
            ],
          ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text("Filter Donors"),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const Text(
                        "Blood Group",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          FilterChip(
                            label: const Text('A+'),
                            selected: selectedBloodGroup == 'A+',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'A+' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('A-'),
                            selected: selectedBloodGroup == 'A-',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'A-' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('B+'),
                            selected: selectedBloodGroup == 'B+',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'B+' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('B-'),
                            selected: selectedBloodGroup == 'B-',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'B-' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('AB+'),
                            selected: selectedBloodGroup == 'AB+',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'AB+' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('AB-'),
                            selected: selectedBloodGroup == 'AB-',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'AB-' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('O+'),
                            selected: selectedBloodGroup == 'O+',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'O+' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('O-'),
                            selected: selectedBloodGroup == 'O-',
                            onSelected: (selected) {
                              setState(() {
                                selectedBloodGroup = selected ? 'O-' : null;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          FilterChip(
                            label: const Text('Dhaka'),
                            selected: selectedLocation == 'Dhaka',
                            onSelected: (selected) {
                              setState(() {
                                selectedLocation = selected ? 'Dhaka' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('Chittagong'),
                            selected: selectedLocation == 'Chittagong',
                            onSelected: (selected) {
                              setState(() {
                                selectedLocation =
                                    selected ? 'Chittagong' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('Sylhet'),
                            selected: selectedLocation == 'Sylhet',
                            onSelected: (selected) {
                              setState(() {
                                selectedLocation = selected ? 'Sylhet' : null;
                              });
                            },
                          ),
                          FilterChip(
                            label: const Text('Khulna'),
                            selected: selectedLocation == 'Khulna',
                            onSelected: (selected) {
                              setState(() {
                                selectedLocation = selected ? 'Khulna' : null;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Availability",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          FilterChip(
                            label: const Text('Available Now'),
                            selected: showAvailableOnly,
                            onSelected: (selected) {
                              setState(() {
                                showAvailableOnly = selected;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedBloodGroup = null;
                        selectedLocation = null;
                        showAvailableOnly = false;
                      });
                      Navigator.pop(context);
                      _applyFilters();
                    },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _applyFilters();
                    },
                    child: const Text("Apply Filters"),
                  ),
                ],
              );
            },
          ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Emergency Blood Need"),
            content: const Text(
              "This will notify all nearby donors immediately. Use only for critical cases.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Emergency alert sent to nearby donors"),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: const Text(
                  "Send Alert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }
}
