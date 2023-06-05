import 'package:flutter/material.dart';
import 'package:umay_deneme/bilgi_al_sayfasi.dart';
import 'package:umay_deneme/sabitler.dart';
import 'package:umay_deneme/welcome_sayfasi.dart';

class KayitOlSayfasi extends StatelessWidget {
  const KayitOlSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: temaAcik,
      body: SafeArea(
        child: SingleChildScrollView(
          //SingleChildScrollView verme sebebım klavyeden bır sey gırerken ekranda tasma sorunu olmasın dıye
          //bır de alttakı textfıeldlara scroll yaparak gecebıleyım dıye
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    //ClipRRect resme radius vermemı sagladı
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(10000, 1500),
                      //elliptical daha yumusak gecıs yapmamı sagladı deneyerek gordum
                    ),
                    child: Image.asset('assets/images/arkaplan.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0),
                    child: Container(
                      width: 100,
                      child: Image.asset('assets/images/adam.png'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    buildInputMetod(hint: 'Ad', sifreMi: false),
                    buildInputMetod(hint: 'Soyad', sifreMi: false),
                    buildInputMetod(hint: 'Mail', sifreMi: false),
                    buildInputMetod(hint: 'Şifre', sifreMi: true),
                    SizedBox(height: 10),
                    buildButton(
                      text: 'Kayıt Ol ',
                      renk: Color(0xff023240),
                      yaziRenk: Colors.white,
                      widgetSayfasi: BilgiAlSayfasi(),
                      context: context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildInputMetod({required String hint, required bool sifreMi}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 50,
      child: TextField(
        obscureText: sifreMi,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
