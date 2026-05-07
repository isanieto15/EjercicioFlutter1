import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatefulWidget {
  const MiApp({super.key});

  @override
  State<MiApp> createState() => _MiAppState();
}

class _MiAppState extends State<MiApp> {
  bool modoOscuro = false;

  void cambiarTema() {
    setState(() {
      modoOscuro = !modoOscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad AppBar',

      themeMode:
          modoOscuro
              ? ThemeMode.dark
              : ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed:
            const Color(0xFF7FE0D6),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed:
            const Color(0xFF7FE0D6),
      ),

      home: PantallaPrincipal(
        modoOscuro: modoOscuro,
        cambiarTema: cambiarTema,
      ),
    );
  }
}

class PantallaPrincipal
    extends StatefulWidget {
  final bool modoOscuro;
  final VoidCallback cambiarTema;

  const PantallaPrincipal({
    super.key,
    required this.modoOscuro,
    required this.cambiarTema,
  });

  @override
  State<PantallaPrincipal> createState() =>
      _PantallaPrincipalState();
}

class _PantallaPrincipalState
    extends State<PantallaPrincipal> {
  double elevacion = 4;

  bool sombraActiva = true;

  Color colorAppBar =
      const Color(0xFF5BCFC3);

  void mostrarSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),

        backgroundColor:
            const Color(0xFF5BCFC3),

        duration:
            const Duration(seconds: 2),
      ),
    );
  }

  void cambiarColorAppBar() {
    setState(() {
      colorAppBar =
          colorAppBar ==
                  const Color(0xFF5BCFC3)
              ? const Color(0xFF8EEAE1)
              : const Color(0xFF5BCFC3);
    });

    mostrarSnackBar(
      "Color del AppBar cambiado",
    );
  }

  void navegar() {
    Navigator.push(
      context,

      MaterialPageRoute(
        builder:
            (context) =>
                const SegundaPantalla(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.modoOscuro
              ? const Color(0xFF152222)
              : const Color(0xFFF4FFFD),

      appBar: AppBar(
        title: const Text(
          "Actividad AppBar",

          style: TextStyle(
            fontSize: 22,
            fontWeight:
                FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        centerTitle: true,

        backgroundColor: colorAppBar,

        foregroundColor: Colors.white,

        elevation:
            sombraActiva
                ? elevacion
                : 0,

        shadowColor: Colors.black,

        scrolledUnderElevation:
            elevacion,

        leading: const Icon(
          Icons.dashboard,
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.color_lens,
            ),

            tooltip:
                "Cambiar color",

            onPressed:
                cambiarColorAppBar,
          ),

          IconButton(
            icon: const Icon(
              Icons.message,
            ),

            tooltip:
                "Mostrar SnackBar",

            onPressed: () {
              mostrarSnackBar(
                "Elevación actual: $elevacion",
              );
            },
          ),

          IconButton(
            icon: const Icon(
              Icons.navigate_next,
            ),

            tooltip:
                "Ir a otra pantalla",

            onPressed: navegar,
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          Text(
            "Valor de scrolledUnderElevation: $elevacion",

            style: TextStyle(
              fontSize: 18,

              fontWeight:
                  FontWeight.bold,

              color:
                  widget.modoOscuro
                      ? Colors.white
                      : Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            sombraActiva
                ? "La sombra está activa"
                : "La sombra está desactivada",

            style: TextStyle(
              fontSize: 16,

              color:
                  widget.modoOscuro
                      ? Colors.white70
                      : Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,

              padding:
                  const EdgeInsets.all(
                    12,
                  ),

              crossAxisSpacing: 12,

              mainAxisSpacing: 12,

              children: [
                itemGrid(
                  Icons.home,
                  "Actividad 1",
                ),

                itemGrid(
                  Icons.palette,
                  "Actividad 2",
                ),

                itemGrid(
                  Icons.dark_mode,
                  "Actividad 3",
                ),

                itemGrid(
                  Icons.visibility,
                  "Actividad 4",
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.all(12),

          padding:
              const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),

          decoration: BoxDecoration(
            color:
                widget.modoOscuro
                    ? const Color(
                      0xFF203333,
                    )
                    : Colors.white,

            borderRadius:
                BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                blurRadius: 8,

                color: Colors.black
                    .withOpacity(0.15),
              ),
            ],
          ),

          child: Column(
            mainAxisSize:
                MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [
                  Text(
                    "Activar sombra",

                    style: TextStyle(
                      fontSize: 16,

                      color:
                          widget.modoOscuro
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),

                  Switch(
                    value:
                        sombraActiva,

                    activeColor:
                        const Color(
                          0xFF67D8CC,
                        ),

                    onChanged: (
                      value,
                    ) {
                      setState(() {
                        sombraActiva =
                            value;

                        elevacion =
                            value
                                ? 4
                                : 0;
                      });

                      mostrarSnackBar(
                        value
                            ? "Sombra activada"
                            : "Sombra desactivada",
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [
                  Text(
                    "Modo oscuro",

                    style: TextStyle(
                      fontSize: 16,

                      color:
                          widget.modoOscuro
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),

                  Switch(
                    value:
                        widget.modoOscuro,

                    activeColor:
                        const Color(
                          0xFF67D8CC,
                        ),

                    onChanged: (
                      value,
                    ) {
                      widget.cambiarTema();

                      mostrarSnackBar(
                        value
                            ? "Modo oscuro activado"
                            : "Modo claro activado",
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemGrid(
    IconData icono,
    String texto,
  ) {
    return Container(
      decoration: BoxDecoration(
        color:
            widget.modoOscuro
                ? const Color(
                  0xFF355B5B,
                )
                : const Color(
                  0xFFDDFBF7,
                ),

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          Icon(
            icono,

            size: 50,

            color:
                const Color(
                  0xFF2FAFA3,
                ),
          ),

          const SizedBox(height: 10),

          Text(
            texto,

            style: TextStyle(
              fontSize: 18,

              fontWeight:
                  FontWeight.bold,

              color:
                  widget.modoOscuro
                      ? Colors.white
                      : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class SegundaPantalla
    extends StatelessWidget {
  const SegundaPantalla({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF4FFFD),

      appBar: AppBar(
        title: const Text(
          "Segunda pantalla",
        ),

        centerTitle: true,

        backgroundColor:
            const Color(0xFF5BCFC3),

        foregroundColor:
            Colors.white,
      ),

      body: const Center(
        child: Text(
          "Has navegado correctamente",

          style: TextStyle(
            fontSize: 22,

            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}