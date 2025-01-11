import 'package:flutter_template_by_msi/features/profile/data/datasources/profile_datasource.dart';
import 'package:flutter_template_by_msi/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  ProfileDataSourceImpl({
    required this.supabaseClient,
  });

  final SupabaseClient supabaseClient;

  @override
  Future<ProfileModel> fetchProfile() async {
    final currentUser = supabaseClient.auth.currentUser;

    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }

    // // final fcmToken = await CacheService.instance.retrieveFcmToken();
    // try {
    //   await supabaseClient
    //       .from('profiles')
    //       .update({'fcm_token': ''})
    //       .eq('id', currentUser.id)
    //       .single();
    // } catch (e) {
    //   throw Exception('Failed to update fcm token: $e');
    // }

    try {
      final response = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', currentUser.id)
          .single();

      if (response.isEmpty) {
        throw Exception('Failed to fetch profile: $response');
      }

      return ProfileModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    required String fullName,
    required String userName,
    required String email,
    required String mobileNumber,
    required String website,
    required String avatarUrl,
  }) async {
    try {
      final currentUser = supabaseClient.auth.currentUser;

      if (currentUser == null) {
        throw Exception('User is not authenticated');
      }

      final response = await supabaseClient
          .from('profiles')
          .update({
            'full_name': fullName,
            'username': userName,
            'email': email,
            'phone_number': mobileNumber,
            'website': website,
            'avatar_url': avatarUrl,
          })
          .eq('id', currentUser.id)
          .select();

      if (response.isEmpty) {
        throw Exception('Failed to update profile: $response');
      }
      return ProfileModel.fromJson(response.first);
    } on PostgrestException catch (e) {
      throw Exception(
        'Failed to update profile on Postgrest oh god! : ${e.message}',
      );
    }
  }

  @override
  Future<ProfileModel> fetchProfileById({
    required String profileId,
  }) async {
    try {
      final response = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', profileId)
          .single();

      if (response.isEmpty) {
        throw Exception('Failed to fetch profile: $response');
      }

      return ProfileModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch profile: $e');
    }
  }
}
