import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/centro_educativo_controller.dart';

class CentroEducativoPage extends StatefulWidget {
  const CentroEducativoPage({super.key});

  @override
  createState() => _CentroEducativoPageState();
}

class _CentroEducativoPageState extends State<CentroEducativoPage> {
  final TextEditingController _regionalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Provider.of<CentroEducativoController>(context, listen: false);
    controller.fetchInitialCentros();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CentroEducativoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Centros Educativos'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/listarcentros.jpg'), // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _regionalController,
                  decoration: InputDecoration(
                    labelText: 'Buscar por regional',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.fetchCentros(regional: _regionalController.text);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: controller.loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.centros.length,
                        itemBuilder: (context, index) {
                          final centro = controller.centros[index];
                          return Card(
                            child: ListTile(
                              title: Text(centro.nombre),
                              subtitle: Text(
                                'Código: ${centro.codigo}\nDistrito: ${centro.distrito}\nRegional: ${centro.regional}\nMunicipio: ${centro.dDmunicipal ?? 'No definido'}',
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
