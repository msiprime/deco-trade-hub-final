import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

part 'store_form_event.dart';
part 'store_form_state.dart';

class StoreFormBloc extends Bloc<StoreFormEvent, StoreSignUpState> {
  StoreFormBloc() : super(StoreSignUpState.initial()) {
    on<StoreFormEvent>((event, emit) {});

    on<StoreNameChanged>(_onStoreNameChanged);
    on<OwnerNameChanged>(_onOwnerNameChanged);
    on<ContactNumChanged>(_onContactNumberChanged);
    on<EmailChanged>(_onEmailChanged);
    on<AddressLine1Changed>(_onAddressLine1Changed);
    on<PostalCodeChanged>(_onPostalCodeChanged);
    on<StoreTypeChanged>(_onStoreTypeChanged);
    on<StoreDescChanged>(_onStoreDescriptionChanged);
    on<StoreFormSubmitted>(_onStoreSignUpSubmitted);
    on<StoreFormReset>(_onStoreSignUpReset);
  }

  FutureOr<void> _onStoreNameChanged(StoreNameChanged event, emit) {
    state.copyWith(
      storeName: event.storeName,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onOwnerNameChanged(OwnerNameChanged event, emit) {
    state.copyWith(
      storeName: event.ownerName,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onContactNumberChanged(ContactNumChanged event, emit) {
    state.copyWith(
      storeName: event.contactNumber,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onEmailChanged(EmailChanged event, emit) {
    state.copyWith(
      storeName: event.email,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onAddressLine1Changed(AddressLine1Changed event, emit) {
    state.copyWith(
      storeName: event.addressLine1,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onPostalCodeChanged(PostalCodeChanged event, emit) {
    state.copyWith(
      storeName: event.postalCode,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onStoreTypeChanged(StoreTypeChanged event, emit) {
    state.copyWith(
      storeName: event.storeType,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onStoreDescriptionChanged(StoreDescChanged event, emit) {
    state.copyWith(
      storeName: event.storeDescription,
      status: StoreFormStatus.initial,
    );
  }

  FutureOr<void> _onStoreSignUpSubmitted(StoreFormSubmitted event, emit) {
    logE(state.addressLine1);
    state.copyWith(
      status: StoreFormStatus.submitting,
    );


  }

  FutureOr<void> _onStoreSignUpReset(StoreFormReset event, emit) {
    state.copyWith(
      status: StoreFormStatus.initial,
      storeName: '',
      ownerName: '',
      contactNumber: '',
      email: '',
      addressLine1: '',
      postalCode: '',
      storeType: 'Wholesaler',
      storeDescription: '',
      storeLogoUrl: '',
      addressLine2: '',
      socialMediaLinks: {},
      websiteUrl: '',
      storeBannerUrl: '',
      isVerified: false,
      featuredProductId: '',
    );
  }
}
