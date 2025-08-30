import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_contries/core/constants/colors.dart';
import 'package:test_contries/core/constants/texts.dart';
import 'package:test_contries/features/home/data/models/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white_Elements_Text,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                generalText,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      lightMode,
                      style: TextStyle(
                        color: dark_Blue_Text,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Icon(CupertinoIcons.moon, color: dark_Blue_Text, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,

                  prefixIcon: Icon(CupertinoIcons.search, size: 18),
                  prefixIconColor: dark_Grey_Input,
                  hintText: searchTextField,
                  hintStyle: TextStyle(color: dark_Grey_Input, fontSize: 16),
                  fillColor: white_Elements_Text,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Country>>(
                future: getCountries(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    padding: EdgeInsets.all(30),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final country = snapshot.data![index];
                      return ListCountries(data: country);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCountries extends StatelessWidget {
  final Country data;
  const ListCountries({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: white_Elements_Text,
        boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4),
              child: Image.network(
                data.flagPng,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  data.officialName,

                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: dark_Blue_Text,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      population,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: dark_Blue_Text,
                      ),
                    ),
                    Text(
                      " ${data.population} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: dark_Blue_Text,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      region,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: dark_Blue_Text,
                      ),
                    ),
                    Text(
                      "  ${data.region} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: dark_Blue_Text,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      capital,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: dark_Blue_Text,
                      ),
                    ),
                    Text(
                      " ${data.capital.join(', ')} ",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: dark_Blue_Text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
