import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umay_deneme/sabitler.dart';
import 'package:umay_deneme/welcome_sayfasi.dart';

import 'anasayfa.dart';

class BilgiAlSayfasi extends StatelessWidget {
  const BilgiAlSayfasi({Key? key}) : super(key: key);

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
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/arkaplan.jpg',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        //img'nin verdıgım degerlere gore her yerı kaplamasını sagladım
                        alignment: Alignment.bottomLeft,
                        //img'in neresınden ıtıbaren izalaması gerektıgı
                      ),
                    ),
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
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    buildBilgiAlButon(text: 'Yaş'),
                    buildBilgiAlButon(text: 'Boy'),
                    buildBilgiAlButon(text: 'Kilo'),
                    buildBilgiAlButon(text: 'Cinsiyet'),
                    buildBilgiAlButon(text: 'Alerjen'),
                    buildBilgiAlButon(text: 'Tahlil'),
                    buildBilgiAlButon(text: 'Hedef'),
                    SizedBox(height: 10),
                    buildButton(
                      text: 'Devam Et',
                      renk: Color(0xff023240),
                      yaziRenk: Colors.white,
                      widgetSayfasi: Anasayfa(),
                      context: context,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBilgiAlButon({required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 100,
            child: Text(
              text,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                hintText: '..',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
