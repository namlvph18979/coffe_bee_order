import 'package:coffe_bee_order/data/local_bloc/navbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/category/catbloc.dart';
import 'package:coffe_bee_order/data/remote_bloc/invoice/list_invoice_bloc.dart';
import 'package:coffe_bee_order/screen/views/sc_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/style_app/color_app.dart';


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
        BlocProvider (create: (context) => ListInvoiceBloc()..getList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: ColorApp.bg),
        home: const SplashScreen()
      ),
    );
  }
}
