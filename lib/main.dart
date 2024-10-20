import 'package:flight_booking/search_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: Colors.green,
        // accentColor: Colors.greenAccent,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Search Flights'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's start your trip",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 190,
                  width: 400,
                  child: Image.asset('assets/beach.jpg', fit: BoxFit.cover)),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TravelTypeButton(label: 'Round Trip', selected: false),
                  TravelTypeButton(label: 'One Way', selected: true),
                  TravelTypeButton(label: 'Multi-city', selected: false),
                ],
              ),
              const SizedBox(height: 16),
              const FlightSearchFields(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FlightSearchResults()));
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Search Flights'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Travel Inspirations',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TravelInspirationSection(),
              const SizedBox(height: 16),
              const Text(
                'Flight & Hotel Packages',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
               const SizedBox(height: 16),
              const FlightHotelPackages(),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelTypeButton extends StatelessWidget {
  final String label;
  final bool selected;

  const TravelTypeButton({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FlightSearchFields extends StatelessWidget {
  const FlightSearchFields({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchField(label: 'From', icon: Icons.location_on),
        SearchField(label: 'To', icon: Icons.location_on),
        Row(
          children: [
            Expanded(
              child: SearchField(
                label: 'Departure',
                icon: Icons.calendar_today,
                hintText: 'Sat, 23 Mar - 2024',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SearchField(
                label: 'Return',
                icon: Icons.calendar_today,
                hintText: 'Sat, 23 Mar - 2024',
                enabled: false,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SearchField(
                label: 'Travelers',
                icon: Icons.person,
                hintText: '1 Passenger',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SearchField(
                label: 'Cabin Class',
                icon: Icons.airline_seat_recline_normal,
                hintText: 'Economy Class',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? hintText;
  final bool enabled;

  const SearchField(
      {super.key, required this.label,
      required this.icon,
      this.hintText,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          TextField(
            enabled: enabled,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TravelInspirationSection extends StatelessWidget {
  const TravelInspirationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            height: 190,
            width: 200,
            child: Image.asset('assets/saudi_dubai.jpg', fit: BoxFit.cover)),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
            height: 190,
            width: 200,
            child: Image.asset('assets/kuwait.jpg', fit: BoxFit.cover)),

      ],
    ));
  }
}

class InspirationCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String price;

  const InspirationCard(
      {super.key, required this.imageUrl, required this.label, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl, width: 140, height: 80, fit: BoxFit.cover),
        const SizedBox(height: 8),
        Text(price, style: const TextStyle(color: Colors.grey)),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class FlightHotelPackages extends StatelessWidget {
  const FlightHotelPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 190,
        width: 500,
        child: Image.asset('assets/take_off.jpg', fit: BoxFit.cover));
  }
}
