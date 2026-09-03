import 'package:flutter/material.dart';
import 'chatbot_panel.dart';

class DraggableChatbot extends StatefulWidget {
  final Widget child; // The main content of the screen goes here

  const DraggableChatbot({super.key, required this.child});

  @override
  State<DraggableChatbot> createState() => _DraggableChatbotState();
}

class _DraggableChatbotState extends State<DraggableChatbot> {
  Offset position = const Offset(0, 0);
  bool isPanelOpen = false;
  bool isFullScreen = false;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      // Set initial position to bottom right corner
      final size = MediaQuery.of(context).size;
      position = Offset(size.width - 100, size.height - 100);
      isInitialized = true;
    }
  }

  void _togglePanel() {
    setState(() {
      isPanelOpen = !isPanelOpen;
    });
  }
  
  void _toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        widget.child,
        
        if (isPanelOpen && isFullScreen)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: ChatbotPanel(
                onClose: _togglePanel,
                isFullScreen: isFullScreen,
                onToggleFullScreen: _toggleFullScreen,
              ),
            ),
          )
        else if (isPanelOpen)
          Positioned(
            right: size.width - position.dx < 400 ? 20 : size.width - position.dx - 350,
            bottom: size.height - position.dy < 550 ? 100 : size.height - position.dy,
            child: Material(
              color: Colors.transparent,
              child: ChatbotPanel(
                onClose: _togglePanel,
                isFullScreen: isFullScreen,
                onToggleFullScreen: _toggleFullScreen,
              ),
            ),
          ),
          
        if (!isFullScreen)
        Positioned(
          left: position.dx,
          top: position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position = Offset(
                  (position.dx + details.delta.dx).clamp(0, size.width - 70),
                  (position.dy + details.delta.dy).clamp(0, size.height - 70),
                );
              });
            },
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _togglePanel,
                customBorder: const CircleBorder(),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/chatbot_logo.png', fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
