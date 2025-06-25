import 'package:flutter/material.dart';

class RequestBloodPage extends StatelessWidget {
  final nameController = TextEditingController();
  final groupController = TextEditingController();
  final locationController = TextEditingController();
  final hospitalController = TextEditingController();
  final unitsController = TextEditingController();
  final urgencyController = TextEditingController();
  final contactController = TextEditingController();

  RequestBloodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Blood Request",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Urgent Blood Need",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill all the details carefully",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Patient Name
              _buildFormField(
                controller: nameController,
                label: "Patient Name",
                icon: Icons.person,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Blood Group Dropdown
              DropdownButtonFormField<String>(
                decoration: _inputDecoration(
                  "Blood Group",
                  Icons.bloodtype,
                  true,
                ),
                items: const [
                  DropdownMenuItem(value: 'A+', child: Text('A+')),
                  DropdownMenuItem(value: 'A-', child: Text('A-')),
                  DropdownMenuItem(value: 'B+', child: Text('B+')),
                  DropdownMenuItem(value: 'B-', child: Text('B-')),
                  DropdownMenuItem(value: 'AB+', child: Text('AB+')),
                  DropdownMenuItem(value: 'AB-', child: Text('AB-')),
                  DropdownMenuItem(value: 'O+', child: Text('O+')),
                  DropdownMenuItem(value: 'O-', child: Text('O-')),
                ],
                onChanged: (value) {
                  groupController.text = value ?? '';
                },
                validator: (value) => value == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              // Hospital/Clinic Name
              _buildFormField(
                controller: hospitalController,
                label: "Hospital/Clinic Name",
                icon: Icons.local_hospital,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Location
              _buildFormField(
                controller: locationController,
                label: "Location",
                icon: Icons.location_on,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Units Required
              _buildFormField(
                controller: unitsController,
                label: "Units Required",
                icon: Icons.exposure_plus_1,
                keyboardType: TextInputType.number,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Contact Number
              _buildFormField(
                controller: contactController,
                label: "Contact Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                isRequired: true,
              ),
              const SizedBox(height: 16),

              // Urgency Level
              DropdownButtonFormField<String>(
                decoration: _inputDecoration(
                  "Urgency Level",
                  Icons.warning,
                  true,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Emergency',
                    child: Text('Emergency (Within 1 hour)'),
                  ),
                  DropdownMenuItem(
                    value: 'Urgent',
                    child: Text('Urgent (Today)'),
                  ),
                  DropdownMenuItem(
                    value: 'Normal',
                    child: Text('Normal (Next 2-3 days)'),
                  ),
                ],
                onChanged: (value) {
                  urgencyController.text = value ?? '';
                },
              ),
              const SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_validateForm()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Blood request submitted successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "SUBMIT REQUEST",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _inputDecoration(label, icon, isRequired),
      keyboardType: keyboardType,
      validator:
          (value) =>
              isRequired && (value == null || value.isEmpty)
                  ? 'This field is required'
                  : null,
    );
  }

  InputDecoration _inputDecoration(
    String label,
    IconData icon,
    bool isRequired,
  ) {
    return InputDecoration(
      labelText: '$label${isRequired ? ' *' : ''}',
      prefixIcon: Icon(icon, color: Colors.red),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  bool _validateForm() {
    // In a real app, you would validate all required fields
    return nameController.text.isNotEmpty &&
        groupController.text.isNotEmpty &&
        hospitalController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        unitsController.text.isNotEmpty &&
        contactController.text.isNotEmpty;
  }
}
