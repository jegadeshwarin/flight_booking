import 'package:flutter/material.dart';

class FlightSearchResults extends StatelessWidget {
  const FlightSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Ezy Travel'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {Navigator.of(context).pop();},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Info Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BLR - Bengaluru to DXB - Dubai',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                          'Departure: Sat, 23 Mar - Return: Sat, 23 Mar'),
                      const SizedBox(height: 8),
                      const Text(
                        '(Round Trip)',
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Modify Search',
                          style: TextStyle(
                              color: Colors.green,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Date Selection Row
         const   Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DateCard(date: 'Mar 22 - Mar 23', price: 'AED 741'),
                          DateCard(
                              date: 'Mar 23 - Mar 24',
                              price: 'AED 721',
                              isSelected: true),
                          DateCard(date: 'Mar 24 - Mar 25', price: 'AED 750'),
                          //   ],
                          // ),
                        ]))),
            const SizedBox(height: 16),
            // Filter and Sort Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('851 Flight Found'),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.sort, color: Colors.black),
                        label: const Text('Sort',
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_alt_outlined,
                            color: Colors.black),
                        label: const Text('Filter',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Flight List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // Sample Count
              itemBuilder: (context, index) {
                return const FlightCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DateCard extends StatelessWidget {
  final String date;
  final String price;
  final bool isSelected;

  const DateCard(
      {super.key,
      required this.date,
      required this.price,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? Colors.green : Colors.grey),
        color: isSelected ? Colors.green.shade50 : Colors.white,
      ),
      child: Column(
        children: [
          Text(date),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Onward Flight Details
            const ListTile(
              leading: Icon(Icons.flight),
              title: Text('Onward - Garuda Indonesia'),
              subtitle: Text(
                  '14:35 BLR - Bengaluru → 21:55 DXB - Dubai\n4h 30m, 2 Stops'),
              trailing: Text('AED 409',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            // Return Flight Details
            const ListTile(
              leading: Icon(Icons.flight),
              title: Text('Return - Garuda Indonesia'),
              subtitle: Text(
                  '21:55 DXB - Dubai → 14:35 BLR - Bengaluru\n4h 30m, 2 Stops'),
              trailing: Text('AED 359',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            // Footer Actions
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text('Cheapest',
                            style: TextStyle(color: Colors.green)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text('Refundable',
                            style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Flight Details',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
