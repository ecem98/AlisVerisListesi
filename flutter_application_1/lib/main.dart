import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping List",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class Urun {
  String urunAdi = "";
  String alinacakYer = "";
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  List<Urun> alisverisListesi = [];
  int _selectedIndex = 0;

  elemanEkle() {
    Urun urun = Urun();
    urun.urunAdi = t1.text;
    urun.alinacakYer = t2.text;
    setState(() {
      alisverisListesi.add(urun);
      t1.clear();
      t2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text(alisverisListesi[siraNumarasi].alinacakYer),
                title: Text(alisverisListesi[siraNumarasi].urunAdi),
                trailing: Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    alisverisListesi.remove(alisverisListesi[siraNumarasi]);
                  });
                },
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: t1,
                          cursorColor: Colors.white,
          decoration: InputDecoration(hintText: 'Ürün adı'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  
         
                  controller: t2,
                  cursorColor: Colors.white,
          decoration: InputDecoration(hintText: 'Alınacak Yer'),
                 
                ),
              ),
              ElevatedButton(
                onPressed: elemanEkle,
                child: Text("Ekle"),
              ),
            ],
          )
        ],
      ),
    );
  }
}