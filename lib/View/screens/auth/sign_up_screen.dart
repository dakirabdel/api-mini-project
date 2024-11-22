import 'package:flutter/material.dart';
import 'package:projectect1/View/screens/auth/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../../Model/models/user_model.dart';
import '../../../providers/auth_provider.dart';
import '../../widgets/already_have_an_account_widget.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/page_heading.dart';
import '../../widgets/pick_image_widget.dart';




class SignUpScreen extends StatelessWidget {


   SignUpScreen({Key? key}) : super(key: key);
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);


    return SafeArea(


      child: Scaffold(
        appBar: AppBar(

        ),
        // backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            // key: context.read<UserCubit>().signUpFormKey,
            child: Column(
              children: [
                if (authProvider.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      authProvider.error!,
                      style: TextStyle(color: Colors.red ,
                          fontSize: 18
                      ),
                    ),
                  ),
                const PageHeading(title: 'Sign-up'),
                //! Image
                // const PickImageWidget(),
                const SizedBox(height: 16),
                //! Name
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'Your name',
                  controller: _nameController,

                  isDense: true,
                  // controller: context.read<UserCubit>().signUpName,
                ),
                const SizedBox(height: 16),
                //!Email
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email',
                  controller: _emailController,
                  isDense: true,
                  // controller: context.read<UserCubit>().signUpEmail,
                ),
                const SizedBox(height: 16),
                //! Phone Number
                // CustomInputField(
                //   labelText: 'Phone number',
                //   hintText: 'Your phone number ex:01234567890',
                //   controller: _nameController,
                //   isDense: true,
                //   // controller: context.read<UserCubit>().signUpPhoneNumber,
                // ),
                const SizedBox(height: 16),
                //! Password
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Your password',
                  controller: _passwordController,
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                  // controller: context.read<UserCubit>().signUpPassword,
                ),
                //! Confirm Password
                // CustomInputField(
                //   labelText: 'Confirm Password',
                //   hintText: 'Confirm Your password',
                //   isDense: true,
                //   obscureText: true,
                //   suffixIcon: true,
                //   // controller: context.read<UserCubit>().confirmPassword,
                // ),
                const SizedBox(height: 22),
                //!Sign Up Button
                authProvider.isLoading ? CircularProgressIndicator() :
                CustomFormButton(
                  innerText: 'Signup',
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final name = _nameController.text;
                    await authProvider.register(name, email, password);
                    if(authProvider.isAuthenticated){
                      Navigator.pop(context);
                      // Navigator.pop(context);

                    }
                  },
                ),
                const SizedBox(height: 18),
                //! Already have an account widget
                const AlreadyHaveAnAccountWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
