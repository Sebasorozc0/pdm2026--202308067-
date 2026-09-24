import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MarcadorSimple(), debugShowCheckedModeBanner: false));

class MarcadorSimple extends StatefulWidget {
  const MarcadorSimple({super.key});
  @override
  State<MarcadorSimple> createState() => _MarcadorSimpleState();
}

class _MarcadorSimpleState extends State<MarcadorSimple> {
  int puntosA = 0;
  int puntosB = 0;

 
  void sumarA() => setState(() => puntosA++);
  void restarA() => setState(() { if (puntosA > 0) puntosA--; });
  
  void sumarB() => setState(() => puntosB++);
  void restarB() => setState(() { if (puntosB > 0) puntosB--; });
  
 
  void reiniciar() => setState(() { puntosA = 0; puntosB = 0; });

  @override
  Widget build(BuildContext context) {
    
    String mensaje = "Empate";
    Color colorA = Colors.black; 
    Color colorB = Colors.black;

    if (puntosA > puntosB) {
      mensaje = "Va ganando Real Madrid";
      colorA = Colors.green; 
    } else if (puntosB > puntosA) {
      mensaje = "Va ganando Barcelona";
      colorB = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Marcador Deportivo")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(mensaje, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Column(
                children: [
                  Text("Real Madrid ", style: TextStyle(fontSize: 20, color: colorA)),
                  Text("$puntosA", style: TextStyle(fontSize: 60, color: colorA)),
                  Row(
                    children: [
                      ElevatedButton(onPressed: restarA, child: const Text("-1")),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: sumarA, child: const Text("+1")),
                    ],
                  )
                ],
              ),
              
              Column(
                children: [
                  Text("Barcelona", style: TextStyle(fontSize: 20, color: colorB)),
                  Text("$puntosB", style: TextStyle(fontSize: 60, color: colorB)),
                  Row(
                    children: [
                      ElevatedButton(onPressed: restarB, child: const Text("-1")),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: sumarB, child: const Text("+1")),
                    ],
                  )
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 50),
          
          
          ElevatedButton(
            onPressed: reiniciar, 
            child: const Text("Reiniciar", style: TextStyle(fontSize: 50))
          ),
        ],
      ),
    );
  }
}