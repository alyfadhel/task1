import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task1/compentents/my_form_field/my_form_field.dart';
import 'package:task1/compentents/my_material-button/my_material-button.dart';
import 'package:task1/login/login_screen.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 120.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/free-vector/mixed-colors-background-childish-style_52683-25938.jpg?t=st=1656411698~exp=1656412298~hmac=9f07d66a1e33ee91aa9e58da37035dc72e84c56e9072a01ed6063a683d3f5e4c&w=740',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Fashion Daily',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey, fontSize: 14.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Help',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Icon(
                    Icons.help,
                    size: 16.0,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
          MyTextFormField(
            controller: emailController,
            type: TextInputType.emailAddress,
            validator: (value) {
              'Email must not be Empty';
            },
            radius: 10.0,
            label: 'Email',
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyTextFormField(
                      controller: countryController,
                      type: TextInputType.phone,
                      validator: (value) {
                        'Number must not be Empty';
                      },
                      radius: 10.0,
                      prefix: CountryCodePicker(
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IT',
                        favorite: ['+39', 'FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              MyTextFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                validator: (value) {
                  'Password must not be Empty';
                },
                radius: 10.0,
                label: 'password',
                suffix: const Icon(
                    Icons.visibility,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              MyButton(
                onPressed: () {},
                text: 'Register',
                background: Colors.blue,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Or',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration:
                                    BoxDecoration(color: Colors.blue),
                                    child: Image.asset(
                                      height: 50.0,
                                      'assets/images/google.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Sign with by Google',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'Has any account ?',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Text(
                          'Sign in here',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
  }
}
