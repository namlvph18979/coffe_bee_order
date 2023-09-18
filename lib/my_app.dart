import 'package:coffe_bee_order/data/local_bloc/navbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/screen/views/account/sc_account.dart';
import 'package:coffe_bee_order/screen/views/add_order/sc_create_order.dart';
import 'package:coffe_bee_order/screen/views/form_auth/sign_in/sc_sign_in.dart';
import 'package:coffe_bee_order/screen/views/home/sc_home.dart';
import 'package:coffe_bee_order/screen/views/sc_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/style_app/color_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (create: (context) => NavBloc()),
        BlocProvider (create: (context) => ListInvoiceBloc()..getListTT01()),
        BlocProvider (create: (context) => ListInvoiceBloc()..getListTT012()),
        BlocProvider (create: (context) => ListInvoiceBloc()..getListDone()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        theme: ThemeData(scaffoldBackgroundColor: ColorApp.bg),
        home: SplashScreen()
      ),
    );
  }
}
