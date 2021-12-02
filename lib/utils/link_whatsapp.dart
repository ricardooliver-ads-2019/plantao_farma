import 'package:url_launcher/url_launcher.dart';

linkWhatsapp(String phon)async{
 var phone = phon.replaceAll(' ', '').replaceAll('(','').replaceAll(')','');
 await launch('https://wa.me/+55$phone?text=');
}

linkMaps(String url)async{
 await launch(
   url,
   forceWebView: true,
   enableJavaScript: true,
  );
}