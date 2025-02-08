<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient client = Supabase.instance.client;

  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String birthDate,
    required String phoneNumber,
    required String email,
    required String password,
    required String businessName,
    required DateTime launchDate,
    required double actualBalance,
    required String typeOfSelling,
    required String logoUrl,
  }) async {
    User? createdUser;
    
    try {
      // Validate all required fields are present
      if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty || 
          businessName.isEmpty || logoUrl.isEmpty) {
        return {
          'success': false,
          'message': 'All required fields must be filled',
        };
      }

      // Step 1: Create the auth user
      final AuthResponse response = await client.auth.signUp(
        email: email,
        password: password,
      );

      createdUser = response.user;
      if (createdUser == null) {
        throw Exception('User registration failed');
      }

      // Step 2: Insert complete user data including business info
      await client.from('profiles').insert({
        'id': createdUser.id,
        'first_name': firstName,
        'last_name': lastName,
        'birthdate': birthDate,
        'phone_number': phoneNumber,
        'email': email,
        'business_name': businessName,
        'launch_date': launchDate.toIso8601String(),
        'actual_balance': actualBalance,
        'type_of_selling': typeOfSelling,
        'logo': logoUrl,
        
      });
      

      return {
        'success': true,
        'user': createdUser,
      };

    } on AuthException catch (e) {
      // If auth fails, return the error
      return {
        'success': false,
        'message': e.message,
      };
    } on PostgrestException catch (e) {
      // If database insertion fails, clean up the auth user
      if (createdUser != null) {
        try {
          await client.auth.admin.deleteUser(createdUser.id);
        } catch (_) {
          // Silently handle cleanup failure
        }
      }
      
      return {
        'success': false,
        'message': 'Database error: ${e.message}',
      };
    } catch (e) {
      // For any other error, clean up and return error message
      if (createdUser != null) {
        try {
          await client.auth.admin.deleteUser(createdUser.id);
        } catch (_) {
          // Silently handle cleanup failure
        }
      }

      return {
        'success': false,
        'message': 'Unexpected error: $e',
      };
    }
  }

  // Optional: Add method to validate email format
  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
=======
class AuthService {
  static String? _email;
  static String? _password;


  static void setEmail(String email) {
    _email = email;
  }

  static void setPassword(String password) {
    _password = password;
  }

  static bool validateLogin(String email, String password) {
    return email =='nada.zanoun@ensia.edu.dz' && password == 'nadazanoun';
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
  }
}
