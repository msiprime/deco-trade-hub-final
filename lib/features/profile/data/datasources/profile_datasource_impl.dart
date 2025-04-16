import 'package:deco_trade_hub/features/profile/data/datasources/profile_datasource.dart';
import 'package:deco_trade_hub/features/profile/data/models/profile_model.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  final _restClient = manualSl.get<RestClient>();

  @override
  Future<ProfileModel> fetchProfile() async {
    try {
      final response = await _restClient.get(
        'profiles',
        queryParams: {
          'id': 'eq.${supabaseClient.auth.currentUser?.id}',
        },
      );
      logE('Get response: $response');

      final listOfResponse = response.data as List<dynamic>;
      return ProfileModel.fromJson(
          listOfResponse.first as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch profile exception: $e');
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
