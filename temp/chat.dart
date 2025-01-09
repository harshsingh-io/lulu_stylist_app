import 'package:flutter/material.dart';

class AIStylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildChatArea()),
          _buildInputArea(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 16,
            child: Text('AI'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Stylist',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.history), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildChatArea() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildAIMessage('Hey, How may I help you today?'),
          SizedBox(height: 16),
          _buildQuickActions(),
          SizedBox(height: 16),
          _buildWardrobeAnalysis(),
        ],
      ),
    );
  }

  Widget _buildAIMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          child: Text('AI'),
        ),
        SizedBox(width: 12),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message),
        ),
      ],
    );
  }

  Widget _buildUserMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message),
        ),
        SizedBox(width: 12),
        CircleAvatar(
          radius: 16,
          child: Text('H'),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildUserMessage('Tell me about my wardrobe'),
        // _buildActionButton('Suggest an outfit'),
        // _buildActionButton('Style advice'),
      ],
    );
  }

  Widget _buildWardrobeAnalysis() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          child: Text('AI'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAnalysisMessage(),
              SizedBox(height: 16),
              _buildWardrobeCards(),
              SizedBox(height: 16),
              _buildSummaryMessage(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnalysisMessage() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'You have a diverse and vibrant wardrobe with 30 items, predominantly from Zara. Here\'s your collection:',
      ),
    );
  }

  Widget _buildWardrobeCards() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 12),
        _buildWardrobeCard(
          icon: Icons.topic,
          title: 'Tops',
          description:
              'Variety of red and blue tops in size M from Zara, one XL from H&M',
        ),
        _buildWardrobeCard(
          icon: Icons.shopping_bag,
          title: 'Bottoms',
          description: 'Several pieces from Zara in red and blue, size M',
        ),
        _buildWardrobeCard(
          icon: Icons.watch,
          title: 'Accessories',
          description: '4 pieces including a \'Hello World\' watch in XLL',
        ),
      ],
    );
  }

  Widget _buildWardrobeCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryMessage() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Your wardrobe suggests a preference for summer styles with a color scheme focused on reds and blues - perfect for both casual and formal occasions.',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
