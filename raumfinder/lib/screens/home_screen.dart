import 'package:flutter/material.dart';
import 'package:raumfinder/screens/search_screen.dart';

class RaumfinderHomePage extends StatefulWidget {
  const RaumfinderHomePage({super.key});

  @override
  State<RaumfinderHomePage> createState() => _RaumfinderHomePageState();
}

class _RaumfinderHomePageState extends State<RaumfinderHomePage> {
  void _navigateToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchScreen()),
    );
  }


  void _showHistory() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verlauf wird angezeigt',
                  style: TextStyle(color: Color(0xFFE4E4E4))),
        backgroundColor: Color(0xFF004b5a),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
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
                    const Color(0xE0004b5a),
                    const Color(0xFF004b5a),
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
                  color: Color(0xFFE4E4E4),
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
                            color: Color(0xFF656565),
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        
                        const SizedBox(height: 60),
                        
                        // Search Box (clickable)
                        GestureDetector(
                          onTap: _navigateToSearch,
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 380),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(0xFF656565),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '...',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.search,
                                  color: Color(0xFF656565),
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 15),
                        
                        // Help Text
                        Container(
                          constraints: const BoxConstraints(maxWidth: 380),
                          child: const Text(
                            'Raumnamen bzw. Veranstaltung eingeben oder\n auf die Lupe klicken, um zu filtern',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF656565),
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
