
import 'package:flutter/material.dart';
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const LayoutApp());
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPDM - Layout Widgets',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF2FAF8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009688),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const Color verde = Color(0xFF009688);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FAF8),
      appBar: AppBar(
        backgroundColor: verde,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('PPDM - Dashboard de Observacoes'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final espacamento = constraints.maxWidth < 600 ? 10.0 : 16.0;

          return SingleChildScrollView(
            padding: EdgeInsets.all(espacamento),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 4),
                const Text(
                  'Resumo das Observacoes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),

                // Quatro blocos: dois em cima e dois embaixo.
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: espacamento,
                  mainAxisSpacing: espacamento,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio:
                      constraints.maxWidth < 600 ? 1.3 : 1.8,
                  children: const [
                    BlocoEstatistica(
                      icone: Icons.flutter_dash,
                      valor: '124',
                      legenda: 'Aves Vistas',
                      cor: Color(0xFFB2DFDB),
                    ),
                    BlocoEstatistica(
                      icone: Icons.location_on,
                      valor: '18',
                      legenda: 'Locais Visitados',
                      cor: Color(0xFFE0F2F1),
                    ),
                    BlocoEstatistica(
                      icone: Icons.camera_alt,
                      valor: '45',
                      legenda: 'Fotos',
                      cor: Color(0xFFE0F2F1),
                    ),
                    BlocoEstatistica(
                      icone: Icons.calendar_month,
                      valor: '32',
                      legenda: 'Dias de Campo',
                      cor: Color(0xFFB2DFDB),
                    ),
                  ],
                ),

                const SizedBox(height: 28),
                const Text(
                  'Destaque da Semana',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Card com elevacao 4 e selo sobreposto.
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(2, 4, 2, 12),
                  color: const Color(0xFFEEF5F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 22, 20, 38),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                              size: 52,
                            ),
                            SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gaviao-Real',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Avistado no Parque Central',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Confirmado',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  'Ultimos Registros',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Row com spaceBetween.
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.list,
                        color: verde,
                        size: 26,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Sabia-Laranjeira - hoje',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Exibindo os ultimos registros.'),
                            ),
                          );
                        },
                        child: const Text('Ver todos'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

