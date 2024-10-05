import 'package:flutter/material.dart';

import 'countries/code_country.dart';
import 'custom_textfield.dart';
import 'main.dart';
import 'text_widget.dart';

class CountriesWidget extends StatefulWidget {
  const CountriesWidget({super.key});

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  bool isSearching = false;
  final searchController = TextEditingController();

  List<CountryCode> searchedList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Material(
              elevation: 0.8,
              color: const Color(0xfff9fafb),
              child: Row(
                children: [
                  const BackButton(),
                  isSearching
                      ? Expanded(
                          child: CustomTextfield(
                            controller: searchController,
                            borderColor: Colors.transparent,
                            fillColor: const Color(0xfff9fafb),
                            autoFocus: true,
                            onChanged: (value) {
                              setState(() {
                                searchedList = allCountriesList
                                    .where((e) => e.name!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                        )
                      : const TextWidget(
                          'Choose a country',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          paddingLeft: 4,
                        ),
                  const Spacer(),
                  IconButton(
                      onPressed: () =>
                          setState(() => isSearching = !isSearching),
                      icon: Icon(isSearching ? Icons.clear : Icons.search))
                ],
              ),
            ),
          ),
          Expanded(
            child: isSearching
                ? ListView.builder(
                    itemCount: searchedList.length,
                    itemBuilder: (context, i) => ListTile(
                      onTap: () => Navigator.of(context).pop(searchedList[i]),
                      leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                              fit: BoxFit.cover, searchedList[i].flagUri!),
                        ),
                      ),
                      title: TextWidget(
                        "${searchedList[i].name!} (${searchedList[i].dialCode!})",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: allCountriesList.length,
                    itemBuilder: (context, i) => ListTile(
                      onTap: () =>
                          Navigator.of(context).pop(allCountriesList[i]),
                      leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                              fit: BoxFit.cover, allCountriesList[i].flagUri!),
                        ),
                      ),
                      title: TextWidget(
                        "${allCountriesList[i].name!} (${allCountriesList[i].dialCode!})",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
