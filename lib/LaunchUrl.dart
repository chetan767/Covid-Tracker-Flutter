import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  void launchURL(String _url) async =>
      await launch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
