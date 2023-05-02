import 'package:bubu_market/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/utils.dart';
import '../person_view_model.dart';
import 'custom_text_input.dart';
import 'dashboard_text.dart';
import 'spacers.dart';

class SelectedWidget extends ConsumerStatefulWidget {
  final int tabIndex;
  const SelectedWidget({
    Key? key,
    required this.tabIndex,
  }) : super(key: key);
  @override
  ConsumerState<SelectedWidget> createState() => _SelectedWidgetState();
}

class _SelectedWidgetState extends ConsumerState<SelectedWidget>
    with SingleTickerProviderStateMixin {
  String? email;
  String? password;
  String? phoneNumber;
  String? name;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController phoneNumberController;
  bool _isLoading = false;
  final bool _validate = false;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  late double _scale;
  late AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 2);

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneNumberController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 00,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    _scale = 1 - _controller.value;
    final tabIndex = ref.watch(currentTab);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (tabIndex == 0) ...[
              const DashBoradTextWidget(),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text:
                      "From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details",
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                  ),
                ),
              ),
            ] else if (tabIndex == 1)
              ...[]
            else if (tabIndex == 2)
              ...[]
            else if (tabIndex == 3) ...[
              updateProfile()
            ] else if (tabIndex == 4) ...[
              CustomTextInput(
                onSaved: (newValue) => email = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kEmailNullError);
                  } else if (emailValidatorRegExp.hasMatch(value)) {
                    removeError(error: kInvalidEmailError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kEmailNullError);
                    return "Please Enter your email";
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    addError(error: kInvalidEmailError);
                    return "Please Enter Valid Email";
                  }
                  return null;
                },
                validate: _validate,
                textInputAction: TextInputAction.next,
                titleText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: Icons.email,
              ),
              Spacers(height: getProportionateScreenHeight(16)),
              CustomTextInput(
                onSaved: (newValue) => password = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.length >= 8) {
                    removeError(error: kShortPassError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return "Please Enter your password";
                  } else if (value.length < 8) {
                    addError(error: kShortPassError);
                    return "Password is too short";
                  }
                  return null;
                },
                enableSuggestions: false,
                validate: _validate,
                textInputAction: TextInputAction.next,
                expands: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                titleText: 'Password',
                controller: passwordController,
                prefixIcon: Icons.lock,
              ),
            ]
          ],
        ),
      ),
    );
  }

  Align updateProfile() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Update Profile",
            style: GoogleFonts.nunito(
                color: Colors.black, fontSize: 21, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage('assets/images/clothes.jpeg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _onTap,
                  onTapUp: _onTapUp,
                  onTapDown: _onTapDown,
                  onTapCancel: _onTapCancel,
                  child: Transform.scale(
                    scale: _scale,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: GlobalVariables.colorPrimary),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacers(height: getProportionateScreenHeight(16)),
          CustomTextInput(
            onSaved: (newValue) => name = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "Please enter your first name";
              }
              return null;
            },
            enableSuggestions: true,
            validate: _validate,
            textInputAction: TextInputAction.next,
            expands: false,
            obscureText: false,
            keyboardType: TextInputType.name,
            titleText: 'First Name',
            controller: firstnameController,
            prefixIcon: Icons.person,
          ),
          Spacers(height: getProportionateScreenHeight(16)),
          CustomTextInput(
            onSaved: (newValue) => name = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "Please enter your last name";
              }
              return null;
            },
            enableSuggestions: true,
            validate: _validate,
            textInputAction: TextInputAction.next,
            expands: false,
            obscureText: false,
            keyboardType: TextInputType.name,
            titleText: 'Last Name',
            controller: lastnameController,
            prefixIcon: Icons.person,
          ),
          Spacers(height: getProportionateScreenHeight(16)),
          CustomTextInput(
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "Please Enter your email";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "Please Enter Valid Email";
              }
              return null;
            },
            validate: _validate,
            textInputAction: TextInputAction.next,
            titleText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            prefixIcon: Icons.email,
          ),
          Spacers(height: getProportionateScreenHeight(16)),
          CustomTextInput(
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "Please Enter your password";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "Password is too short";
              }
              return null;
            },
            enableSuggestions: false,
            validate: _validate,
            textInputAction: TextInputAction.next,
            expands: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            titleText: 'Password',
            controller: passwordController,
            prefixIcon: Icons.lock,
          ),
          Spacers(height: getProportionateScreenHeight(16)),
          CustomTextInput(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                //return "";
                return "Please enter your phone number";
              }
              return null;
            },
            enableSuggestions: true,
            validate: _validate,
            textInputAction: TextInputAction.done,
            expands: false,
            obscureText: false,
            titleText: 'Phone Number',
            controller: phoneNumberController,
            prefixIcon: Icons.phone,
          ),
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    print("onTapUp");
    _controller.reverse();
  }

  void _onTapCancel() {
    print("on tap cancel");
    _controller.reverse();
  }

  void _onTap() {
    print("on tap cancel");
    _controller.forward();
  }
}
