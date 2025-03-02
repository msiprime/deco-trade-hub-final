import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/validators/form_validator.dart';
import '../../shared/bloc/store_form/store_form_bloc.dart';

class StoreSignUpForm extends StatelessWidget {
  const StoreSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreFormBloc(),
      child: StoreSignUpFormView(),
    );
  }
}

class StoreSignUpFormView extends StatefulWidget {
  @override
  _StoreSignUpFormViewState createState() => _StoreSignUpFormViewState();
}

class _StoreSignUpFormViewState extends State<StoreSignUpFormView> {
  late final GlobalKey<FormState> _formKey;
  late final StoreFormBloc _bloc;

  String _storeType = 'Wholesaler';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wholesaler Store Sign-Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Store Name
                Text('Store Name'),
                AppTextField.roundedBorder(
                  hintText: 'Enter your store name',
                  onChanged: (value) => _bloc.add(StoreNameChanged(value)),
                  validator: (value) => Validator.notEmpty(value, 'store name'),
                ),

                /// Owner Name
                Text('Owner Name'),
                AppTextField.roundedBorder(
                  hintText: 'Enter your name',
                  onChanged: (value) => _bloc.add(OwnerNameChanged(value)),
                  validator: (value) => Validator.notEmpty(value, 'name'),
                ),

                /// Contact Number
                Text('Contact Number'),
                AppTextField.roundedBorder(
                  hintText: 'Enter store contact number',
                  textInputType: TextInputType.phone,
                  onChanged: (value) => _bloc.add(ContactNumChanged(value)),
                  validator: (value) => Validator.validatePhoneNumber(value),
                ),

                /// Email
                Text('Email'),
                AppTextField.roundedBorder(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmail(value),
                ),

                /// Description
                Text('Description'),
                AppTextField.roundedBorder(
                  maxLines: 3,
                  hintText: 'Enter a brief description of your store',
                  onChanged: (value) => _bloc.add(StoreDescChanged(value)),
                ),

                Text('Store Type'),
                AppTextField.roundedBorder(
                  readOnly: true,
                  hintText: _storeType,
                  onChanged: (value) => _bloc.add(StoreTypeChanged(_storeType)),
                ),

                /// Address Line 1
                Text('Address Line 1'),
                AppTextField.roundedBorder(
                  hintText: 'Enter your address',
                  onChanged: (value) => _bloc.add(AddressLine1Changed(value)),
                  validator: (e) => Validator.notEmpty(e, 'address'),
                ),

                /// Address Line 2
                Text('Address Line 2'),
                AppTextField.roundedBorder(
                  hintText: 'Enter your address(optional)',
                  onChanged: (value) => _bloc.add(AddressLine2Changed(value)),
                ),

                /// Postal Code
                Text('Postal Code'),
                AppTextField.roundedBorder(
                  textInputType: TextInputType.number,
                  onChanged: (value) => _bloc.add(PostalCodeChanged(value)),
                  validator: (value) =>
                      Validator.notEmpty(value, 'postal code'),
                ),

                /// Social Media Links
                Text('Social Media Links'),
                AppTextField.roundedBorder(
                  onChanged: (value) => _bloc.add(StoreDescChanged(value)),
                  textInputType: TextInputType.url,
                ),

                /// Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _bloc.add(StoreFormSubmitted());
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _bloc = context.read<StoreFormBloc>();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _bloc.close();
    super.dispose();
  }
}
