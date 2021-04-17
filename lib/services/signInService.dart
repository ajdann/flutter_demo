import 'package:demo_app/interface/signInInterface.dart';
import 'package:demo_app/utils/variables/loginVariables.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json;
import 'package:demo_app/utils/textVariables/textVariables.dart';

class SignInService implements SignInInterface {
  @override
  Future<void> handleGetContact(GoogleSignInAccount user) async {
    
      contactText = "Loading contact info...";

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    print(response);
    if (response.statusCode != 200) {
        contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = pickFirstNamedContact(data);
      if (namedContact != null) {
        contactText = "I see you know $namedContact!";
      } else {
        contactText = "No contacts to display.";
      }
  }

  @override
  pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  @override
  handleSignIn() async {
    try {
      print('test');
      await googleSignIn.signOut();
      await googleSignIn.signIn();
      print(googleSignIn.currentUser.displayName);
    } catch (error) {
      print(error);
    }
  }

  @override
  handleSignOut() => googleSignIn.disconnect();

  @override
  String pickFirstNamedContac() {
    // TODO: implement pickFirstNamedContac
    throw UnimplementedError();
  }
}
