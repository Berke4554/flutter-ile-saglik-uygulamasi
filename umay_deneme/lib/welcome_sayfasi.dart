import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umay_deneme/kayit_ol.dart';
import 'package:umay_deneme/sabitler.dart';

import 'bilgi_al_sayfasi.dart';

class WelcomeSayfasi extends StatelessWidget {
  const WelcomeSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 50,
          items: items,
        ),*/
      backgroundColor: temaAcik,
      body: SafeArea(
        child: SingleChildScrollView(
          //SingleChildScrollView verme sebebım klavyeden bır sey gırerken ekranda tasma sorunu olmasın dıye
          //bır de alttakı textfıeldlara scroll yaparak gecebıleyım dıye
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UMAY',
                      style: GoogleFonts.roboto(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Sağlığın senin elinde',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomLeft,
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
              SizedBox(height: 35),
              //Giriş Yap
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: buildButton(
                  renk: Color(0xff023240),
                  text: 'Giriş Yap',
                  yaziRenk: Colors.white,
                  widgetSayfasi: BilgiAlSayfasi(),
                  context: context,
                ),
              ),
              SizedBox(height: 45),
              //Kayıt Ol
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: buildButton(
                  text: 'Kayıt Ol',
                  renk: Colors.white,
                  yaziRenk: Colors.black,
                  widgetSayfasi: KayitOlSayfasi(),
                  context: context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ElevatedButton buildButton({
  required String text,
  required Color renk,
  required Color yaziRenk,
  required Widget widgetSayfasi,
  context,
}) {
  return ElevatedButton(
    onPressed: () {
      // Butona tıklandığında yapılacak işlemler
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widgetSayfasi,
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 5),
      backgroundColor: renk,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 38,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: yaziRenk,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
