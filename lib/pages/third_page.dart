import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/music_Data_Model.dart';
import 'dart:convert';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  Future<List<MusicDataModel>> ReadJsonData() async {
    //import service as rootbundle
    final jsonData = await rootBundle.loadString('assets/Music_json.json');
    final raw = json.decode(jsonData) as List<dynamic>;
    print(raw.map((data) => MusicDataModel.formJson(data)).toList());
    return raw.map((data) => MusicDataModel.formJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width - 4;
    var scard = screen_width - 230;
    var tcard = screen_width - scard - 35;
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Container(
              child: Row(
                children: <Widget>[
                  Center(
                    child: Text(
                        "There is some problem in reading data \n please try to resolve it !!!"),
                  ),
                  Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
                ],
              ),
            );
          } else if (data.hasData) {
            var items = data.data as List<MusicDataModel>;

            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 5,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: scard,
                            child: Card(
                              elevation: 5,
                              child: Container(
                                child: Image(
                                    image: NetworkImage(
                                      items[index].ThumbURL.toString(),
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].Artist.toString().length > 14
                                    ? items[index]
                                        .Artist
                                        .toString()
                                        .substring(0, 14)
                                    : items[index].Artist.toString(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                items[index].Title.toString().length > 14
                                    ? items[index]
                                        .Title
                                        .toString()
                                        .substring(0, 17)
                                    : items[index].Title.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                items[index].FolgeNo.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(172, 93, 97, 92),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
