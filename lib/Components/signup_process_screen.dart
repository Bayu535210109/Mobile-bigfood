import 'package:flutter/material.dart';

class SignUpProcess extends StatelessWidget {
  String fullName = '';
  DateTime? selectedDate;
  String mobileNumber = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Fill in your info\nto get started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "This data won't be displayed in \nyour account profile for \nsecurity",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                fullName = value;
              },
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () => _selectDate(context),
              child: IgnorePointer(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                  controller: TextEditingController(
                    text: selectedDate != null
                        ? selectedDate.toString()
                        : 'Select Date',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/phone_icon.png',
                    height: 15.0, // Adjust the height as per your requirement
                    width: 15.0, // Adjust the width as per your requirement
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              onChanged: (value) {
                mobileNumber = value;
              },
            ),
            SizedBox(height: 20.0),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');// Do something with the form data
                print('Full Name: $fullName');
                print('Date of Birth: $selectedDate');
                print('Mobile Number: $mobileNumber');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(int.parse('FF6440', radix: 16)).withOpacity(1.0),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
