import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import '../services/state_services.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  StateServices stateServices = StateServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search with countries",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FutureBuilder(
              future: stateServices.fetchAllCountryList(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade800,
                        highlightColor: Colors.grey.shade100,
                        child: ListTile(
                          title: Container(
                            height: 10,
                            width: 90,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            height: 10,
                            width: 90,
                            color: Colors.white,
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];


                      if(searchController.text.isEmpty){
                        return ListTile(
                          onTap: () {},
                          title:
                          Text(snapshot.data![index]['country'].toString()),
                          subtitle:
                          Text(snapshot.data![index]['cases'].toString()),
                          subtitleTextStyle:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                          leading: Image.network(
                              snapshot.data![index]['countryInfo']['flag'],
                              height: 50,
                              width: 50),
                        );
                      }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                        return ListTile(
                          onTap: () {},
                          title:
                          Text(snapshot.data![index]['country'].toString()),
                          subtitle:
                          Text(snapshot.data![index]['cases'].toString()),
                          subtitleTextStyle:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                          leading: Image.network(
                              snapshot.data![index]['countryInfo']['flag'],
                              height: 50,
                              width: 50),
                        );
                      }else{
                        return Container();
                      }


                      return ListTile(
                        onTap: () {},
                        title:
                            Text(snapshot.data![index]['country'].toString()),
                        subtitle:
                            Text(snapshot.data![index]['cases'].toString()),
                        subtitleTextStyle:
                            const TextStyle(fontSize: 12.0, color: Colors.grey),
                        leading: Image.network(
                            snapshot.data![index]['countryInfo']['flag'],
                            height: 50,
                            width: 50),
                      );
                    },
                  );
                }
              },
            ),
          )),
        ],
      ),
    );
  }
}
