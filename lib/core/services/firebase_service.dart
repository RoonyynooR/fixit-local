import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localservice/core/models/provider_model.dart';
import 'package:localservice/core/models/customer_model.dart';

class AppFirebaseService {
  static final fireStore = FirebaseFirestore.instance;
  static final providers = fireStore.collection('providers');
  static final customers = fireStore.collection('customers');

  static Future<void> createCustomer(CustomerModel customerModel) async {
    await customers.doc(customerModel.uId).set(customerModel.toJson());
  }

  static Future<void> createProvider(ProviderModel providerModel) async {
    await providers.doc(providerModel.uId).set(providerModel.toJson());
  }

  static Future<DocumentSnapshot> getProvider(String id) async {
    return await providers.doc(id).get();
  }

  static Future<List<ProviderModel>> getAllProviders() async {
    final snapshot = await providers
        .orderBy("rating", descending: true)
        .get();
    return snapshot.docs
        .map((doc) => ProviderModel.fromJson(Map<String, dynamic>.from(doc.data() as Map)))
        .toList();
  }

  static Future<List<ProviderModel>> getNearbyProviders() async {
    final snapshot = await providers
        .orderBy("distance")
        .get();
    return snapshot.docs
        .map((doc) => ProviderModel.fromJson(Map<String, dynamic>.from(doc.data() as Map)))
        .toList();
  }

  static Future<void> sendData() async {
    final providersSnapshot = await providers.limit(1).get();
    if (providersSnapshot.docs.isEmpty) {
      final dummyProviders = [
        ProviderModel(
          uId: 'provider_1',
          name: 'QuickDrain Plumbing',
          email: 'plumbing@quickdrain.com',
          phone: '123-456-7890',
          role: 'provider',
          imageUrl: 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&q=80&w=200',
          rating: 4.7,
          specialty: 'Emergency Repairs',
          category: 'Plumbing',
          distance: 0.8,
          pricePerHour: 80.0,
          isTopRated: true,
          about: 'Over 10 years of experience in emergency residential and commercial plumbing leaks and clogs.',
          servicesOffered: ['Drain Cleaning', 'Leak Detection', 'Pipe Repair'],
        ),
        ProviderModel(
          uId: 'provider_2',
          name: 'Sparky Lights Electrical',
          email: 'info@sparkylights.com',
          phone: '987-654-3210',
          role: 'provider',
          imageUrl: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&q=80&w=200',
          rating: 4.9,
          specialty: 'Wiring & Lighting',
          category: 'Electrical',
          distance: 1.2,
          pricePerHour: 95.0,
          isTopRated: true,
          about: 'Licensed electrician specializing in smart home integration, lighting installations, and troubleshooting.',
          servicesOffered: ['Panel Upgrades', 'Fixture Installation', 'Wiring Repair'],
        ),
        ProviderModel(
          uId: 'provider_3',
          name: 'EcoCool HVAC Services',
          email: 'contact@ecocoolhvac.com',
          phone: '555-555-5555',
          role: 'provider',
          imageUrl: 'https://images.unsplash.com/photo-1621905252507-b354bc25edac?auto=format&fit=crop&q=80&w=200',
          rating: 4.6,
          specialty: 'AC & Heating Fixes',
          category: 'HVAC',
          distance: 2.5,
          pricePerHour: 110.0,
          isTopRated: false,
          about: 'Providing sustainable heating, ventilation, and air conditioning repair and maintenance services.',
          servicesOffered: ['AC Install', 'Furnace Repair', 'Filter Replacement'],
        ),
        ProviderModel(
          uId: 'provider_4',
          name: 'ShineBright Cleaning',
          email: 'bookings@shinebright.com',
          phone: '333-333-3333',
          role: 'provider',
          imageUrl: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&q=80&w=200',
          rating: 4.8,
          specialty: 'Deep House Cleaning',
          category: 'Cleaning',
          distance: 1.5,
          pricePerHour: 45.0,
          isTopRated: true,
          about: 'Professional deep cleaners for houses, apartments, and offices. Fast, reliable, and friendly service.',
          servicesOffered: ['Deep Cleaning', 'Move-out Cleaning', 'Window Washing'],
        ),
      ];

      for (var pro in dummyProviders) {
        await createProvider(pro);
      }
    }

    final customersSnapshot = await customers.limit(1).get();
    if (customersSnapshot.docs.isEmpty) {
      final defaultCustomer = CustomerModel(
        uId: 'mock_customer_id',
        name: 'Jane Doe',
        email: 'jane.doe@example.com',
        phone: '555-123-4567',
        role: 'customer',
        imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=200',
        address: '123 Main St, Downtown Seattle',
      );
      await createCustomer(defaultCustomer);
    }
  }
}
