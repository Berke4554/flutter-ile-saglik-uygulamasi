import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umay_deneme/sabitler.dart';

//?????????????sayfalar arası verı aktarımını ozellıkle oncekı sayfada tıklanan carda gore bılgı aktarımını nasıl yapabılırız
//Widget widgetsayfasi yerine bunu bir fonksiyon olarak tanımlamamız gerek sanırım su anlık boyle dusunuyorum sonra tekrardan dusun bunu berrak bır zıhınle

class KahvaltiSayfasi extends StatefulWidget {
  const KahvaltiSayfasi({Key? key}) : super(key: key);

  @override
  State<KahvaltiSayfasi> createState() => _KahvaltiSayfasiState();
}

class _KahvaltiSayfasiState extends State<KahvaltiSayfasi> {
  bool seciliMi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        backgroundColor: temaAcik,
        title: Text(
          'Diyet',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: temaAcik,
        height: 55,
        items: items,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/kahvalti.jpg',
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ogunAdi',
                          style: GoogleFonts.roboto(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 5),

                        Text(
                          'Alıncak Max Cal: \$kalori',
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 12),
                        //checkbox
                        Checkbox(
                          //????? her checkboxa ayri ayri basılma ozellıgı nasıl verebılırım
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: seciliMi,
                          onChanged: (bool? value) {
                            setState(() {
                              seciliMi = value!;
                              //bazı nullsafety olayları
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            //arama çubuğu
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Arama yapın',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Önerilen
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Önerilen ',
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                BesinCard(),
                BesinCard(),
                BesinCard(),
              ],
            ),
            SizedBox(height: 20),
            //Tüketilen
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tüketilen ',
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                BesinCard(),
                BesinCard(),
                BesinCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BesinCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent.shade100,
                ),
                child: Image.asset(
                  'assets/images/egg.png',
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yumurta',
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.flash_on,
                        color: Colors.deepOrangeAccent,
                      ),
                      Text(
                        '1225 kcal',
                        style: GoogleFonts.roboto(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Adet 1',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Önerilen Adet 3',
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              SizedBox(width: 5),
              //artı eksi butonları
              Column(
                children: [
                  Icon(Icons.add),
                  Icon(Icons.remove),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
