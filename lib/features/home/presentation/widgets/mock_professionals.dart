class ProfessionalModel {
  final String name;
  final double rating;
  final String specialty;
  final String category;
  final double distance;
  final double pricePerHour;
  final String? imageUrl;

  const ProfessionalModel({
    required this.name,
    required this.rating,
    required this.specialty,
    required this.category,
    required this.distance,
    required this.pricePerHour,
    this.imageUrl,
  });
}

const List<ProfessionalModel> mockProfessionals = [
  ProfessionalModel(
    name: 'QuickDrain Plumbing',
    rating: 4.7,
    specialty: 'Emergency Repairs',
    category: 'Plumbing',
    distance: 0.8,
    pricePerHour: 80.0,
    imageUrl: 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&q=80&w=200',
  ),
  ProfessionalModel(
    name: 'Sparky Lights Electrical',
    rating: 4.9,
    specialty: 'Wiring & Lighting',
    category: 'Electrical',
    distance: 1.2,
    pricePerHour: 95.0,
    imageUrl: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&q=80&w=200',
  ),
  ProfessionalModel(
    name: 'EcoCool HVAC Services',
    rating: 4.6,
    specialty: 'AC & Heating Fixes',
    category: 'HVAC',
    distance: 2.5,
    pricePerHour: 110.0,
    imageUrl: 'https://images.unsplash.com/photo-1621905252507-b354bc25edac?auto=format&fit=crop&q=80&w=200',
  ),
  ProfessionalModel(
    name: 'ShineBright Cleaning',
    rating: 4.8,
    specialty: 'Deep House Cleaning',
    category: 'Cleaning',
    distance: 1.5,
    pricePerHour: 45.0,
    imageUrl: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&q=80&w=200',
  ),
];
