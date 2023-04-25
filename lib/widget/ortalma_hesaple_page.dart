import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';
import '../model/ders.dart';
import 'ders_listesi.dart';
import 'harf_dropdown_widget.dart';
import 'kredi_dropdown_widget.dart';
import 'ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortamlamaHesapla()),
              ),
            ]),
            Expanded(
              child: DersListesi(
                onElemeanCikarildi: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: Sabitler.yatayPadding8,
              child: _buildTextFormField(),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: Sabitler.yatayPadding8,
                    child: HarfDropDownWidget(onHarfSecildi: (harf) {secilenHarfDegeri=harf;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Sabitler.yatayPadding8,
                    child: KrediDropdownWidget(onKrediSecildi: (kredi) {secilenKrediDegeri = kredi;
                    }),
                  ),
                ),
                IconButton(
                  onPressed: _dersEkleveOrtalamaHesapla,
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: Sabitler.anaRenk,
                  iconSize: 30,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (girilenDersAdi) {
        if (girilenDersAdi!.length <= 0) {
          return "Ders adını giriniz";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
