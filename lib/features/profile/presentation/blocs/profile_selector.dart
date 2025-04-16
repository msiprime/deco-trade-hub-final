import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deco_trade_hub/features/profile/domain/entities/profile_entity.dart';
import 'package:deco_trade_hub/features/profile/presentation/blocs/profile_bloc.dart';

class ProfileSelector<T> extends BlocSelector<ProfileBloc, ProfileState, T> {
  ProfileSelector({
    required super.selector,
    required Widget Function(T) builder,
    super.key,
  }) : super(builder: (_, value) => builder(value));
}

class ProfileEntitySelector extends ProfileSelector<ProfileEntity?> {
  ProfileEntitySelector(Widget Function(ProfileEntity?) builder, {super.key})
      : super(
          selector: (state) {
            if (state is ProfileSuccess) {
              return state.profileEntity;
            }
            return null;
          },
          builder: builder,
        );
}
