import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../providers/auth_provider.dart';
import '../../widgets/custom_form_button.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/dont_have_an_account.dart';
import '../../widgets/forget_password_widget.dart';
import '../../widgets/page_header.dart';
import '../../widgets/page_heading.dart';




class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(

      child: Scaffold(

        // backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    // key: context.read<UserCubit>().signInFormKey,
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
                        const PageHeading(title: 'Sign-in'),
                        //!Email
                        CustomInputField(
                          labelText: 'Email',
                          hintText: 'Your email',
                          controller: _emailController,
                          // controller: context.read<UserCubit>().signInEmail,
                        ),
                        const SizedBox(height: 16),
                        //!Password
                        CustomInputField(
                          labelText: 'Password',
                          hintText: 'Your password',
                          controller: _passwordController,
                          obscureText: true,
                          suffixIcon: true,
                          // controller: context.read<UserCubit>().signInPassword,
                        ),
                        const SizedBox(height: 16),
                        //! Forget password?
                        ForgetPasswordWidget(size: size),
                        const SizedBox(height: 20),
                        authProvider.isLoading ? CircularProgressIndicator() :
                        CustomFormButton(
                          innerText: 'Sign In',
                          onPressed: () {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            authProvider.login(email, password);
                          }),

                        //!Sign In Button


                        const SizedBox(height: 18),
                        //! Dont Have An Account ?
                        DontHaveAnAccountWidget(size: size),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
