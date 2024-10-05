import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'countries/code_countries_en.dart';
import 'countries/code_country.dart';
import 'countries_widget.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';
import 'text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phoneNumber = TextEditingController();

  CountryCode? selectedCountryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CustomButton(
                    height: 54,
                    width: 40,
                    radius: 8,
                    onPressed: () async {
                      final result =
                          await showMaterialModalBottomSheet<CountryCode>(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) => const CountriesWidget());
                      setState(() => selectedCountryCode = result);
                    },
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              selectedCountryCode == null
                                  ? allCountriesList.first.flagUri!
                                  : selectedCountryCode!.flagUri!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        TextWidget(
                            selectedCountryCode == null
                                ? allCountriesList.first.dialCode!
                                : selectedCountryCode!.dialCode!,
                            fontSize: 14,
                            paddingLeft: 4)
                      ],
                    )),
                const SizedBox(width: 2),
                Expanded(
                  flex: 2,
                  child: CustomTextfield(
                    controller: phoneNumber,
                    hintText: 'Phone number',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<CountryCode> allCountriesList = countriesEnglish.map((s) {
  return CountryCode(
    name: s['name'],
    code: s['code'],
    dialCode: s['dial_code'],
    flagUri: '${AppAssets.flags}${s['code'].toLowerCase()}.png',
  );
}).toList();

class AppAssets {
  const AppAssets._();
  static const flags = 'flags/';
}
