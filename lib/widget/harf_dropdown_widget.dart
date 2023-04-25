import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
