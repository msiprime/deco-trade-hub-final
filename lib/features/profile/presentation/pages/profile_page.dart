import 'package:app_ui/app_ui.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_by_msi/features/profile/data/datasources/profile_datasource_impl.dart';
import 'package:flutter_template_by_msi/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_template_by_msi/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:flutter_template_by_msi/features/profile/presentation/widget/profile_store_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        profileRepository:
            ProfileRepositoryImp(profileDataSource: ProfileDataSourceImpl()),
      ),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const String routeName = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController _fullNameController;
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _websiteController;
  late TextEditingController _avatarUrlController;

  final formKey = GlobalKey<FormState>();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _websiteController = TextEditingController();
    _avatarUrlController = TextEditingController();
    context.read<ProfileBloc>().add(const GetProfileDataEvent());
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _avatarUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProfileBloc>().add(const GetProfileDataEvent());
        },
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              _fullNameController.text = state.profileEntity.fullName;
              _userNameController.text = state.profileEntity.userName;
              _emailController.text = state.profileEntity.email;
              _phoneController.text = state.profileEntity.mobileNumber;
              _websiteController.text = state.profileEntity.website ?? '';
              _avatarUrlController.text = state.profileEntity.avatarUrl ?? '';

              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildHeaderPart(context, state),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: isEditing
                              ? _buildEditableFields(state)
                              : _buildProfileInfo(state),
                        ),
                      ),
                      const ProfileStoreWidget(),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Column _buildHeaderPart(BuildContext context, ProfileSuccess state) {
    return Column(
      children: [
        _buildCustomAvatarDesign(context, state),
        // const Gap(10),
        Text(
          ' ${state.profileEntity.fullName} ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
          child: isEditing ? _buildSaveButton() : _buildEditButton(),
        ),
      ],
    );
  }

  Widget _buildEditButton() => TextButton(
        onPressed: () {
          setState(() {
            isEditing = !isEditing;
          });
        },
        child: const Text('Edit'),
      );

  Widget _buildSaveButton() => TextButton(
        onPressed: () {
          setState(() {
            if (formKey.currentState!.validate()) {
              isEditing = !isEditing;
              context.read<ProfileBloc>().add(
                    UpdateProfileDataEvent(
                      fullName: _fullNameController.text,
                      userName: _userNameController.text,
                      email: _emailController.text,
                      mobileNumber: _phoneController.text,
                      website: _websiteController.text,
                      avatarUrl: _avatarUrlController.text,
                    ),
                  );
              context.read<ProfileBloc>().add(const GetProfileDataEvent());
            }
          });
        },
        child: const Text('Save'),
      );

  Widget _buildCustomAvatarDesign(
    BuildContext context,
    ProfileSuccess state,
  ) {
    return CustomPaint(
      child: Container(
        padding: const EdgeInsets.only(top: 80),
        height: 200,
        color: Colors.transparent,
        child: Align(
          child: isEditing
              ? const Text('Edit Avatar')
              : DottedBorder(
                  radius: const Radius.circular(50),
                  borderType: BorderType.Circle,
                  color: Colors.green,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.round,
                  // borderPadding: const EdgeInsets.all(1),
                  // dashPattern: [6, 3],
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: ImageAttachmentThumbnail(
                        imageUrl: state.profileEntity.avatarUrl ?? '',
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  // Widget _buildUserAvatar(ProfileSuccess state) {
  //   return UserProfileImageUrlGenWidget(
  //     imageUrl: state.profileEntity.avatarUrl,
  //     onImageUploaded: (imageUrl) {
  //       _avatarUrlController.text = imageUrl ?? '';
  //     },
  //   );
  // }

  List<Widget> _buildEditableFields(ProfileSuccess state) {
    return [
      const Text('User Name'),
      // const Gap(10),
      AppTextField.roundedBorder(
        controller: _userNameController,
        // labelText: 'username',
        onChanged: (value) {
          _userNameController.text = value;
        },
      ),
      // const Gap(20),
      const Text('First Name'),
      // const Gap(5),
      AppTextField.roundedBorder(
        controller: _fullNameController,
        hintText: 'John Doe',
        onChanged: (value) {
          _fullNameController.text = value;
        },
      ),
      // const Gap(20),
      const Text('Email'),
      // const Gap(5),
      AppTextField.roundedBorder(
        controller: _emailController,
        hintText: 'someone@something.com',
        onChanged: (value) {
          _emailController.text = value;
        },
        // isLoading: false,
      ),
      // const Gap(20),
      const Text('Phone'),
      // const Gap(5),
      AppTextField.roundedBorder(
        controller: _phoneController,
        hintText: 'e.g 1234567890',
        onChanged: (value) {
          _phoneController.text = value;
        },
      ),
      // const Gap(20),
      const Text('Website'),
      // const Gap(10),
      AppTextField.roundedBorder(
        controller: _websiteController,
        hintText: 'e.g something.com',
        onChanged: (value) {
          _websiteController.text = value;
        },
      ),
      // const Gap(20),
    ];
  }

  List<Widget> _buildProfileInfo(ProfileSuccess state) {
    return [
      _buildProfileInfoItem('username', state.profileEntity.userName),
      _buildProfileInfoItem('Full Name', state.profileEntity.fullName),
      _buildProfileInfoItem('Email', state.profileEntity.email),
      _buildProfileInfoItem('Phone', state.profileEntity.mobileNumber),
      _buildProfileInfoItem(
        'Website',
        state.profileEntity.website ?? 'Not set',
      ),
    ];
  }

  Widget _buildProfileInfoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: context.theme.primaryColorDark,
            ),
          ),
          // const Gap(5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
