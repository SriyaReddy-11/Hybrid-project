import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelreservation/Home.dart';
import 'package:hotelreservation/aminities/hotel_list.dart';
import 'package:hotelreservation/cancellation.dart';
import 'package:hotelreservation/hotelDetails.dart';
import 'package:hotelreservation/hotelScreen.dart';
import 'package:hotelreservation/resetPassword.dart';
import 'CreateAccount.dart';
import 'Login.dart';
import 'bookingConfirmation.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp()
  );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // Providing keys for page routing and showing initial path
        initialRoute: '/home',
        routes: {
          '/home': (context) => home(),
          '/login': (context) => Login(),
          '/reset': (context) => resetPassword(),
          '/cancel': (context) => cancellation(),
          '/confirm': (context) => bookingConfirmation(),
          //'/splash' : (context) => Splash(),
          '/screen': (context) => hotelScreen(),
          '/account': (context) => CreateAccount(),

        },

        //generating arguments to use in Hotel Details page to show amenities of hotel
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == '/details') {
            // Cast the arguments to the correct
            // type: ScreenArguments.
            final arg = settings.arguments as HotelList;
            // Then, extract the required data from
            // the arguments and pass the data to the
            // correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return hotelDetails(
                  docId: arg.docId ?? '',
                  name: arg.name ?? '',
                  //status: arg.status ?? ',
                  image: arg.image ?? '',
                  price: arg.price ?? '',
                  a1: arg.a1 ?? '',
                  a2: arg.a2 ?? '',
                  a3: arg.a3 ?? '',
                  a4: arg.a4 ?? '',
                );
              },
            );
          }
        }
    );
  }

}
