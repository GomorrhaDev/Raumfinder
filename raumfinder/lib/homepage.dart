import 'package:flutter/material.dart';

class RaumfinderHomePage extends StatefulWidget {
  const RaumfinderHomePage({super.key});

  @override
  State<RaumfinderHomePage> createState() => _RaumfinderHomePageState();
}

class _RaumfinderHomePageState extends State<RaumfinderHomePage> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    final searchTerm = _searchController.text.trim();
    
    if (searchTerm.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Suche nach: $searchTerm')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Filter-Optionen würden hier angezeigt werden')),
      );
    }
  }

  void _showHistory() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verlauf wird angezeigt')),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  // Hier kommen praktisch die ganzen Widgets/ das aussehen rein
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF5EB3C7),
                    const Color(0xFF4A9DB0),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'UzL Raumfinder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2C5F6F),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            
            // Main Content
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Subtitle
                        const Text(
                          'Finde deinen Raum, schnell\nund einfach',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        
                        const SizedBox(height: 60),
                        
                        // Search Box
                        Container(
                          constraints: const BoxConstraints(maxWidth: 380),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            onSubmitted: (_) => _performSearch(),
                            decoration: InputDecoration(
                              hintText: '...',
                              hintStyle: const TextStyle(
                                color: Color(0xFFB0B0B0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xFF333333),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xFF333333),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color(0xFF4A9DB0),
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xFF333333),
                                  size: 24,
                                ),
                                onPressed: _performSearch,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Help Text
                        Container(
                          constraints: const BoxConstraints(maxWidth: 380),
                          child: const Text(
                            'Raumnamen Oder Veranstaltung Eingeben, Oder\nEinfach Auf Die Lupe Klicken Um Zu Filtern',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 80),
                        
                        // Verlauf Button
                        Container(
                          constraints: const BoxConstraints(maxWidth: 240),
                          child: ElevatedButton(
                            onPressed: _showHistory,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB8BFC4),
                              foregroundColor: const Color(0xFF333333),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 2,
                              shadowColor: Colors.black.withOpacity(0.1),
                            ),
                            child: const Text(
                              'Verlauf',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}