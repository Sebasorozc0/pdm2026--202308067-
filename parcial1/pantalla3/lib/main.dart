import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kFondo = Color(0xFFFFFFFF);
const kSuperficie = Color(0xFFF5F6F4);
const kBorde = Color(0xFFE7E9E3);
const kTexto = Color(0xFF16190F);
const kMuted = Color(0xFF8A8F82);
const kAccent = Color(0xFFCFEB6E);
const kNegro = Color(0xFF14150F);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kAccent,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            children: [
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kTexto,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(child: avatarConEdicion()),
              const SizedBox(height: 28),
              seccionTarjeta(
                titulo: 'Personal info',
                accion: 'Edit',
                children: [
                  filaInfo(
                    icon: Icons.person_outline,
                    label: 'Name',
                    valor: 'Sebastián André Orozco Orozco',
                  ),
                  filaInfo(
                    icon: Icons.mail_outline,
                    label: 'E-mail',
                    valor: 'sebas.orozco@miumg.edu.gt',
                  ),
                  filaInfo(
                    icon: Icons.call_outlined,
                    label: 'Phone number',
                    valor: '+502 5555-0123',
                  ),
                  filaInfo(
                    icon: Icons.home_outlined,
                    label: 'Home address',
                    valor: 'Quetzaltenango, Guatemala',
                    esUltima: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              seccionTarjeta(
                titulo: 'Account info',
                children: [
                  filaInfo(
                    icon: Icons.credit_card_outlined,
                    label: 'Account number',
                    valor: '**** 067',
                  ),
                  filaInfo(
                    icon: Icons.verified_outlined,
                    label: 'Account type',
                    valor: 'Premium',
                  ),
                  filaInfo(
                    icon: Icons.calendar_today_outlined,
                    label: 'Member since',
                    valor: 'March 2023',
                    esUltima: true,
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        bottomNavigationBar: barraNavegacion(),
      ),
    );
  }
}

Widget avatarConEdicion() {
  return SizedBox(
    width: 96,
    height: 96,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSuperficie,
            border: Border.all(color: kBorde),
          ),
          child: const Icon(Icons.person, size: 52, color: kMuted),
        ),
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kNegro,
            ),
            child: const Icon(Icons.edit, size: 14, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget seccionTarjeta({
  required String titulo,
  String? accion,
  required List<Widget> children,
}) {
  return Container(
    decoration: BoxDecoration(
      color: kFondo,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: kBorde),
    ),
    padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: kTexto,
              ),
            ),
            if (accion != null)
              Text(
                accion,
                style: const TextStyle(fontSize: 13, color: kMuted),
              ),
          ],
        ),
        const SizedBox(height: 6),
        ...children,
      ],
    ),
  );
}

Widget filaInfo({
  required IconData icon,
  required String label,
  required String valor,
  bool esUltima = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      border: esUltima
          ? null
          : const Border(bottom: BorderSide(color: kBorde, width: 1)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kSuperficie,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 17, color: kTexto),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: kMuted)),
              const SizedBox(height: 2),
              Text(
                valor,
                style: const TextStyle(fontSize: 13.5, color: kTexto),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget barraNavegacion() {
  return BottomNavigationBar(
    currentIndex: 4,
    type: BottomNavigationBarType.fixed,
    backgroundColor: kFondo,
    selectedItemColor: kNegro,
    unselectedItemColor: kMuted,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.swap_horiz_outlined),
        label: 'Transfer',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: kAccent,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 18, color: kNegro),
        ),
        label: 'Profile',
      ),
    ],
  );
}