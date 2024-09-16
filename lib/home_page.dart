import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _sizeController = TextEditingController();

  TextEditingController _kiloController = TextEditingController();

  double _sonuc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text(
          "Vücut Kitle Endeksi",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              _sonuc.toStringAsFixed(2),
              style: TextStyle(fontSize: 48),
            ),
            TextField(
              controller: _sizeController,
              decoration: InputDecoration(
                  label: Text("Boyunuz"),
                  suffixText: "m",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _kiloController,
              decoration: InputDecoration(
                  label: Text("Kilonuz"),
                  suffixText: "kg",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _hesapla,
                child: Text(
                  "Hesapla",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }

//Burada hesap için bir işlem yazmadan önce text fieldlar içerisindeki değerleri okumak için controller oluşturmamız gerekir.
  void _hesapla() {
    //Trim yazılan değerin sağındaki ve solundaki değerleri temizler çünkü işlemde herhangi bir hataya sebep vermesin diye
    String sizeText = _sizeController.text.trim();
    String kiloText = _kiloController.text.trim();

    try {
      double size = double.parse(sizeText);
      double kilo = double.parse(kiloText);

      //İşlem Başarılı ise;
      setState(() {
        _sonuc = kilo / (size * size);
      });
    } catch (e) {
      print("Bir hata oluştu: ${e.toString()}");
    }
  }
}
