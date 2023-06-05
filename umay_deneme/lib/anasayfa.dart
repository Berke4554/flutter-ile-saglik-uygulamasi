import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umay_deneme/sabitler.dart';
import 'package:umay_deneme/spor_sayfasi.dart';

import 'kahvalti.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  //late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //default gelen ıkonu kaldırır
        elevation: 0,
        //elevation appbarın altında default gelen golgeyı kaldırır
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
          children: [
            buildOgunCard(
              ogunAdi: 'Kahvaltı',
              kalori: 150,
              foto: 'kahvalti',
              WidgetSayfasi: KahvaltiSayfasi(),
              context: context,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            buildOgunCard(
              ogunAdi: 'Ara Öğün',
              kalori: 150,
              foto: 'araogun',
              WidgetSayfasi: SporSayfasi(),
              context: context,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            buildOgunCard(
              ogunAdi: 'Öğle',
              kalori: 150,
              foto: 'lunch',
              WidgetSayfasi: KahvaltiSayfasi(),
              context: context,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            buildOgunCard(
              ogunAdi: 'Ara Öğün',
              kalori: 150,
              foto: 'araogun2',
              WidgetSayfasi: KahvaltiSayfasi(),
              context: context,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            buildOgunCard(
              ogunAdi: 'Akşam',
              kalori: 150,
              foto: 'dinner',
              WidgetSayfasi: KahvaltiSayfasi(),
              context: context,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1,
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

Widget buildOgunCard({
  required String ogunAdi,
  required int kalori,
  required String foto,
  Widget? WidgetSayfasi,
  context,
}) {
  return InkWell(
    //GestureDetectorda olurdu ama marginli kısımı algılamadıgı ıcın Inkwell sectım
    //bir de Inkwell murekkep efektı verıyor
    onTap: () {
      // Butona tıklandığında yapılacak işlemler
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WidgetSayfasi!,
        ),
      );
    },
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.asset(
              'assets/images/$foto.jpg',
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
                  ogunAdi,
                  style: GoogleFonts.roboto(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),

                Text(
                  'Alıncak Max Cal: $kalori',
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                //checkbox
                /* Checkbox(
                    //????? her checkboxa ayri ayri basılma ozellıgı nasıl verebılırım
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        //bazı nullsafety olayları
                      });
                    },
                  ),*/
              ],
            ),
          ),
        )
      ],
    ),
  );
}
