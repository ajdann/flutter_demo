import 'package:demo_app/example_webview.dart';
import 'package:demo_app/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Uri _url = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});

  void _launchURL() async => await launch(_url.toString());

 
 

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    var _shortestSide = MediaQuery.of(context).size.shortestSide;

   void searchGoogle(src) async => {


    await launch(Uri(
    scheme: 'http',
    path: 'www.google.ba/search',
    queryParameters: {
      'q' : src
    }
  ).toString())
     

  };
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                Icon(Icons.mail, size: 40, color: Colors.grey[700]),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: _launchURL,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('gmail'),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/index.png',
                    height: SizeConfig.blockSizeVertical * 20,
                    width: SizeConfig.blockSizeHorizontal * 20),
                Container(
                    width: SizeConfig.blockSizeHorizontal * 80,
                    height: SizeConfig.blockSizeVertical * 10,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                          suffixIcon: InkWell(
                            child: Icon(Icons.search,
                                size: 40, color: Colors.grey[700]),
                            onTap: () => Navigator.push(
        context, CupertinoPageRoute(builder: (context) => WebViewExample(_textController.text))),
                          )),
                    ))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Text(
                'Done by Ajdin Garibovic',
                style: TextStyle(
                    fontSize: _shortestSide < 600 ? 16 : 22,
                    color: _shortestSide < 600
                        ? Colors.brown[100]
                        : Colors.green[500]),
              ))
        ],
      ),
    ));
  }
}


