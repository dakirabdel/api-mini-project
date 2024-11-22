import 'package:flutter/material.dart';
import 'package:projectect1/View/screens/home/products.dart';
import 'package:projectect1/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../widgets/custom_form_button.dart';
import '../auth/sign_up_screen.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          //! Profile Picture
          CircleAvatar(
            radius: 80,
            child: Image.asset("assets/images/avatar.png"),
          ),
          const SizedBox(height: 16),

          //! Name
          ListTile(
            title: Text(authProvider.response['name']),
            leading: const Icon(Icons.person),
          ),
          const SizedBox(height: 16),

          //! Email
          ListTile(
            title: Text(authProvider.response['email']),
            leading: Icon(Icons.email),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 0),
            child:  Consumer<ProductProvider>(
              builder: (contex,productProvider,child){
                return CustomFormButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(),
                      ),
                    )
                  },
                  innerText: 'Products',
                );
              },

            ),
          ),

          const SizedBox(height: 100),
          // GestureDetector(
          //   onTap: authProvider.logout,
          //   child: Padding(padding: EdgeInsets.all(20), child:
          //     Text('data'),),
          // ),
          GestureDetector(
            onTap: () => {
              authProvider.logout()
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'LogOut',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),


          //! Phone number
          // const ListTile(
          //   title: Text("+212682749086"),
          //   leading: Icon(Icons.phone),
          // ),
          // const SizedBox(height: 16),
          //
          // //! Address
          // const ListTile(
          //   title: Text("Address"),
          //   leading: Icon(Icons.location_city),
          // ),
          SizedBox(
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [


          const SizedBox(height: 16),




              ],
            ),
          ),
        ],
      ),
    );
  }
}


