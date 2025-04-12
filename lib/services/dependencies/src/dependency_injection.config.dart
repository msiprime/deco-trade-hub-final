// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_template_by_msi/app/screens/home_screen/src/cubit/counter_cubit.dart'
    as _i365;
import 'package:flutter_template_by_msi/blocs/app_meta_data_cubit/app_meta_data_cubit.dart'
    as _i301;
import 'package:flutter_template_by_msi/blocs/localization_cubit/localization_cubit.dart'
    as _i136;
import 'package:flutter_template_by_msi/blocs/theme_cubit/theme_cubit.dart'
    as _i400;
import 'package:flutter_template_by_msi/features/store/presentation/shared/bloc/store_form/store_form_bloc.dart'
    as _i515;
import 'package:flutter_template_by_msi/features/store/repository/store_repository.dart'
    as _i942;
import 'package:flutter_template_by_msi/features/store/repository/store_repository_impl.dart'
    as _i510;
import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart'
    as _i1046;
import 'package:flutter_template_by_msi/services/logger/app_logger.dart'
    as _i763;
import 'package:flutter_template_by_msi/services/logger/error_logger.dart'
    as _i61;
import 'package:flutter_template_by_msi/services/logger/event_logger.dart'
    as _i74;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initInjectable(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i365.CounterCubit>(() => _i365.CounterCubit());
  gh.lazySingleton<_i61.ErrorLogger>(() => const _i61.ErrorLogger());
  gh.lazySingleton<_i763.AppLogger>(() => const _i763.AppLogger());
  gh.lazySingleton<_i74.EventLogger>(() => const _i74.EventLogger());
  gh.lazySingleton<_i400.ThemeCubit>(() => _i400.ThemeCubit());
  gh.lazySingleton<_i136.LocalizationCubit>(() => _i136.LocalizationCubit());
  gh.factory<int>(
    () => registerModule.incrementValue,
    instanceName: 'increment_value',
  );
  gh.lazySingleton<_i942.StoreRepository>(
      () => _i510.StoreRepositoryImpl(gh<_i454.SupabaseClient>()));
  gh.lazySingleton<_i301.AppMetaDataCubit>(() => _i301.AppMetaDataCubit(
        gh<_i763.AppLogger>(),
        gh<_i61.ErrorLogger>(),
      ));
  gh.factory<_i515.StoreFormBloc>(
      () => _i515.StoreFormBloc(gh<_i942.StoreRepository>()));
  return getIt;
}

class _$RegisterModule extends _i1046.RegisterModule {}
